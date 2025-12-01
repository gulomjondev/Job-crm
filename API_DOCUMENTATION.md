# Educational Center CRM API Documentation

## Setup Instructions

### 1. Install Dependencies
\`\`\`bash
pip install -r requirements.txt
\`\`\`

### 2. Configure Database
Create a `.env` file from `.env.example` and configure PostgreSQL credentials.

### 3. Run Migrations
\`\`\`bash
python manage.py migrate
\`\`\`

### 4. Create Superuser (for Django Admin)
\`\`\`bash
python manage.py createsuperuser
\`\`\`

### 5. Run Server
\`\`\`bash
python manage.py runserver
\`\`\`

### 6. Access Swagger Documentation
Visit: `http://localhost:8000/api/docs/`

---

## API Endpoints Overview

### Authentication
- **POST** `/api/login/` - User login (returns JWT token)

### SuperAdmin Dashoard
- **GET/POST** `/api/centers/` - Educational centers
- **GET/POST** `/api/directors/` - Director management

### Director Dashboard
- **GET/POST** `/api/branches/` - Branch management
- **GET/POST** `/api/subjects/` - Subjects/Courses
- **GET/POST** `/api/groups/` - Study groups
- **GET/POST** `/api/students/` - Student management
- **GET/POST** `/api/teachers/` - Teacher management

### Academic Management
- **GET/POST** `/api/lessons/` - Lesson scheduling
- **GET/POST** `/api/attendance/` - Attendance tracking
- **GET/POST** `/api/assignments/` - Assignment management
- **GET/POST** `/api/submissions/` - Assignment submissions
- **GET/POST** `/api/exams/` - Exam management
- **GET/POST** `/api/exam-results/` - Exam results

### Financial Management
- **GET/POST** `/api/payments/` - Payment processing
- **GET/POST** `/api/payroll/` - Teacher payroll

### Operations
- **GET/POST** `/api/rooms/` - Room management
- **GET/POST** `/api/contracts/` - Student contracts
- **GET/POST** `/api/leads/` - Marketing leads management

### User Management
- **GET/POST** `/api/notifications/` - User notifications

---

## Detailed Endpoint Documentation

### 1. Educational Centers (SuperAdmin)

#### Create Educational Center
**POST** `/api/centers/`

**Required Fields:**
- `name` - Center name
- `address` - Physical address
- `phone` - Contact phone
- `email` - Contact email

**Optional Fields:**
- `logo` - Center logo image
- `description` - Description
- `license_number` - License number
- `opened_at` - Opening date
- `status` - Active/Inactive
- `website` - Website URL
- `director` - Director ID

