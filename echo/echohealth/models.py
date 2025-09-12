from django.db import models
from django.utils import timezone
from datetime import timedelta

class PasswordResetOTP(models.Model):
    email = models.EmailField()
    otp = models.CharField(max_length=6)
    created_at = models.DateTimeField(auto_now_add=True)

    def is_expired(self):
        return timezone.now() > self.created_at + timedelta(minutes=10)

    def __str__(self):
        return f"{self.email} - {self.otp}"
from django.db import models
from django.contrib.auth.models import User

class OralCancerPrediction(models.Model):
    MODE_CHOICES = [
        ('symptoms', 'Symptoms'),
        ('image', 'Image'),
    ]
    
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="predictions")
    risk_level = models.CharField(max_length=50)
    prediction_percentage = models.FloatField()
    mode = models.CharField(max_length=20, choices=MODE_CHOICES)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.user.username} - {self.risk_level} ({self.mode})"
from django.db import models
from django.conf import settings

class OralCancerAssessment(models.Model):
    RISK_CHOICES = [
        ("Low", "Low"),
        ("Medium", "Medium"),
        ("High", "High"),
    ]

    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    prediction = models.CharField(max_length=50)  # cancer / non-cancer
    risk_level = models.CharField(max_length=10, choices=RISK_CHOICES)
    prediction_percentage = models.FloatField()
    mode = models.CharField(max_length=20, default="image")
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.user.username} - {self.prediction} ({self.risk_level})"

from django.db import models
from django.conf import settings

class OralCancerChat(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    message = models.TextField()  # User's question/message
    response = models.TextField()  # Gemini's reply
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Chat by {self.user.username} at {self.created_at}"

from django.db import models
from django.contrib.auth.models import User

class UserProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name="profile")
    full_name = models.CharField(max_length=255, blank=True)
    date_of_birth = models.DateField(null=True, blank=True)
    phone_number = models.CharField(max_length=20, blank=True)
    photo = models.ImageField(upload_to='profile_photos/', blank=True, null=True)

    def __str__(self):
        return self.user.username
