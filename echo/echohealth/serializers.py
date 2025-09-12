from rest_framework import serializers
from django.contrib.auth.models import User
class RegisterSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)

    class Meta:
        model = User
        fields = ['username', 'email', 'password']

    def validate(self, data):
        errors = {}

        if User.objects.filter(username=data['username']).exists():
            errors['username'] = "Username already exists."

        if User.objects.filter(email=data['email']).exists():
            errors['email'] = "Email already exists."

        if errors:
            raise serializers.ValidationError(errors)  # Raise both errors 

        return data

    def create(self, validated_data):
        return User.objects.create_user(
            username=validated_data['username'],
            email=validated_data['email'],
            password=validated_data['password']
        )
from django.contrib.auth import get_user_model
from rest_framework import serializers

User = get_user_model()

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'email']
from rest_framework import serializers
from django.contrib.auth.models import User

class ChangePasswordSerializer(serializers.Serializer):
    old_password = serializers.CharField(required=True)
    new_password = serializers.CharField(required=True, min_length=8)

    def validate_new_password(self, value):
        if len(value) < 8:
            raise serializers.ValidationError("Password must be at least 8 characters long.")
        return value
from rest_framework import serializers
from .models import OralCancerPrediction

class OralCancerPredictionSerializer(serializers.ModelSerializer):
    class Meta:
        model = OralCancerPrediction
        fields = ['id', 'risk_level', 'prediction_percentage', 'mode', 'created_at']

from rest_framework import serializers
from .models import OralCancerAssessment

class OralCancerAssessmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = OralCancerAssessment
        fields = '__all__'

from rest_framework import serializers
from .models import OralCancerChat

class OralCancerChatSerializer(serializers.ModelSerializer):
    class Meta:
        model = OralCancerChat
        fields = '__all__'

from rest_framework import serializers
from .models import UserProfile
from django.contrib.auth.models import User

class UserProfileSerializer(serializers.ModelSerializer):
    username = serializers.CharField(source='user.username', required=False)
    email = serializers.EmailField(source='user.email', required=False)

    class Meta:
        model = UserProfile
        fields = ['photo', 'full_name', 'username', 'email', 'date_of_birth', 'phone_number']

    def update(self, instance, validated_data):
        user_data = validated_data.pop('user', {})

        # Update user table (username/email) safely
        if 'username' in user_data:
            if User.objects.exclude(pk=instance.user.pk).filter(username=user_data['username']).exists():
                raise serializers.ValidationError({"username": "This username is already taken."})
            instance.user.username = user_data['username']

        if 'email' in user_data:
            if User.objects.exclude(pk=instance.user.pk).filter(email=user_data['email']).exists():
                raise serializers.ValidationError({"email": "This email is already taken."})
            instance.user.email = user_data['email']

        instance.user.save()

        # Update profile table
        return super().update(instance, validated_data)
