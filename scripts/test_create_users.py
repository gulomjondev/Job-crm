"""
Comprehensive test script to create users with different roles and login/password
This script demonstrates the complete workflow for creating:
1. Director with login/password
2. Teacher with login/password  
3. Student with complete information
"""

import os
import sys
import django

# Setup Django
sys.path.insert(0, '/path/to/crm_project')
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'crm_project.settings')
django.setup()

from django.contrib.auth.models import User
from crm_app.models import (
    EducationalCenter, UserProfile, Branch, Subject, Group, 
    Student, Teacher
)
from datetime import datetime, timedelta


def print_header(title):
    """Print section header"""
    print(f"\n{'='*60}")
    print(f"  {title}")
    print(f"{'='*60}")


def print_success(message):
    """Print success message"""
    print(f"✅ {message}")


def print_info(message):
    """Print info message"""
    print(f"ℹ️  {message}")


def create_center():
    """Create test educational center"""
    print_header("STEP 1: Creating Educational Center")
    
    center, created = EducationalCenter.objects.get_or_create(
        name="Test Center",
        defaults={
            'address': "123 Main Street, City",
            'phone': '+998901234567',
            'email': 'center@test.com',
            'description': 'Test Educational Center',
            'license_number': 'LIC001',
            'status': 'Active',
            'website': 'https://test.com'
        }
    )
    
    if created:
        print_success(f"Created Educational Center: {center.name}")
    else:
        print_info(f"Educational Center already exists: {center.name}")
    
    return center


def create_branch(center):
    """Create test branch"""
    print_header("STEP 2: Creating Branch")
    
    branch, created = Branch.objects.get_or_create(
        educational_center=center,
        name="Main Branch",
        defaults={
            'address': "123 Main Street, City",
            'phone': '+998901234567',
            'status': 'Open'
        }
    )
    
    if created:
        print_success(f"Created Branch: {branch.name}")
    else:
        print_info(f"Branch already exists: {branch.name}")
    
    return branch


def create_subject(center):
    """Create test subject"""
    print_header("STEP 3: Creating Subject/Course")
    
    subject, created = Subject.objects.get_or_create(
        educational_center=center,
        name="English",
        defaults={
            'description': 'English Language Course'
        }
    )
    
    if created:
        print_success(f"Created Subject: {subject.name}")
    else:
        print_info(f"Subject already exists: {subject.name}")
    
    return subject


def create_group(center, branch, subject):
    """Create test group"""
    print_header("STEP 4: Creating Group")
    
    group, created = Group.objects.get_or_create(
        educational_center=center,
        branch=branch,
        name="Group A1",
        defaults={
            'subject': subject,
            'capacity': 30,
            'status': 'Active',
            'start_date': datetime.now().date(),
            'end_date': (datetime.now() + timedelta(days=90)).date()
        }
    )
    
    if created:
        print_success(f"Created Group: {group.name}")
    else:
        print_info(f"Group already exists: {group.name}")
    
    return group


def create_director(center):
    """Create Director with login/password"""
    print_header("STEP 5: Creating DIRECTOR with Login/Password")
    
    # Create User with login/password
    director_user, user_created = User.objects.get_or_create(
        username='director1',
        defaults={
            'first_name': 'John',
            'last_name': 'Director',
            'email': 'director@test.com',
        }
    )
    
    # Set password
    if user_created:
        director_user.set_password('Director@123')
        director_user.save()
        print_success(f"Created User: {director_user.username}")
        print_info(f"Password set: Director@123")
    else:
        print_info(f"User already exists: {director_user.username}")
    
    # Create or update UserProfile
    profile, profile_created = UserProfile.objects.get_or_create(
        user=director_user,
        defaults={
            'role': 'Director',
            'educational_center': center,
            'phone': '+998901234567',
        }
    )
    
    if profile_created:
        print_success(f"Created UserProfile: {profile.user.get_full_name()} - {profile.role}")
    else:
        print_info(f"UserProfile already exists")
    
    # Link director to center
    center.director = director_user
    center.save()
    print_success(f"Linked Director to Educational Center")
    
    return director_user, profile


def create_teacher(branch, center):
    """Create Teacher with login/password and complete information"""
    print_header("STEP 6: Creating TEACHER with Login/Password & Information")
    
    # Create User with login/password
    teacher_user, user_created = User.objects.get_or_create(
        username='teacher1',
        defaults={
            'first_name': 'Alice',
            'last_name': 'Teacher',
            'email': 'teacher@test.com',
        }
    )
    
    # Set password
    if user_created:
        teacher_user.set_password('Teacher@123')
        teacher_user.save()
        print_success(f"Created User: {teacher_user.username}")
        print_info(f"Password set: Teacher@123")
    else:
        print_info(f"User already exists: {teacher_user.username}")
    
    # Create UserProfile
    profile, profile_created = UserProfile.objects.get_or_create(
        user=teacher_user,
        defaults={
            'role': 'Teacher',
            'educational_center': center,
            'phone': '+998909876543',
        }
    )
    
    # Create Teacher record with detailed information
    teacher, teacher_created = Teacher.objects.get_or_create(
        user=teacher_user,
        defaults={
            'branch': branch,
            'status': 'Active',
            'phone': '+998909876543',
            'date_of_birth': datetime(1990, 5, 15).date(),
            'specialization': 'English Literature',
            'qualification': 'Master\'s Degree in Education',
            'performance_rating': 4.5,
            'hourly_rate': 50000,
            'address': '456 Teacher Street, City',
            'passport_number': 'AA123456789',
        }
    )
    
    if teacher_created:
        print_success(f"Created Teacher: {teacher.user.get_full_name()}")
        print_info(f"  - Phone: {teacher.phone}")
        print_info(f"  - Date of Birth: {teacher.date_of_birth}")
        print_info(f"  - Specialization: {teacher.specialization}")
        print_info(f"  - Hourly Rate: {teacher.hourly_rate}")
    else:
        print_info(f"Teacher already exists")
    
    return teacher_user, profile, teacher


