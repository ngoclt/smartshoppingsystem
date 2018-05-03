from rest_framework import generics, status
from rest_framework import permissions
from rest_framework.exceptions import APIException
from rest_framework.response import Response

from djoser import views

from .models import *

from .serializers import *


class BadRequest(APIException):
    status_code = 400
    default_detail = 'Bad requests'


class RootView(views.RootView):
    urls_mapping = {}
    urls_extra_mapping = None


class CategoryList(generics.ListAPIView):
    serializer_class = CategorySerializer
    queryset = Category.objects.filter(is_active=True)
    paginator = None


class ProductList(generics.ListAPIView):
    serializer_class = ProductSerializer
    queryset = Product.objects.filter(is_active=True)
    paginator = None


class StoreList(generics.ListAPIView):
    serializer_class = StoreSerializer
    queryset = Store.objects.filter(is_active=True)
    paginator = None

