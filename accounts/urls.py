from django.urls import path, include
from .views import register
from django.contrib.auth import views

app_name = 'accounts'
urlpatterns = [
    # path('', include('django.contrib.auth.urls')),
    path('login/', views.LoginView.as_view(redirect_authenticated_user=True), name='login'),
    path('logout/', views.LogoutView.as_view(), name='logout'),
    path('register/', register, name='register')
]

