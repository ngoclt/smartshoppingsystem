from rest_framework import viewsets
from rest_framework import generics, mixins

from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.exceptions import ValidationError

from django.shortcuts import get_object_or_404

from .serializers import *

from SmartShoppingSystem.users.permissions import IsUserOrReadOnly


class ShopperViewSet(mixins.RetrieveModelMixin,
                  mixins.UpdateModelMixin,
                  viewsets.GenericViewSet):
    """
    Updates and retrives user accounts
    """
    queryset = Shopper.objects.all()
    serializer_class = UserSerializer
    permission_classes = (IsUserOrReadOnly,)


class ShopperCreateViewSet(mixins.CreateModelMixin,
                        viewsets.GenericViewSet):
    """
    Creates user accounts
    """
    queryset = Shopper.objects.all()
    serializer_class = CreateUserSerializer
    permission_classes = (AllowAny,)


class StoreListAPIView(generics.ListAPIView):
    """
        List stores
    """
    queryset = Store.objects.all()
    serializer_class = StoreSerializer
    permission_classes = (AllowAny,)

    def get(self, request, *args, **kwargs):
        return self.list(request, *args, **kwargs)


class StoreDetailAPIView(mixins.RetrieveModelMixin,
                   generics.GenericAPIView):
    """
        Retrives store
    """
    queryset = Store.objects.all()
    serializer_class = StoreSerializer
    permission_classes = (AllowAny,)

    def get(self, request, *args, **kwargs):
        return self.list(request, *args, **kwargs)


class StoreProductListAPIView(generics.ListAPIView):
    """
        List products in store
    """
    serializer_class = ProductSerializer
    permission_classes = (AllowAny,)

    def get_queryset(self):
        pk = self.kwargs['pk']
        store = get_object_or_404(Store, id=pk)
        queryset = Product.objects.filter(categories__store=store).distinct()
        return queryset


class StoreCategoryListAPIView(generics.ListAPIView):
    """
        List products in store
    """
    serializer_class = CategorySerializer
    permission_classes = (AllowAny,)

    def get_queryset(self):
        pk = self.kwargs['pk']
        store = get_object_or_404(Store, id=pk)
        queryset = Category.objects.filter(store=store).distinct()
        return queryset


class CatetgoryProductListAPIView(generics.ListAPIView):
    """
        List products in store
    """
    serializer_class = ProductSerializer
    permission_classes = (AllowAny,)

    def get_queryset(self):
        pk = self.kwargs['pk']
        category = get_object_or_404(Category, id=pk)
        queryset = Product.objects.filter(categories=category).distinct()
        return queryset


class NotificationListAPIView(generics.ListAPIView):
    """
        List products in store
    """
    serializer_class = NotificationSerializer
    permission_classes = (IsAuthenticated,)

    def get_queryset(self):
        user = self.request.user
        queryset = Notification.objects.all()
        return queryset


class InterestCreateAPIView(generics.CreateAPIView):
    """
        Create interest for user
    """
    queryset = Interest.objects.all()
    serializer_class = CreateInterestSerializer
    permission_classes = (IsAuthenticated,)