**Example Request:**
\`\`\`json
{
  "name": "Tech Learning Center",
  "address": "123 Main St, City",
  "phone": "+998900000000",
  "email": "info@techcenter.uz",
  "license_number": "LIC2024001",
  "status": "Active"
}
\`\`\`

**Response:**
\`\`\`json
{
  "id": 1,
  "name": "Tech Learning Center",
  "address": "123 Main St, City",
  "phone": "+998900000000",
  "email": "info@techcenter.uz",
  "status": "Active",
  "users_count": 0,
  "created_at": "2024-11-29T10:00:00Z"
}
\`\`\`

---

### 2. Director Creation (SuperAdmin)

#### Create Director User
**POST** `/api/directors/`

**Request Data:**
\`\`\`json
{
  "username": "director1",
  "password": "SecurePassword123",
  "first_name": "John",
  "last_name": "Doe",
  "email": "director@example.com",
  "role": "Director",
  "educational_center": 1,
  "phone": "+998900001111",
  "passport_number": "AA1234567",
  "birthday": "1980-01-15",
  "image": null
}
\`\`\`

**Response:**
\`\`\`json
{
  "id": 1,
  "user": {
    "id": 1,
    "username": "director1",
    "email": "director@example.com"
  },
  "role": "Director",
  "educational_center": 1,
  "phone": "+998900001111",
  "created_at": "2024-11-29T10:00:00Z"
}
\`\`\`

---

### 3. User Login

#### Login Endpoint
**POST** `/api/login/`

**Request:**
\`\`\`json
{
  "username": "director1",
  "password": "SecurePassword123"
}
\`\`\`

**Response:**
\`\`\`json
{
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9...",
  "refresh": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9...",
  "user_id": 1,
  "username": "director1",
  "role": "Director",
  "center_id": 1
}
\`\`\`

**How to use token:**
\`\`\`
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9...
\`\`\`

---

### 4. Branches Management

#### Create Branch
**POST** `/api/branches/`

\`\`\`json
{
  "educational_center": 1,
  "name": "Downtown Branch",
  "address": "456 Park Ave",
  "phone": "+998900002222",
  "manager": 1,
  "status": "Open"
}
\`\`\`

#### List Branches
**GET** `/api/branches/`

**Response:**
\`\`\`json
{
  "count": 1,
  "next": null,
  "previous": null,
  "results": [
    {
      "id": 1,
      "educational_center": 1,
      "center_name": "Tech Learning Center",
      "name": "Downtown Branch",
      "address": "456 Park Ave",
      "phone": "+998900002222",
      "manager": 1,
      "manager_name": "John Doe",
      "status": "Open",
      "created_at": "2024-11-29T10:00:00Z"
    }
  ]
}
\`\`\`

#### Open/Close Branch
**POST** `/api/branches/{id}/open/`
**POST** `/api/branches/{id}/close/`

---

### 5. Subjects Management

#### Create Subject
**POST** `/api/subjects/`

\`\`\`json
{
  "educational_center": 1,
  "name": "English Language",
  "description": "Comprehensive English language course"
}
\`\`\`

#### List Subjects
**GET** `/api/subjects/`

---

### 6. Groups Management

#### Create Group
**POST** `/api/groups/`

\`\`\`json
{
  "educational_center": 1,
  "branch": 1,
  "name": "English Beginners A1",
  "subject": 1,
  "teacher": 1,
  "capacity": 30,
  "status": "Active",
  "start_date": "2024-01-01",
  "end_date": "2024-03-31"
}
\`\`\`

#### Get Group Statistics
**GET** `/api/groups/{id}/statistics/`

**Response:**
\`\`\`json
{
  "students_count": 25,
  "lessons_count": 48,
  "average_attendance": 92.5,
  "payment_status": {
    "total_payments": 15000,
    "payment_count": 25
  }
}
\`\`\`

#### Get Attendance Report
**GET** `/api/groups/{id}/attendance-report/`

---

### 7. Student Management

#### Create Student
**POST** `/api/students/`

\`\`\`json
{
  "user": {
    "username": "student1",
    "password": "StudentPass123",
    "first_name": "Alice",
    "last_name": "Smith",
    "email": "alice@example.com"
  },
  "branch": 1,
  "group": 1,
  "status": "Active",
  "parent_name": "Bob Smith",
  "parent_phone": "+998900003333"
}
\`\`\`

#### Assign Student to Group
**POST** `/api/students/{id}/assign-group/`

\`\`\`json
{
  "group_id": 2
}
\`\`\`

#### Get Student Attendance History
**GET** `/api/students/{id}/attendance-history/`

#### Get Student Payment History
**GET** `/api/students/{id}/payment-history/`

#### Block Student
**POST** `/api/students/{id}/block/`

---

### 8. Teacher Management

#### Create Teacher
**POST** `/api/teachers/`

\`\`\`json
{
  "user": {
    "username": "teacher1",
    "password": "TeacherPass123",
    "first_name": "Michael",
    "last_name": "Johnson"
  },
  "branch": 1,
  "specialization": "English Language",
  "qualification": "Bachelor's in Linguistics",
  "hourly_rate": 50.00,
  "status": "Active"
}
\`\`\`

#### Rate Teacher Performance
**POST** `/api/teachers/{id}/rate/`

\`\`\`json
{
  "rating": 4.5
}
\`\`\`

#### Get Teacher Schedule
**GET** `/api/teachers/{id}/schedule/`

#### Get Teacher Performance Metrics
**GET** `/api/teachers/{id}/performance/`

---

### 9. Lessons Management

#### Create Lesson
**POST** `/api/lessons/`

\`\`\`json
{
  "group": 1,
  "teacher": 1,
  "room": 1,
  "date": "2024-12-01",
  "start_time": "10:00:00",
  "end_time": "11:30:00",
  "duration": 90
}
\`\`\`

#### Cancel Lesson
**POST** `/api/lessons/{id}/cancel/`

#### Generate Online Meeting Link
**POST** `/api/lessons/{id}/generate-online-link/`

**Response:**
\`\`\`json
{
  "online_link": "https://meet.example.com/abc123def456"
}
\`\`\`

---

### 10. Attendance Management

#### Mark Attendance
**POST** `/api/attendance/`

\`\`\`json
{
  "lesson": 1,
  "student": 1,
  "status": "Present",
  "notes": "Student was attentive"
}
\`\`\`

#### Bulk Mark Attendance
**POST** `/api/attendance/bulk-mark/`

\`\`\`json
{
  "lesson_id": 1,
  "attendance_data": [
    {
      "student_id": 1,
      "status": "Present",
      "notes": ""
    },
    {
      "student_id": 2,
      "status": "Absent",
      "notes": "Called in sick"
    },
    {
      "student_id": 3,
      "status": "Late",
      "notes": ""
    }
  ]
}
\`\`\`

---

### 11. Payment Management

#### Record Payment
**POST** `/api/payments/`

\`\`\`json
{
  "student": 1,
  "group": 1,
  "amount": 500.00,
  "payment_type": "Cash",
  "due_date": "2024-12-31",
  "receipt_number": "REC20241201001"
}
\`\`\`

#### List Debtors
**GET** `/api/payments/debtors/`

#### Get Payment Statistics
**GET** `/api/payments/statistics/`

**Response:**
\`\`\`json
{
  "total_revenue": 25000,
  "payment_count": 50,
  "average_payment": 500
}
\`\`\`

---

### 12. Assignment Management

#### Create Assignment
**POST** `/api/assignments/`

\`\`\`json
{
  "group": 1,
  "teacher": 1,
  "title": "Homework: Chapter 5",
  "description": "Complete exercises 1-10",
  "due_date": "2024-12-05",
  "status": "Assigned"
}
\`\`\`

#### Submit Assignment
**POST** `/api/submissions/`

\`\`\`json
{
  "assignment": 1,
  "student": 1,
  "submission_file": "<file>"
}
\`\`\`

#### Grade Assignment
**PUT** `/api/submissions/{id}/`

\`\`\`json
{
  "grade": "A",
  "feedback": "Excellent work!"
}
\`\`\`

---

### 13. Exam Management

#### Create Exam
**POST** `/api/exams/`

\`\`\`json
{
  "group": 1,
  "teacher": 1,
  "title": "Midterm Exam",
  "exam_date": "2024-12-15",
  "start_time": "09:00:00",
  "end_time": "11:00:00",
  "total_points": 100,
  "passing_score": 60
}
\`\`\`

#### Submit Exam Result
**POST** `/api/exam-results/`

\`\`\`json
{
  "exam": 1,
  "student": 1,
  "score": 85,
  "answer_file": "<file>"
}
\`\`\`

#### Get Exam Results
**GET** `/api/exams/{id}/results/`

---

### 14. Room Management

#### Create Room
**POST** `/api/rooms/`

\`\`\`json
{
  "branch": 1,
  "name": "Classroom A1",
  "capacity": 30,
  "equipment": "Projector, Whiteboard, AC"
}
\`\`\`

#### Toggle Room Availability
**POST** `/api/rooms/{id}/toggle-availability/`

---

### 15. Payroll Management

#### Create Payroll Record
**POST** `/api/payroll/`

\`\`\`json
{
  "teacher": 1,
  "month": "2024-12",
  "base_salary": 2000.00,
  "bonus": 200.00,
  "penalty": 50.00,
  "total_salary": 2150.00
}
\`\`\`

#### Mark Payroll as Paid
**POST** `/api/payroll/{id}/mark-paid/`

---

### 16. Notifications

#### Get User Notifications
**GET** `/api/notifications/`

#### Mark All Notifications as Read
**POST** `/api/notifications/mark-all-read/`

---

### 17. Contracts

#### Create Contract
**POST** `/api/contracts/`

\`\`\`json
{
  "student": 1,
  "group": 1,
  "contract_number": "CON20241201001",
  "contract_file": "<file>",
  "signed_date": "2024-12-01"
}
\`\`\`

#### Verify Contract
**POST** `/api/contracts/{id}/verify/`

---

### 18. Leads Management

#### Create Lead
**POST** `/api/leads/`

\`\`\`json
{
  "branch": 1,
  "name": "John Prospect",
  "email": "prospect@example.com",
  "phone": "+998900005555",
  "course_interested": 1,
  "source": "Social Media",
  "status": "New"
}
\`\`\`

#### Get Lead Conversion Statistics
**GET** `/api/leads/statistics/`

**Response:**
\`\`\`json
{
  "total_leads": 100,
  "converted_leads": 45,
  "conversion_rate": 45.0
}
\`\`\`

---

## Error Responses

### 400 Bad Request
\`\`\`json
{
  "error": "Invalid request data"
}
\`\`\`

### 401 Unauthorized
\`\`\`json
{
  "error": "Invalid credentials"
}
\`\`\`

### 403 Forbidden
\`\`\`json
{
  "error": "You don't have permission to access this resource"
}
\`\`\`

### 404 Not Found
\`\`\`json
{
  "error": "Resource not found"
}
\`\`\`

### 500 Internal Server Error
\`\`\`json
{
  "error": "Internal server error"
}
\`\`\`

---

## Pagination

All list endpoints support pagination with the following query parameters:

- `page` - Page number (default: 1)
- `page_size` - Number of items per page (default: 20)

**Example:**
\`\`\`
GET /api/students/?page=2&page_size=10
\`\`\`

---

## Filtering

Most endpoints support filtering. Example:

\`\`\`
GET /api/students/?status=Active&branch=1
\`\`\`

---

## Testing with cURL

### Login
\`\`\`bash
curl -X POST http://localhost:8000/api/login/ \
  -H "Content-Type: application/json" \
  -d '{"username":"director1","password":"password123"}'
\`\`\`

### Create Center (with token)
\`\`\`bash
curl -X POST http://localhost:8000/api/centers/ \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -d '{
    "name": "Tech Center",
    "address": "123 Main St",
    "phone": "+998900000000",
    "email": "info@techcenter.uz"
  }'
\`\`\`

---

## Deployment

### Using Gunicorn + Nginx
\`\`\`bash
pip install gunicorn
gunicorn crm_project.wsgi --bind 0.0.0.0:8000
\`\`\`

### Using Docker
Create a `Dockerfile` and `docker-compose.yml` for containerization.

---

## Notes

- All timestamps are in UTC (ISO 8601 format)
- JWT tokens expire after 24 hours
- Refresh tokens are valid for 7 days
- Always send the Bearer token in the Authorization header
- For file uploads, use multipart/form-data content type
