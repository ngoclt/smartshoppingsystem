# -*- coding: utf-8 -*-
from django.conf import settings
from django.conf.urls import include, url
from django.conf.urls.static import static
from django.contrib import admin
from django.views.generic import TemplateView
from django.views import defaults as default_views


from apis import *

urlpatterns = [
    url(r'^categories/$', CategoryList.as_view(), name='categories'),
    url(r'^products/$', ProductList.as_view(), name='products'),
    url(r'^stores/$', StoreList.as_view(), name='stores'),
]

