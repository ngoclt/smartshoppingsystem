# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin

from .models import Manager, Shopper, Store, Product, Category
from .forms import ProductAdminForm

# Register your models here.


class ShopperAdmin(admin.ModelAdmin):
    fieldsets = [
        (None,
         {'fields': ['username', 'email', 'password', 'first_name', 'last_name', 'gender', 'avatar', 'is_active']})
    ]

    list_display_links = ('username', 'first_name', 'last_name', 'email')
    list_display = ('username', 'first_name', 'last_name', 'email')
    list_per_page = 50
    search_fields = ['first_name', 'last_name', 'username', 'email']
    ordering = ['username']


admin.site.register(Shopper, ShopperAdmin)


class ManagerAdmin(admin.ModelAdmin):
    fieldsets = [
        (None,
         {'fields': ['username', 'email', 'password', 'first_name', 'last_name', 'gender', 'avatar', 'is_active', 'is_staff']})
    ]

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


admin.site.register(Category, CategoryAdmin)
