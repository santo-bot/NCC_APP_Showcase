# authentication/urls.py
from django.urls import path
from .views import UserSignUpView, UserLoginView  # Correct import

urlpatterns = [
    path('signup/', UserSignUpView.as_view(), name='signup'),
    path('login/', UserLoginView.as_view(), name='login'),  # Use UserLoginView
]
