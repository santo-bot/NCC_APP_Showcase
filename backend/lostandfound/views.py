from rest_framework import generics
from .models import LostFoundItem
from .serializers import LostFoundItemSerializer

# View to list and create lost and found items
class LostFoundItemListCreate(generics.ListCreateAPIView):
    queryset = LostFoundItem.objects.all().order_by('-reported_at')  # List all items ordered by reported_at
    serializer_class = LostFoundItemSerializer

    # Optionally, we can override perform_create if needed to handle custom logic
    def perform_create(self, serializer):
        serializer.save()

# View to retrieve, update, and delete an individual lost and found item
class LostFoundItemRetrieveUpdateDestroy(generics.RetrieveUpdateDestroyAPIView):
    queryset = LostFoundItem.objects.all()
    serializer_class = LostFoundItemSerializer
