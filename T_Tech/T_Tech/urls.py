from django.contrib import admin
from django.contrib.auth import views as auth_views
from django.urls import path, include, re_path
from django.conf import settings
from django.conf.urls.static import static
from django.views.static import serve
# from . import views

admin.site.site_header = 'Torres Technology Center Corporation'
admin.site.site_title = "T-TECH"
admin.site.index_title = "Welcome to T-TECH Admin Page"
admin.site.enable_nav_sidebar = False


urlpatterns = [
    path('admin/', admin.site.urls),
    path('iboard/', include('iboard.urls')),
    path('contractor/', include('contractor.urls')),
    path('login/', auth_views.LoginView.as_view(template_name='T_Tech/login.html'), name='login'),
    re_path(r'^media/(?P<path>.*)$', serve,{'document_root': settings.MEDIA_ROOT}),
    re_path(r'^static/(?P<path>.*)$', serve,{'document_root': settings.STATIC_URL}),
]


# if settings.DEBUG:
#     urlpatterns += static(settings.MEDIA_URL,
#                             document_root=settings.MEDIA_ROOT)
