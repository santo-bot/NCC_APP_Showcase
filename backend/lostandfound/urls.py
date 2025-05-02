from django.urls import path
from . import views

urlpatterns = [
    path('items/', views.LostFoundItemListCreate.as_view(), name='lostfound-items-list-create'),
    path('items/<int:pk>/', views.LostFoundItemRetrieveUpdateDestroy.as_view(), name='lostfound-item-retrieve-update-destroy'),
]
