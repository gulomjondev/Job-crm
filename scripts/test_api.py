"""
API Testing Script
Run: python manage.py shell < scripts/test_api.py
"""

import json
import requests
from datetime import datetime, timedelta

BASE_URL = 'http://localhost:8000/api'

class APITester:
    def __init__(self):
        self.token = None
        self.headers = {}
    
    def login(self, username, password):
        """Login and get JWT token"""
        response = requests.post(
            f'{BASE_URL}/login/',
            json={'username': username, 'password': password}
        )
        if response.status_code == 200:
            self.token = response.json()['token']
            self.headers = {
                'Authorization': f'Bearer {self.token}',
                'Content-Type': 'application/json'
            }
            print(f"✓ Logged in as {username}")
            print(f"Token: {self.token[:20]}...\n")
            return True
        else:
            print(f"✗ Login failed: {response.text}")
            return False
    
    def test_get(self, endpoint, name=""):
        """Test GET request"""
        url = f'{BASE_URL}{endpoint}'
        response = requests.get(url, headers=self.headers)
        status = "✓" if response.status_code == 200 else "✗"
        print(f"{status} GET {endpoint} - {response.status_code}")
        return response.json() if response.status_code == 200 else None
    
    def test_post(self, endpoint, data, name=""):
        """Test POST request"""
        url = f'{BASE_URL}{endpoint}'
        response = requests.post(url, json=data, headers=self.headers)
        status = "✓" if response.status_code in [200, 201] else "✗"
        print(f"{status} POST {endpoint} - {response.status_code}")
        return response.json() if response.status_code in [200, 201] else None
    
    def run_tests(self):
        """Run comprehensive API tests"""
        print("=" * 60)
        print("EDUCATIONAL CENTER CRM API TESTS")
        print("=" * 60 + "\n")
        
        # Login as Director
        print("1. AUTHENTICATION TEST")
        print("-" * 40)
        if not self.login('director1', 'Director@123'):
            return
        
        # Test Centers
        print("\n2. CENTERS API")
        print("-" * 40)
        centers = self.test_get('/centers/', 'List centers')
        if centers:
            print(f"   Total centers: {centers.get('count', 0)}\n")
        
        # Test Branches
        print("\n3. BRANCHES API")
        print("-" * 40)
        branches = self.test_get('/branches/', 'List branches')
        if branches:
            print(f"   Total branches: {branches.get('count', 0)}\n")
        
        # Test Subjects
        print("\n4. SUBJECTS API")
        print("-" * 40)
        subjects = self.test_get('/subjects/', 'List subjects')
        if subjects:
            print(f"   Total subjects: {subjects.get('count', 0)}\n")
        
        # Test Groups
        print("\n5. GROUPS API")
        print("-" * 40)
        groups = self.test_get('/groups/', 'List groups')
        if groups:
            print(f"   Total groups: {groups.get('count', 0)}\n")
        
        # Test Students
        print("\n6. STUDENTS API")
        print("-" * 40)
        students = self.test_get('/students/', 'List students')
        if students:
            print(f"   Total students: {students.get('count', 0)}\n")
        
        # Test Teachers
        print("\n7. TEACHERS API")
        print("-" * 40)
        teachers = self.test_get('/teachers/', 'List teachers')
        if teachers:
            print(f"   Total teachers: {teachers.get('count', 0)}\n")
        
        # Test Payments
        print("\n8. PAYMENTS API")
        print("-" * 40)
        payments = self.test_get('/payments/', 'List payments')
        if payments:
            print(f"   Total payments: {payments.get('count', 0)}\n")
        
        # Test Attendance
        print("\n9. ATTENDANCE API")
        print("-" * 40)
        attendance = self.test_get('/attendance/', 'List attendance')
        if attendance:
            print(f"   Total records: {attendance.get('count', 0)}\n")
        
        # Test Lessons
        print("\n10. LESSONS API")
        print("-" * 40)
        lessons = self.test_get('/lessons/', 'List lessons')
        if lessons:
            print(f"   Total lessons: {lessons.get('count', 0)}\n")
        
        # Test Exams
        print("\n11. EXAMS API")
        print("-" * 40)
        exams = self.test_get('/exams/', 'List exams')
        if exams:
            print(f"   Total exams: {exams.get('count', 0)}\n")
        
        # Test Rooms
        print("\n12. ROOMS API")
        print("-" * 40)
        rooms = self.test_get('/rooms/', 'List rooms')
        if rooms:
            print(f"   Total rooms: {rooms.get('count', 0)}\n")
        
        # Test Leads
        print("\n13. LEADS API")
        print("-" * 40)
        leads = self.test_get('/leads/', 'List leads')
        if leads:
            print(f"   Total leads: {leads.get('count', 0)}\n")
        
        print("\n" + "=" * 60)
        print("API TESTS COMPLETED")
        print("=" * 60)

if __name__ == '__main__':
    tester = APITester()
    tester.run_tests()
