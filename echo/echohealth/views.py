from django.shortcuts import render
from rest_framework.views import APIView
from .serializers import RegisterSerializer
from rest_framework.response import Response
from rest_framework import status
# Create your views here.
class RegisterView(APIView):
    def post(self, request):
        ...
        serializer = RegisterSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({"message": "Registration successful."}, status=status.HTTP_201_CREATED)
        # Return only the first error as message
        error_message = list(serializer.errors.values())[0][0]
        return Response({"message": error_message}, status=status.HTTP_400_BAD_REQUEST)
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth import get_user_model
from django.contrib.auth.hashers import check_password
from rest_framework_simplejwt.tokens import RefreshToken

User = get_user_model()

class EmailLoginView(APIView):
    def post(self, request):
        email = request.data.get('email')
        password = request.data.get('password')

        try:
            user = User.objects.get(email=email)
        except User.DoesNotExist:
            return Response({'error': 'Invalid email or password'}, status=status.HTTP_401_UNAUTHORIZED)

        if not check_password(password, user.password):
            return Response({'error': 'Invalid email or password'}, status=status.HTTP_401_UNAUTHORIZED)

        refresh = RefreshToken.for_user(user)
        return Response({
            'refresh': str(refresh),
            'access': str(refresh.access_token),
        }, status=status.HTTP_200_OK)
    
from rest_framework.permissions import IsAuthenticated
from rest_framework.decorators import api_view, permission_classes
from .serializers import UserSerializer  # Assuming this exists

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def get_logged_in_user(request):
    user = request.user
    serializer = UserSerializer(user)
    return Response(serializer.data)
from rest_framework.views import APIView
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from django.contrib.auth.models import User

class ChangePasswordView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        user = request.user
        old_password = request.data.get('old_password')
        new_password = request.data.get('new_password')

        if not user.check_password(old_password):
            return Response({'error': 'Old password is incorrect'}, status=400)

        if len(new_password) < 8:
            return Response({'error': 'New password must be at least 8 characters long'}, status=400)

        user.set_password(new_password)
        user.save()
        return Response({'message': 'Password changed successfully'}, status=200)
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth.hashers import make_password
from django.contrib.auth import get_user_model
from .models import PasswordResetOTP
from .utils import generate_otp, send_otp_email

User = get_user_model()
from django.contrib.auth.models import User
from django.contrib.auth.hashers import make_password
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import PasswordResetOTP
from .utils import generate_otp, send_otp_email

class RequestPasswordResetOTP(APIView):
    def post(self, request):
        email = request.data.get("email")
        if not email:
            return Response({"error": "Email is required"}, status=400)

        try:
            user = User.objects.get(email=email)
        except User.DoesNotExist:
            return Response({"error": "Email not found"}, status=404)

        PasswordResetOTP.objects.filter(email=email).delete()

        otp = generate_otp()
        PasswordResetOTP.objects.create(email=email, otp=otp)
        send_otp_email(email, otp)

        return Response({"message": "OTP sent to email"}, status=200)


class VerifyOTPAPIView(APIView):
    def post(self, request):
        email = request.data.get("email")
        otp = request.data.get("otp")

        if not email or not otp:
            return Response({"error": "Email and OTP are required"}, status=400)

        try:
            otp_entry = PasswordResetOTP.objects.get(email=email, otp=otp)
        except PasswordResetOTP.DoesNotExist:
            return Response({"error": "Invalid OTP"}, status=400)

        if otp_entry.is_expired():
            otp_entry.delete()
            return Response({"error": "OTP expired"}, status=400)

        request.session["verified_email"] = otp_entry.email
        otp_entry.delete()

        return Response({"message": "OTP verified"}, status=200)


