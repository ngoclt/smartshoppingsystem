# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from copy import deepcopy

from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin

from .models import Manager, Shopper, Store, Product, Category, Beacon, Notification, Interest
from .forms import ProductAdminForm, ManagerAdminCreationForm, ManagerAdminChangeForm

# Register your models here.


class ShopperAdmin(admin.ModelAdmin):

    form = ManagerAdminChangeForm
    add_form = ManagerAdminCreationForm

    list_display_links = ('username', 'first_name', 'last_name', 'email')
    list_display = ('username', 'first_name', 'last_name', 'email')
    list_per_page = 50
    search_fields = ['first_name', 'last_name', 'username', 'email']
    ordering = ['username']


admin.site.register(Shopper, ShopperAdmin)


class ManagerAdmin(BaseUserAdmin):

    form = ManagerAdminChangeForm
    add_form = ManagerAdminCreationForm

    list_display_links = ('username', 'first_name', 'last_name', 'email')
    list_display = ('username', 'first_name', 'last_name', 'email')
    list_per_page = 50
    search_fields = ['first_name', 'last_name', 'username', 'email']
    ordering = ['username']


admin.site.register(Manager, ManagerAdmin)


class StoreAdmin(admin.ModelAdmin):
    list_display = ('name', 'address', 'phone', 'joined_at',)
    list_display_links = ('name',)
    list_per_page = 50
    search_fields = ['name', 'address']
    ordering = ['name']

    def get_fieldsets(self, request, obj=None):
        """Custom override to exclude fields"""
        fieldsets = deepcopy(super(StoreAdmin, self).get_fieldsets(request, obj))

        # Append excludes here instead of using self.exclude.
        # When fieldsets are defined for the user admin, so self.exclude is ignored.
        exclude = ()

        if not request.user.is_superuser:
            exclude += ('manager', 'is_active')

        # Iterate fieldsets
        for fieldset in fieldsets:
            fieldset_fields = fieldset[1]['fields']

            # Remove excluded fields from the fieldset
            for exclude_field in exclude:
                if exclude_field in fieldset_fields:
                    fieldset_fields = tuple(field for field in fieldset_fields if field != exclude_field)  # Filter
                    fieldset[1]['fields'] = fieldset_fields  # Store new tuple

        return fieldsets

    def get_queryset(self, request):
        qs = super(StoreAdmin, self).get_queryset(request)
        if request.user.is_superuser:
            return qs

        return qs.filter(manager=request.user)


admin.site.register(Store, StoreAdmin)


class ProductAdmin(admin.ModelAdmin):
    form = ProductAdminForm
    # sets values for how the admin site lists your products
    list_display = ('name', 'price', 'old_price', 'created_at', 'updated_at',)
    # which of the fields in 'list_display' tuple link to admin product page
    list_display_links = ('name',)
    list_per_page = 50
    ordering = ['-created_at']
    search_fields = ['name', 'description', 'meta_keywords', 'meta_description']
    exclude = ('created_at', 'updated_at',)
    # sets up slug to be generated from product name
    prepopulated_fields = {'slug': ('name',)}

    def formfield_for_manytomany(self, db_field, request, **kwargs):
        if not request.user.is_superuser and db_field.name == "categories":
            kwargs['queryset'] = Category.objects.filter(
                store__in=Store.objects.filter(manager=request.user)
            )

        return super().formfield_for_manytomany(db_field, request, **kwargs)

    def get_queryset(self, request):
        qs = super(ProductAdmin, self).get_queryset(request)
        if request.user.is_superuser:
            return qs

        # get products in store that manager is manage
        return qs.filter(categories__store__in=Store.objects.filter(manager=request.user))


admin.site.register(Product, ProductAdmin)


class CategoryAdmin(admin.ModelAdmin):
    # sets up values for how admin site lists categories
    list_display = ('name', 'created_at', 'updated_at',)
    list_display_links = ('name',)
    list_per_page = 20
    ordering = ['name']
    search_fields = ['name', 'description', 'meta_keywords', 'meta_description']
    exclude = ('created_at', 'updated_at',)

    # sets up slug to be generated from category name
    prepopulated_fields = {'slug': ('name',)}

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if not request.user.is_superuser and db_field.name == "store":
            kwargs['queryset'] = Store.objects.filter(manager=request.user)

        return super().formfield_for_foreignkey(db_field, request, **kwargs)

    def get_queryset(self, request):
        qs = super(CategoryAdmin, self).get_queryset(request)
        if request.user.is_superuser:
            return qs

        # get products in store that manager is manage
        return qs.filter(store__in=Store.objects.filter(manager=request.user))


admin.site.register(Category, CategoryAdmin)


class BeaconAdmin(admin.ModelAdmin):
    # sets up values for how admin site lists categories
    list_display = ('name', 'beacon_id',)
    list_per_page = 20
    ordering = ['name']

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if not request.user.is_superuser and db_field.name == "store":
            kwargs['queryset'] = Store.objects.filter(manager=request.user)

        return super().formfield_for_foreignkey(db_field, request, **kwargs)

    def get_queryset(self, request):
        qs = super(BeaconAdmin, self).get_queryset(request)
        if request.user.is_superuser:
            return qs

        # get products in store that manager is manage
        return qs.filter(store__in=Store.objects.filter(manager=request.user))


admin.site.register(Beacon, BeaconAdmin)


class NotificationAdmin(admin.ModelAdmin):
    # sets up values for how admin site lists categories
    list_per_page = 20
    list_display = ('title', 'message', 'get_beacons')
    ordering = ['expired_at']

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if not request.user.is_superuser and db_field.name == "store":
            kwargs['queryset'] = Store.objects.filter(manager=request.user)

        return super().formfield_for_foreignkey(db_field, request, **kwargs)

    def get_queryset(self, request):
        qs = super(NotificationAdmin, self).get_queryset(request)
        if request.user.is_superuser:
            return qs

        # get products in store that manager is manage
        return qs.filter(store__in=Store.objects.filter(manager=request.user))

    def get_beacons(self, obj):
        if obj.beacons:
            return ", ".join(beacon.name for beacon in obj.beacons.all())
        else:
            return 'None'

    get_beacons.short_description = 'Beacons'


admin.site.register(Notification, NotificationAdmin)


class InterestAdmin(admin.ModelAdmin):
    # sets up values for how admin site lists categories
    list_per_page = 20


admin.site.register(Interest, InterestAdmin)


