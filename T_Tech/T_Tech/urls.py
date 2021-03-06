from django.contrib import admin
from django.contrib.auth import views as auth_views
from django.urls import path, include, re_path
from django.conf import settings
from django.conf.urls.static import static
from django.views.static import serve

admin.site.site_header = 'Torres Technology Center Corporation'
admin.site.site_title = "T-TECH"
admin.site.index_title = "Welcome to T-TECH Admin Page"
admin.site.enable_nav_sidebar = False


urlpatterns = [
    path('admin/', admin.site.urls, name='admin'),
    path('', include('iboard.urls')),
    path('office/', include('office.urls')),
    path('creform/', include('creform.urls')),
    path('fabrication/', include('fabrication.urls')),
    path('rbf/', include('rbf.urls')),
    path('hr/', include('hr.urls')),
    path('contractor/', include('contractor.urls')),
    path('login/', auth_views.LoginView.as_view(template_name='T_Tech/login.html'), name='login'),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
    path('api/', include('api.urls'))

]


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL,
                            document_root=settings.MEDIA_ROOT)
