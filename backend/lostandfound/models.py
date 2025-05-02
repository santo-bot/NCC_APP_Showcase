from django.db import models

class LostFoundItem(models.Model):
    title = models.CharField(max_length=255)
    description = models.TextField()
    reported_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title
