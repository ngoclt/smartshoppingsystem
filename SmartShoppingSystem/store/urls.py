from django.conf.urls import url

from rest_framework.routers import DefaultRouter

from .apis import *

router = DefaultRouter()
router.register(r'^shoppers', ShopperViewSet)
router.register(r'^shoppers', ShopperCreateViewSet)

urlpatterns = [
    url(r'^stores/$', StoreListAPIView.as_view()),
    url(r'^stores/(?P<pk>[0-9]+)/$', StoreDetailAPIView.as_view()),
    url(r'^stores/(?P<pk>[0-9]+)/categories/$', StoreCategoryListAPIView.as_view()),
    url(r'^stores/(?P<pk>[0-9]+)/products/$', StoreProductListAPIView.as_view()),
    url(r'^categories/(?P<pk>[0-9]+)/products/$', CatetgoryProductListAPIView.as_view()),
    url(r'^interests/$', InterestListCreateAPIView.as_view()),
    url(r'^interests/(?P<pk>[0-9]+)/$', InterestDestroyAPIView.as_view()),
    url(r'^interests/category/(?P<pk>[0-9]+)/$', RemoveInterestedCategoryAPIView.as_view()),
    url(r'^interests/product/(?P<pk>[0-9]+)/$', RemoveInterestedProductAPIView.as_view()),
    url(r'^notifications/$', NotificationListAPIView.as_view()),
    url(r'^beacons/(?P<beacon_id>[-\w]+)/$', BeaconAPIView.as_view()),
] + router.urls
