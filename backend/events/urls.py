from django.urls import path
from .views import EventListCreateView, EventDeleteView

urlpatterns = [
    path('', EventListCreateView.as_view(), name='event-list-create'),
    path('events/<int:pk>/', EventDeleteView.as_view(), name='event-delete'),  # Make sure this is for deleting events
]
