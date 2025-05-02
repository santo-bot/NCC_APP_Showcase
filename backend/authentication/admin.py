from django.contrib import admin
from django.contrib.auth.models import User

# Create a custom admin class
class UserAdmin(admin.ModelAdmin):
    # List the fields you want to display
    list_display = ('username', 'email', 'is_staff', 'is_active', 'date_joined')

    # Make the username and email fields clickable (so you can edit them directly)
    search_fields = ('username', 'email')

# Register the custom UserAdmin
admin.site.unregister(User)
admin.site.register(User, UserAdmin)
