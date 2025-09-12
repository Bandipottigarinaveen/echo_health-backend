from django.urls import path
from django.urls import path
from . import views
from .views import RegisterView,EmailLoginView,ChangePasswordView,RequestPasswordResetOTP,VerifyOTPAPIView,ResetPassword,PredictOralCancerView,GeminiOralCancerView,OralCancerChatbotView,UserProfileView

urlpatterns=[
    path('register/', RegisterView.as_view(), name='register'),
    path('login/', EmailLoginView.as_view(), name='email_login'),
    path('api/change-password/',ChangePasswordView.as_view(), name='change-password'),
   path('request-otp/', RequestPasswordResetOTP.as_view(), name='request-otp'),
    path('verify-otp/', VerifyOTPAPIView.as_view(), name='verify-otp'),
    path('reset-password/', ResetPassword.as_view(), name='reset-password'),
     path('predict/', PredictOralCancerView.as_view(), name='predict_oral_cancer'),
    path('oral-cancer-detect/', GeminiOralCancerView.as_view(), name='oral-cancer-detect'),
     path('oral-cancer-chat/', OralCancerChatbotView.as_view(), name='oral-cancer-chat'),
       path("profile/", UserProfileView.as_view(), name="user-profile"),
]

