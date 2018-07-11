from rest_framework import viewsets
from rest_framework import generics, status, mixins
from rest_framework.response import Response
from rest_framework.exceptions import APIException

from rest_framework.permissions import AllowAny, IsAuthenticated

from django.shortcuts import get_object_or_404

from .serializers import *

from SmartShoppingSystem.users.permissions import IsUserOrReadOnly

class BadRequest(APIException):
    status_code = 400
    default_detail = 'Bad request'


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


class InterestListCreateAPIView(generics.ListCreateAPIView):
    """
        Create & delete interest for user
    """
    queryset = Interest.objects.all()
    serializer_class = CreateInterestSerializer
    permission_classes = (IsAuthenticated,)

    def get_queryset(self):
        ret = super(InterestListCreateAPIView, self).get_queryset()
        return ret.filter(owner__id=self.request.user.id)

    def post(self, request, *args, **kwargs):
        product = request.data.get('product', None)
        category = request.data.get('category', None)

        if not product and not category:
            raise BadRequest('Product or Category is required.')

        serializer = self.get_serializer(data=request.data)

        if serializer.is_valid(raise_exception=True):
            shopper = get_object_or_404(Shopper, pk=self.request.user)
            queryset = Interest.objects.filter(owner=shopper, product=product, category=category)

            if queryset.count() == 0:
                serializer.save(owner=shopper)
                headers = self.get_success_headers(serializer.data)
                return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)
            else:
                raise BadRequest('Product or Category is liked already.')

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class InterestDestroyAPIView(generics.DestroyAPIView):
    queryset = Interest.objects.all()
    serializer_class = InterestSerializer
    permission_classes = (IsAuthenticated,)

    def delete(self, request, *args, **kwargs):
        return self.destroy(request, *args, **kwargs)








