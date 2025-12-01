"""
Database setup script to create initial data for testing
Run: python manage.py shell < scripts/setup_database.py
"""

from django.contrib.auth.models import User
from crm_app.models import (
    EducationalCenter, UserProfile, Branch, Subject, Group, 
    Student, Teacher, Room, Lead
)

def setup_database():
    print("Starting database setup...")
    
    # Create SuperAdmin
    try:
        superadmin_user = User.objects.create_user(
            username='superadmin',
            password='SuperAdmin@123',
            email='superadmin@crm.uz',
            first_name='Super',
            last_name='Admin'
        )
        UserProfile.objects.create(
            user=superadmin_user,
            role='SuperAdmin'
        )
        print("✓ SuperAdmin created")
    except:
        print("✗ SuperAdmin already exists")
    
    # Create Educational Center
    try:
        center = EducationalCenter.objects.create(
            name='International Language Academy',
            address='123 Main Street, Tashkent',
            phone='+998900000000',
            email='info@langacademy.uz',
            description='Premier language education center',
            license_number='LIC2024001',
            status='Active',
            website='www.langacademy.uz'
        )
        print(f"✓ Educational Center created: {center.name}")
    except:
        center = EducationalCenter.objects.get(name='International Language Academy')
        print("✗ Educational Center already exists")
    
    # Create Director
    try:
        director_user = User.objects.create_user(
            username='director1',
            password='Director@123',
            email='director@langacademy.uz',
            first_name='Alisher',
            last_name='Manshurov'
        )
        director_profile = UserProfile.objects.create(
            user=director_user,
            role='Director',
            educational_center=center,
            phone='+998900111111'
        )
        center.director = director_user
        center.save()
        print(f"✓ Director created: {director_user.get_full_name()}")
    except:
        print("✗ Director already exists")
    
    # Create Branch
    try:
        branch = Branch.objects.create(
            educational_center=center,
            name='Downtown Branch',
            address='456 Amir Temur Avenue, Tashkent',
            phone='+998900222222',
            status='Open'
        )
        print(f"✓ Branch created: {branch.name}")
    except:
        branch = Branch.objects.get(name='Downtown Branch')
        print("✗ Branch already exists")
    
    # Create Manager
    try:
        manager_user = User.objects.create_user(
            username='manager1',
            password='Manager@123',
            email='manager@langacademy.uz',
            first_name='Gulnora',
            last_name='Abdurahimova'
        )
        manager_profile = UserProfile.objects.create(
            user=manager_user,
            role='Manager',
            educational_center=center,
            phone='+998900333333'
        )
        branch.manager = manager_profile
        branch.save()
        print(f"✓ Manager created: {manager_user.get_full_name()}")
    except:
        print("✗ Manager already exists")
    
    # Create Admin
    try:
        admin_user = User.objects.create_user(
            username='admin1',
            password='Admin@123',
            email='admin@langacademy.uz',
            first_name='Sardor',
            last_name='Karimov'
        )
        admin_profile = UserProfile.objects.create(
            user=admin_user,
            role='Admin',
            educational_center=center,
            phone='+998900444444'
        )
        print(f"✓ Admin created: {admin_user.get_full_name()}")
    except:
        print("✗ Admin already exists")
    
    # Create Subjects
    subjects_data = [
        ('English Language', 'General English for beginners to advanced'),
        ('Russian Language', 'Russian language course'),
        ('Chinese Language', 'Mandarin Chinese basics'),
        ('Spanish Language', 'Spanish language fundamentals'),
    ]
    
    subjects = []
    for name, desc in subjects_data:
        try:
            subject = Subject.objects.create(
                educational_center=center,
                name=name,
                description=desc
            )
            subjects.append(subject)
            print(f"✓ Subject created: {name}")
        except:
            subject = Subject.objects.get(educational_center=center, name=name)
            subjects.append(subject)
            print(f"✗ Subject already exists: {name}")
    
    # Create Rooms
    rooms_data = [
        ('Classroom A1', 30, 'Projector, Whiteboard, AC'),
        ('Classroom A2', 25, 'Whiteboard, AC'),
        ('Lab A3', 20, 'Computers, Projector'),
    ]
    
    for name, capacity, equipment in rooms_data:
        try:
            room = Room.objects.create(
                branch=branch,
                name=name,
                capacity=capacity,
                equipment=equipment
            )
            print(f"✓ Room created: {name}")
        except:
            print(f"✗ Room already exists: {name}")
    
    # Create Teachers
    teachers_data = [
        ('John', 'Smith', 'teacher1', 'English', 'Bachelor\'s in English'),
        ('Maria', 'Rodriguez', 'teacher2', 'Spanish', 'Master\'s in Spanish'),
        ('Natasha', 'Petrova', 'teacher3', 'Russian', 'Bachelor\'s in Russian'),
    ]
    
    for fname, lname, username, spec, qual in teachers_data:
        try:
            teacher_user = User.objects.create_user(
                username=username,
                password='Teacher@123',
                email=f'{username}@langacademy.uz',
                first_name=fname,
                last_name=lname
            )
            Teacher.objects.create(
                user=teacher_user,
                branch=branch,
                specialization=spec,
                qualification=qual,
                hourly_rate=50.00
            )
            print(f"✓ Teacher created: {fname} {lname}")
        except:
            print(f"✗ Teacher already exists: {fname} {lname}")
    
    # Create Groups
    try:
        group = Group.objects.create(
            educational_center=center,
            branch=branch,
            name='English Beginners A1',
            subject=subjects[0] if subjects else None,
            teacher=Teacher.objects.first(),
            capacity=25,
            status='Active',
            start_date='2024-01-01',
            end_date='2024-03-31'
        )
        print(f"✓ Group created: {group.name}")
    except:
        print("✗ Group already exists")
    
    # Create Students
    students_data = [
        ('Ahmed', 'Uzbekov', 'student1'),
        ('Fatima', 'Karimova', 'student2'),
        ('Davron', 'Siddikov', 'student3'),
    ]
    
    for fname, lname, username in students_data:
        try:
            student_user = User.objects.create_user(
                username=username,
                password='Student@123',
                email=f'{username}@student.uz',
                first_name=fname,
                last_name=lname
            )
            Student.objects.create(
                user=student_user,
                branch=branch,
                group=Group.objects.first(),
                status='Active',
                parent_name=f'Parent of {fname}',
                parent_phone='+998900555555'
            )
            print(f"✓ Student created: {fname} {lname}")
        except:
            print(f"✗ Student already exists: {fname} {lname}")
    
    # Create Leads
    leads_data = [
        ('Akbar Hasan', '+998900666666', 'Social Media'),
        ('Nida Rashid', '+998900777777', 'Website'),
    ]
    
    for name, phone, source in leads_data:
        try:
            Lead.objects.create(
                branch=branch,
                name=name,
                email=name.lower().replace(' ', '.') + '@example.uz',
                phone=phone,
                course_interested=subjects[0] if subjects else None,
                status='New',
                source=source
            )
            print(f"✓ Lead created: {name}")
        except:
            print(f"✗ Lead already exists: {name}")
    
    print("\n✓ Database setup completed successfully!")
    print("\nTest Credentials:")
    print("=" * 50)
    print("SuperAdmin: superadmin / SuperAdmin@123")
    print("Director: director1 / Director@123")
    print("Manager: manager1 / Manager@123")
    print("Admin: admin1 / Admin@123")
    print("Teacher: teacher1 / Teacher@123")
    print("Student: student1 / Student@123")
    print("=" * 50)

if __name__ == '__main__':
    setup_database()