def create_student(branch, center, group):
    """Create Student with login/password and complete information"""
    print_header("STEP 7: Creating STUDENT with Login/Password & Complete Information")
    
    # Create User with login/password
    student_user, user_created = User.objects.get_or_create(
        username='student1',
        defaults={
            'first_name': 'Bob',
            'last_name': 'Student',
            'email': 'student@test.com',
        }
    )
    
    # Set password
    if user_created:
        student_user.set_password('Student@123')
        student_user.save()
        print_success(f"Created User: {student_user.username}")
        print_info(f"Password set: Student@123")
    else:
        print_info(f"User already exists: {student_user.username}")
    
    # Create UserProfile
    profile, profile_created = UserProfile.objects.get_or_create(
        user=student_user,
        defaults={
            'role': 'Student',
            'educational_center': center,
            'phone': '+998908765432',
        }
    )
    
    # Create Student record with detailed information
    student, student_created = Student.objects.get_or_create(
        user=student_user,
        defaults={
            'group': group,
            'branch': branch,
            'status': 'Active',
            'phone': '+998908765432',
            'date_of_birth': datetime(2005, 3, 20).date(),
            'parent_name': 'Michael Student',
            'parent_phone': '+998907654321',
            'parent_email': 'parent@test.com',
            'address': '789 Student Avenue, City',
            'passport_number': 'BB987654321',
        }
    )
    
    if student_created:
        print_success(f"Created Student: {student.user.get_full_name()}")
        print_info(f"  - Phone: {student.phone}")
        print_info(f"  - Group: {student.group.name}")
        print_info(f"  - Date of Birth: {student.date_of_birth}")
        print_info(f"  - Parent Name: {student.parent_name}")
        print_info(f"  - Parent Phone: {student.parent_phone}")
        print_info(f"  - Address: {student.address}")
    else:
        print_info(f"Student already exists")
    
    return student_user, profile, student


def print_login_summary():
    """Print login summary for all created users"""
    print_header("LOGIN CREDENTIALS SUMMARY")
    
    print("\n🔐 DIRECTOR LOGIN:")
    print("  Username: director1")
    print("  Password: Director@123")
    print("  Role: Director")
    print("  Dashboard: Director Dashboard")
    
    print("\n🔐 TEACHER LOGIN:")
    print("  Username: teacher1")
    print("  Password: Teacher@123")
    print("  Role: Teacher")
    print("  Dashboard: Teacher Dashboard")
    
    print("\n🔐 STUDENT LOGIN:")
    print("  Username: student1")
    print("  Password: Student@123")
    print("  Role: Student")
    print("  Dashboard: Student Dashboard")


def print_api_examples():
    """Print API usage examples"""
    print_header("API TESTING EXAMPLES (Using cURL)")
    
    print("\n1️⃣  LOGIN TO GET TOKEN:")
    print("""
curl -X POST http://localhost:8000/api/auth/login/ \\
  -H "Content-Type: application/json" \\
  -d '{
    "username": "director1",
    "password": "Director@123"
  }'
    """)
    
    print("\n2️⃣  GET DIRECTOR PROFILE (Using Token):")
    print("""
curl -X GET http://localhost:8000/api/users/ \\
  -H "Authorization: Bearer <your_token_here>"
    """)
    
    print("\n3️⃣  GET ALL STUDENTS:")
    print("""
curl -X GET http://localhost:8000/api/students/
    """)
    
    print("\n4️⃣  GET ALL TEACHERS:")
    print("""
curl -X GET http://localhost:8000/api/teachers/
    """)
    
    print("\n5️⃣  GET ALL GROUPS:")
    print("""
curl -X GET http://localhost:8000/api/groups/
    """)


def main():
    """Main execution"""
    print_header("COMPLETE USER CREATION & LOGIN SETUP")
    print("This script creates a complete test environment with all user types")
    
    try:
        # Step 1-4: Create foundation
        center = create_center()
        branch = create_branch(center)
        subject = create_subject(center)
        group = create_group(center, branch, subject)
        
        # Step 5-7: Create users with login/password
        director_user, director_profile = create_director(center)
        teacher_user, teacher_profile, teacher = create_teacher(branch, center)
        student_user, student_profile, student = create_student(branch, center, group)
        
        # Print summary
        print_login_summary()
        print_api_examples()
        
        print_header("SETUP COMPLETE ✅")
        print("You can now:")
        print("1. Test login with the credentials above")
        print("2. Access the Swagger UI: http://localhost:8000/api/docs/")
        print("3. Use the token to access protected endpoints")
        print("4. Each user will be redirected to their respective dashboard based on role")
        
    except Exception as e:
        print(f"\n❌ Error: {str(e)}")
        import traceback
        traceback.print_exc()


if __name__ == '__main__':
    main()
