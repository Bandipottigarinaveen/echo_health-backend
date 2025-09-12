import random
from django.core.mail import send_mail

def generate_otp():
    return str(random.randint(100000, 999999))

def send_otp_email(email, otp):
    subject = "Your OTP for Password Reset"
    message = f"Use this OTP to reset your password: {otp}"
    from_email = "noreply@example.com"  # ✅ Change this if needed
    recipient_list = [email]
    send_mail(subject, message, from_email, recipient_list)
