from rest_framework import generics
from rest_framework.permissions import AllowAny
from .models import Event
from .serializers import EventSerializer

# List and Create events
class EventListCreateView(generics.ListCreateAPIView):
    queryset = Event.objects.all()
    serializer_class = EventSerializer
    permission_classes = [AllowAny]

# Delete a specific event
class EventDeleteView(generics.DestroyAPIView):
    queryset = Event.objects.all()
    serializer_class = EventSerializer
    permission_classes = [AllowAny]
