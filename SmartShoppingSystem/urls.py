from django.conf import settings
from django.urls import path, re_path, include, reverse_lazy
from django.conf.urls.static import static
from django.contrib import admin
from django.views.generic.base import RedirectView
from rest_framework.authtoken import views


urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/v1/', include('SmartShoppingSystem.store.urls')),
    path('api/v1/api-token-auth/', views.obtain_auth_token),
    path('api/v1/api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    path('api/v1/rest-auth/', include('rest_auth.urls')),

    # the 'api-root' from django rest-frameworks default router
    # http://www.django-rest-framework.org/api-guide/routers/#defaultrouter
    re_path(r'^$', RedirectView.as_view(url=reverse_lazy('api-root'), permanent=False)),

] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

admin.site.site_header = "Smart Shopping System"
admin.site.site_title = "Store Management Portal"
admin.site.index_title = "Welcome to Smart Shopping System"
