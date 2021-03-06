# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

from SmartShoppingSystem.users.models import User

from SmartShoppingSystem.storage import OverwriteStorage

from django.utils.timezone import now

class Manager(User):
    begin_time = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = "Manager"
        verbose_name_plural = "Managers"

    def __str__(self):
        return self.last_name + ' ' + self.first_name


class Shopper(User):
    address_line = models.CharField(max_length=100, blank=True, default='')
    telephone = models.CharField(max_length=100, blank=True, default='')
    zip_code = models.CharField(max_length=20, blank=True, default='')
    state = models.CharField(max_length=100, blank=True, default='')
    country = models.CharField(max_length=100, blank=True, default='')

    class Meta:
        verbose_name = "Shopper"
        verbose_name_plural = "Shoppers"

    def __str__(self):
        return self.last_name + ' ' + self.first_name


class Store(models.Model):
    name = models.CharField(max_length=100, blank=True, default='')
    address = models.CharField(max_length=300, blank=True, default='')
    phone = models.CharField(max_length=30, blank=True, default='')
    manager = models.ManyToManyField(Manager, blank=True)
    cover = models.ImageField(storage=OverwriteStorage(), upload_to='upload/images/stores', null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    joined_at = models.DateTimeField(auto_now=True)
    is_active = models.BooleanField(default=True)

    class Meta:
        ordering = ('name',)

    def __str__(self):
        return self.name


class Category(models.Model):
    """ model class containing information about a category in the product catalog """
    name = models.CharField(max_length=50)
    thumbnail = models.ImageField(storage=OverwriteStorage(), upload_to='upload/images/categories', null=True, blank=True)
    slug = models.SlugField(max_length=50, unique=True,
                            help_text='Unique value for product page URL, created automatically from name.')
    description = models.TextField()
    is_active = models.BooleanField(default=True)
    meta_keywords = models.CharField(max_length=255,
                                     help_text='Comma-delimited set of SEO keywords for keywords meta tag')
    meta_description = models.CharField(max_length=255,
                                        help_text='Content for description meta tag')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    store = models.ForeignKey(Store, null=True, on_delete=models.SET_NULL)

    class Meta:
        db_table = 'categories'
        ordering = ['name']
        verbose_name_plural = 'Categories'

    def __str__(self):
        return self.name


    @property
    def products(self):
        return Product.gql('WHERE category = :1', self.key())


class Product(models.Model):
    """ model class containing information about a product; instances of this class are what the user
    adds to their shopping cart and can subsequently purchase

    """
    name = models.CharField(max_length=255, unique=True)
    slug = models.SlugField(max_length=255, unique=True,
                            help_text='Unique value for product page URL, created automatically from name.')
    brand = models.CharField(max_length=50)
    sku = models.CharField(max_length=50)
    price = models.DecimalField(max_digits=9, decimal_places=2)
    old_price = models.DecimalField(max_digits=9, decimal_places=2,
                                    blank=True, default=0.00)
    is_active = models.BooleanField(default=True)
    is_bestseller = models.BooleanField(default=False)
    is_featured = models.BooleanField(default=False)
    quantity = models.IntegerField()
    description = models.TextField()
    meta_keywords = models.CharField("Meta Keywords", max_length=255,
                                     help_text='Comma-delimited set of SEO keywords for keywords meta tag')
    meta_description = models.CharField("Meta Description", max_length=255,
                                        help_text='Content for description meta tag')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    categories = models.ManyToManyField(Category)

    image = models.ImageField(storage=OverwriteStorage(), upload_to='upload/images/products/main', null=True, blank=True)
    thumbnail = models.ImageField(storage=OverwriteStorage(), upload_to='upload/images/products/thumbnails', null=True, blank=True)
    image_caption = models.CharField(max_length=200)

    class Meta:
        db_table = 'products'
        ordering = ['-created_at']

    def __str__(self):
        return self.name


class Beacon(models.Model):
    name = models.CharField(max_length=255, unique=True)
    beacon_id = models.CharField(max_length=255, null=False, unique=True)
    store = models.ForeignKey(Store, null=False, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name


class Notification(models.Model):
    title = models.CharField(max_length=255, null=False)
    message = models.CharField(max_length=255, null=False)
    beacons = models.ManyToManyField(Beacon, blank=True)
    product = models.ForeignKey(Product, null=True, blank=True, on_delete=models.SET_NULL)
    category = models.ForeignKey(Category, null=True, blank=True, on_delete=models.SET_NULL)
    store = models.ForeignKey(Store, null=False, on_delete=models.CASCADE)
    started_at = models.DateTimeField(editable=True, blank=True, default=now())
    expired_at = models.DateTimeField(editable=True, blank=True)

    def __str__(self):
        return self.title


class Interest(models.Model):
    owner = models.ForeignKey(Shopper, null=False, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, null=True, blank=True, on_delete=models.SET_NULL)
    category = models.ForeignKey(Category, null=True, blank=True, on_delete=models.SET_NULL)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        string = '' if self.product is None else self.product.name
        string += '' if self.category is None else (", " + self.category.name)
        return self.owner.first_name + ' likes ' + string

