from rest_framework import viewsets, mixins
from rest_framework.permissions import AllowAny
from .models import Shopper
from SmartShoppingSystem.users.permissions import IsUserOrReadOnly
from .serializers import CreateUserSerializer, UserSerializer


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