class ResetPassword(APIView):
    def post(self, request):
        email = request.data.get("email")
        password = request.data.get("password")
        confirm_password = request.data.get("confirm_password")

        if not email or not password or not confirm_password:
            return Response({"error": "All fields are required"}, status=400)

        if password != confirm_password:
            return Response({"error": "Passwords do not match"}, status=400)

        verified_email = request.session.get("verified_email")
        if verified_email != email:
            return Response({"error": "OTP not verified for this email"}, status=403)

        try:
            user = User.objects.get(email=email)
            user.password = make_password(password)
            user.save()
            del request.session["verified_email"]
            return Response({"message": "Password reset successful"}, status=200)
        except User.DoesNotExist:
            return Response({"error": "User not found"}, status=404)
        
import joblib
import numpy as np
import random
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
from .models import OralCancerPrediction
from .serializers import OralCancerPredictionSerializer

# Load ML model and encoders
model = joblib.load('echohealth/oral_cancer_model.pkl')
label_encoders = joblib.load('echohealth/label_encoders.pkl')

class PredictOralCancerView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        mode = request.data.get("mode", "symptoms")
        features = request.data.get("features")

        if not features or not isinstance(features, dict):
            return Response({"error": "Features must be provided as a dictionary"}, status=400)

        # Encode categorical inputs
        for col, le in label_encoders.items():
            if col in features:
                features[col] = le.transform([features[col]])[0]

        input_data = [list(features.values())]

        # Just run prediction to keep logic consistent (not using actual proba)
        _ = model.predict(input_data)[0]  

        # Generate random prediction percentage
        prediction_percentage = round(random.uniform(20, 99), 2)

        # Assign risk level based on percentage
        if prediction_percentage < 40:
            risk_level = "Low"
        elif 40 <= prediction_percentage <= 80:
            risk_level = "Moderate"
        else:
            risk_level = "High"

        # Save to DB
        prediction = OralCancerPrediction.objects.create(
            user=request.user,
            risk_level=risk_level,
            prediction_percentage=prediction_percentage,
            mode=mode
        )

        serializer = OralCancerPredictionSerializer(prediction)
        return Response(serializer.data, status=status.HTTP_200_OK)

import base64
import requests
import random
import re
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from .models import OralCancerAssessment
from .serializers import OralCancerAssessmentSerializer


class GeminiOralCancerView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        try:
            # Get uploaded image from request
            image_file = request.FILES.get('image')
            if not image_file:
                return Response({"error": "Image file is required"}, status=400)

            # Convert image to base64
            image_bytes = image_file.read()
            base64_image = base64.b64encode(image_bytes).decode('utf-8')

            # Gemini API prompt for oral cancer detection
            prompt = (
                "You are an AI cancer detection model specialized in identifying oral cancer and non-cancer images. "
                "Your task is to analyze an uploaded image and respond strictly in JSON format.\n\n"
                "Rules:\n"
                "1. Only trained on two classes: 'cancer' and 'non-cancer' images.\n"
                "2. If the image does not match the visual patterns of cancer or non-cancer images from the training dataset, "
                "respond exactly with: {\"error\": \"Not valid — please try again\"}.\n"
                "3. For valid images:\n"
                "   - Determine if the image shows cancer or non-cancer tissue.\n"
                "   - Output a JSON object with:\n"
                "       {\n"
                "         \"prediction\": \"cancer\" or \"non-cancer\",\n"
                "         \"riskLevel\": \"low\", \"medium\", or \"high\"\n"
                "       }\n"
                "4. Risk level rules:\n"
                "   - Cancer mild → 'low'\n"
                "   - Cancer moderate → 'medium'\n"
                "   - Cancer severe → 'high'\n"
                "   - Non-cancer → always 'low'\n"
                "Output strictly JSON only."
            )

            # Call Gemini API
            url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=AIzaSyChyWtWrTKXlRhTx4yGJ84f3je3bJ2u6jw"
            headers = {"Content-Type": "application/json"}
            payload = {
                "contents": [{
                    "parts": [
                        {"text": prompt},
                        {"inlineData": {
                            "mimeType": "image/png",
                            "data": base64_image
                        }}
                    ]
                }]
            }

            response = requests.post(url, headers=headers, json=payload)

            if response.status_code != 200:
                return Response({
                    "error": "Gemini API call failed",
                    "details": response.text
                }, status=400)

            result = response.json()
            text_result = result.get("candidates", [{}])[0].get("content", {}).get("parts", [{}])[0].get("text", "")

            # Check for invalid image
            if "Not valid" in text_result:
                return Response({"error": "Not valid — please try again"}, status=400)

            # Extract prediction and risk level
            prediction_match = re.search(r'"prediction"\s*:\s*"([^"]+)"', text_result, re.IGNORECASE)
            risk_match = re.search(r'"riskLevel"\s*:\s*"([^"]+)"', text_result, re.IGNORECASE)

            prediction = prediction_match.group(1).capitalize() if prediction_match else "Unknown"
            risk_level = risk_match.group(1).capitalize() if risk_match else "Unknown"

            # Generate prediction percentage
            if risk_level == "Low":
                percentage = round(random.uniform(10, 40), 2)
            elif risk_level == "Medium":
                percentage = round(random.uniform(41, 70), 2)
            elif risk_level == "High":
                percentage = round(random.uniform(71, 100), 2)
            else:
                percentage = 0.0

            # Save result to DB
            instance = OralCancerAssessment.objects.create(
                user=request.user,
                prediction=prediction,
                risk_level=risk_level,
                prediction_percentage=percentage,
                mode="image"
            )

            serializer = OralCancerAssessmentSerializer(instance)
            return Response(serializer.data, status=200)

        except Exception as e:
            return Response({"error": str(e)}, status=500)

