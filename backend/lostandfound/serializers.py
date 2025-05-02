from rest_framework import serializers
from .models import LostFoundItem

class LostFoundItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = LostFoundItem
        fields = ['id', 'title', 'description', 'reported_at']
