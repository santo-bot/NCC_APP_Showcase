from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),  # This includes the Django admin interface
    path('api/auth/', include('authentication.urls')),
    path('api/lostandfound/', include('lostandfound.urls')),
    path('api/events/', include('events.urls')),
]