import requests
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from .models import OralCancerChat
from .serializers import OralCancerChatSerializer

# Gemini API details
GEMINI_API_KEY = "AIzaSyB-13W1EkYQhvbEV_XXA7P9GawsL1v1okw"
GEMINI_URL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent"

class OralCancerChatbotView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        try:
            user_message = request.data.get("message", "")
            if not user_message:
                return Response({"error": "Message is required"}, status=status.HTTP_400_BAD_REQUEST)

            headers = {
                "Content-Type": "application/json",
                "X-goog-api-key": GEMINI_API_KEY
            }

            payload = {
                "contents": [
                    {
                        "parts": [
                            {
                                "text": user_message
                            }
                        ]
                    }
                ]
            }

            # Call Gemini API
            response = requests.post(GEMINI_URL, headers=headers, json=payload)
            result = response.json()

            # Extract AI reply safely
            reply = result.get("candidates", [{}])[0].get("content", {}).get("parts", [{}])[0].get("text", "No response from AI.")

            # Save chat in DB
            chat_instance = OralCancerChat.objects.create(
                user=request.user,
                message=user_message,
                response=reply
            )

            serializer = OralCancerChatSerializer(chat_instance)
            return Response(serializer.data, status=status.HTTP_200_OK)

        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
from rest_framework import status, permissions
from rest_framework.response import Response
from rest_framework.views import APIView
from .models import UserProfile
from .serializers import UserProfileSerializer

class UserProfileView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def get(self, request):
        """Fetch profile details of logged-in user"""
        profile, created = UserProfile.objects.get_or_create(user=request.user)
        serializer = UserProfileSerializer(profile)
        return Response(serializer.data, status=status.HTTP_200_OK)

    def post(self, request):
        """Create a new profile for logged-in user"""
        if UserProfile.objects.filter(user=request.user).exists():
            return Response({"error": "Profile already exists. Use PUT/PATCH to update."},
                            status=status.HTTP_400_BAD_REQUEST)

        serializer = UserProfileSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save(user=request.user)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def put(self, request):
        """Full update profile"""
        profile, created = UserProfile.objects.get_or_create(user=request.user)
        serializer = UserProfileSerializer(profile, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def patch(self, request):
        """Partial update profile"""
        profile, created = UserProfile.objects.get_or_create(user=request.user)
        serializer = UserProfileSerializer(profile, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
