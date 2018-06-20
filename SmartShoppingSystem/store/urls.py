from django.conf.urls import url
from rest_framework.routers import DefaultRouter

from .apis import StoreListAPIView, StoreDetailAPIView, StoreProductListAPIView, StoreCategoryListAPIView, CatetgoryProductListAPIView
from .apis import ShopperViewSet, ShopperCreateViewSet

router = DefaultRouter()
router.register(r'^shoppers', ShopperViewSet)
router.register(r'^shoppers', ShopperCreateViewSet)

urlpatterns = [
    url(r'^stores/$', StoreListAPIView.as_view()),
    url(r'^stores/(?P<pk>[0-9]+)/$', StoreDetailAPIView.as_view()),
    url(r'^stores/(?P<pk>[0-9]+)/categories/$', StoreCategoryListAPIView.as_view()),
    url(r'^stores/(?P<pk>[0-9]+)/products/$', StoreProductListAPIView.as_view()),
    url(r'^categories/(?P<pk>[0-9]+)/products/$', CatetgoryProductListAPIView.as_view()),
] + router.urls