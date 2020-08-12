from django.contrib import admin
from django.contrib.auth import views as auth_views
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
# from . import views


admin.site.site_title = "T-TECH"
admin.site.index_title = ""


urlpatterns = [
    path('admin/', admin.site.urls),
    path('iboard/', include('iboard.urls')),
    path('contractor/', include('contractor.urls')),
]


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL,
                            document_root=settings.MEDIA_ROOT)
