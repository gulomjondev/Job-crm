# Educational Center CRM - Complete API Endpoints Guide

## Quick Navigation
- [Authentication](#authentication)
- [Educational Centers (SuperAdmin)](#1-educational-centers-superadmin)
- [Directors (SuperAdmin)](#2-directors-superadmin)
- [Branches (Director/Manager)](#3-branches-directormanager)
- [Subjects/Courses (Director)](#4-subjectscourses-director)
- [Groups/Classes (Director)](#5-groupsclasses-director)
- [Students](#6-students)
- [Teachers](#7-teachers)
- [Lessons](#8-lessons)
- [Attendance](#9-attendance)
- [Payments](#10-payments)
- [Assignments](#11-assignments)
- [Assignment Submissions](#12-assignment-submissions)
- [Exams](#13-exams)
- [Exam Results](#14-exam-results)
- [Rooms](#15-rooms)
- [Payroll](#16-payroll)
- [Notifications](#17-notifications)
- [Contracts](#18-contracts)
- [Leads](#19-leads)

---

## Authentication

### Login - Get JWT Token
\`\`\`
POST /api/auth/login/
\`\`\`

**Authentication:** AllowAny

**Request Body:**
\`\`\`json
{
  "username": "director1",
  "password": "Director@123"
}
\`\`\`

**Response (200 OK):**
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

**Usage in Headers:**
\`\`\`
Authorization: Bearer {token}
\`\`\`

---

## 1. Educational Centers (SuperAdmin)

**Base URL:** `/api/centers/`

### 1.1 List All Centers
\`\`\`
GET /api/centers/
\`\`\`
**Authentication:** IsAuthenticated (SuperAdmin)
**Query Parameters:** page, page_size

**Response (200 OK):**
\`\`\`json
{
  "count": 2,
  "next": null,
  "previous": null,
  "results": [
    {
      "id": 1,
      "name": "Elite Education Center",
      "address": "Tashkent, Uzbekistan",
      "phone": "+998901234567",
      "email": "info@elite.uz",
      "logo": "https://...",
      "description": "Leading education center",
      "license_number": "LIC-2024-001",
      "opened_at": "2024-01-01",
      "status": "Active",
      "website": "https://elite.uz",
      "director": 1,
      "director_name": "John Doe",
      "users_count": 45,
      "created_at": "2024-01-01T10:00:00Z",
      "updated_at": "2024-01-01T10:00:00Z"
    }
  ]
}
\`\`\`

---

### 1.2 Create New Center
\`\`\`
POST /api/centers/
\`\`\`
**Authentication:** IsAuthenticated (SuperAdmin)

**Request Body:**
\`\`\`json
{
  "name": "New Education Center",
  "address": "Samarkand, Uzbekistan",
  "phone": "+998901234567",
  "email": "new@center.uz",
  "logo": "file_upload",
  "description": "Description here",
  "license_number": "LIC-2024-002",
  "opened_at": "2024-01-01",
  "status": "Active",
  "website": "https://newcenter.uz",
  "director": null
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 2,
  "name": "New Education Center",
  "address": "Samarkand, Uzbekistan",
  "phone": "+998901234567",
  "email": "new@center.uz",
  ...
}
\`\`\`

---

### 1.3 Get Center Details
\`\`\`
GET /api/centers/{id}/
\`\`\`
**Authentication:** IsAuthenticated
**Parameters:** id - Center ID

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "name": "Elite Education Center",
  ...
}
\`\`\`

---

### 1.4 Update Center (Full)
\`\`\`
PUT /api/centers/{id}/
\`\`\`
**Authentication:** IsAuthenticated (SuperAdmin)
**Parameters:** id - Center ID

**Request Body:**
\`\`\`json
{
  "name": "Updated Center Name",
  "address": "New Address",
  "phone": "+998901234567",
  "email": "updated@center.uz",
  "status": "Active"
}
\`\`\`

**Response (200 OK):** Updated center object

---

### 1.5 Partial Update Center
\`\`\`
PATCH /api/centers/{id}/
\`\`\`
**Authentication:** IsAuthenticated (SuperAdmin)
**Parameters:** id - Center ID

**Request Body:**
\`\`\`json
{
  "status": "Inactive"
}
\`\`\`

**Response (200 OK):** Updated center object

---

### 1.6 Delete Center
\`\`\`
DELETE /api/centers/{id}/
\`\`\`
**Authentication:** IsAuthenticated (SuperAdmin)
**Parameters:** id - Center ID

**Response (204 No Content)**

---

### 1.7 Activate Center
\`\`\`
POST /api/centers/{id}/activate/
\`\`\`
**Authentication:** IsAuthenticated (SuperAdmin)
**Parameters:** id - Center ID

**Request Body:** {} (empty)

**Response (200 OK):**
\`\`\`json
{
  "status": "Center activated"
}
\`\`\`

---

### 1.8 Deactivate Center
\`\`\`
POST /api/centers/{id}/deactivate/
\`\`\`
**Authentication:** IsAuthenticated (SuperAdmin)
**Parameters:** id - Center ID

**Request Body:** {} (empty)

**Response (200 OK):**
\`\`\`json
{
  "status": "Center deactivated"
}
\`\`\`

---

## 2. Directors (SuperAdmin)

**Base URL:** `/api/directors/`

### 2.1 List All Directors
\`\`\`
GET /api/directors/
\`\`\`
**Authentication:** IsAuthenticated (SuperAdmin)

**Response (200 OK):**
\`\`\`json
{
  "count": 3,
  "results": [
    {
      "id": 1,
      "user": {
        "id": 1,
        "username": "director1",
        "email": "director1@center.uz",
        "first_name": "John",
        "last_name": "Doe"
      },
      "role": "Director",
      "educational_center": 1,
      "phone": "+998901234567",
      "passport_number": "AA0123456",
      "birthday": "1990-05-15",
      "image": "https://...",
      "is_blocked": false,
      "created_at": "2024-01-01T10:00:00Z"
    }
  ]
}
\`\`\`

---

### 2.2 Create New Director
\`\`\`
POST /api/directors/
\`\`\`
**Authentication:** IsAuthenticated (SuperAdmin)

**Request Body:**
\`\`\`json
{
  "username": "director2",
  "password": "SecurePass@123",
  "first_name": "Jane",
  "last_name": "Smith",
  "email": "director2@center.uz",
  "role": "Director",
  "educational_center": 1,
  "phone": "+998901234568",
  "passport_number": "AA0123457",
  "birthday": "1992-03-20"
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 2,
  "user": {
    "id": 2,
    "username": "director2",
    "email": "director2@center.uz",
    "first_name": "Jane",
    "last_name": "Smith"
  },
  "role": "Director",
  "educational_center": 1,
  ...
}
\`\`\`

---

### 2.3 Get Director Details
\`\`\`
GET /api/directors/{id}/
\`\`\`
**Authentication:** IsAuthenticated (SuperAdmin)
**Parameters:** id - Director ID

---

### 2.4 Update Director (Full)
\`\`\`
PUT /api/directors/{id}/
\`\`\`
**Authentication:** IsAuthenticated (SuperAdmin)
**Parameters:** id - Director ID

---

### 2.5 Partial Update Director
\`\`\`
PATCH /api/directors/{id}/
\`\`\`
**Authentication:** IsAuthenticated (SuperAdmin)
**Parameters:** id - Director ID

---

### 2.6 Delete Director
\`\`\`
DELETE /api/directors/{id}/
\`\`\`
**Authentication:** IsAuthenticated (SuperAdmin)
**Parameters:** id - Director ID

**Response (204 No Content)**

---

## 3. Branches (Director/Manager)

**Base URL:** `/api/branches/`

### 3.1 List All Branches
\`\`\`
GET /api/branches/
\`\`\`
**Authentication:** IsAuthenticated
**Permissions:** Director, Manager can see branches in their center
**Query Parameters:** page, page_size

---

### 3.2 Create New Branch
\`\`\`
POST /api/branches/
\`\`\`
**Authentication:** IsAuthenticated (Director/Manager)

**Request Body:**
\`\`\`json
{
  "educational_center": 1,
  "name": "Tashkent Branch",
  "address": "Tashkent, Uzbekistan",
  "phone": "+998901234567",
  "manager": 5,
  "status": "Open"
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 1,
  "educational_center": 1,
  "center_name": "Elite Education Center",
  "name": "Tashkent Branch",
  "address": "Tashkent, Uzbekistan",
  "phone": "+998901234567",
  "manager": 5,
  "manager_name": "Ali Manager",
  "status": "Open",
  "created_at": "2024-01-01T10:00:00Z",
  "updated_at": "2024-01-01T10:00:00Z"
}
\`\`\`

---

### 3.3 Get Branch Details
\`\`\`
GET /api/branches/{id}/
\`\`\`
**Authentication:** IsAuthenticated
**Parameters:** id - Branch ID

---

### 3.4 Update Branch (Full)
\`\`\`
PUT /api/branches/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Director/Manager)
**Parameters:** id - Branch ID

---

### 3.5 Partial Update Branch
\`\`\`
PATCH /api/branches/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Director/Manager)
**Parameters:** id - Branch ID

---

### 3.6 Delete Branch
\`\`\`
DELETE /api/branches/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Director/Manager)
**Parameters:** id - Branch ID

**Response (204 No Content)**

---

### 3.7 Open Branch
\`\`\`
POST /api/branches/{id}/open/
\`\`\`
**Authentication:** IsAuthenticated (Director/Manager)
**Parameters:** id - Branch ID

**Request Body:** {} (empty)

**Response (200 OK):**
\`\`\`json
{
  "status": "Branch opened"
}
\`\`\`

---

### 3.8 Close Branch
\`\`\`
POST /api/branches/{id}/close/
\`\`\`
**Authentication:** IsAuthenticated (Director/Manager)
**Parameters:** id - Branch ID

**Request Body:** {} (empty)

**Response (200 OK):**
\`\`\`json
{
  "status": "Branch closed"
}
\`\`\`

---

## 4. Subjects/Courses (Director)

**Base URL:** `/api/subjects/`

### 4.1 List All Subjects
\`\`\`
GET /api/subjects/
\`\`\`
**Authentication:** IsAuthenticated

---

### 4.2 Create New Subject
\`\`\`
POST /api/subjects/
\`\`\`
**Authentication:** IsAuthenticated (Director)

**Request Body:**
\`\`\`json
{
  "educational_center": 1,
  "name": "English Language",
  "description": "English language course for beginners"
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 1,
  "educational_center": 1,
  "center_name": "Elite Education Center",
  "name": "English Language",
  "description": "English language course for beginners",
  "created_at": "2024-01-01T10:00:00Z"
}
\`\`\`

---

### 4.3 Get Subject Details
\`\`\`
GET /api/subjects/{id}/
\`\`\`
**Authentication:** IsAuthenticated
**Parameters:** id - Subject ID

---

### 4.4 Update Subject (Full)
\`\`\`
PUT /api/subjects/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Director)
**Parameters:** id - Subject ID

---

### 4.5 Partial Update Subject
\`\`\`
PATCH /api/subjects/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Director)
**Parameters:** id - Subject ID

---

### 4.6 Delete Subject
\`\`\`
DELETE /api/subjects/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Director)
**Parameters:** id - Subject ID

**Response (204 No Content)**

---

## 5. Groups/Classes (Director)

**Base URL:** `/api/groups/`

### 5.1 List All Groups
\`\`\`
GET /api/groups/
\`\`\`
**Authentication:** IsAuthenticated
**Query Parameters:** page, page_size

---

### 5.2 Create New Group
\`\`\`
POST /api/groups/
\`\`\`
**Authentication:** IsAuthenticated (Director)

**Request Body:**
\`\`\`json
{
  "educational_center": 1,
  "branch": 1,
  "name": "English A1",
  "subject": 1,
  "teacher": 10,
  "capacity": 25,
  "status": "Active",
  "start_date": "2024-01-15",
  "end_date": "2024-06-15"
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 1,
  "educational_center": 1,
  "branch": 1,
  "branch_name": "Tashkent Branch",
  "name": "English A1",
  "subject": 1,
  "subject_name": "English Language",
  "teacher": 10,
  "teacher_name": "John Teacher",
  "capacity": 25,
  "status": "Active",
  "start_date": "2024-01-15",
  "end_date": "2024-06-15",
  "students_count": 18,
  "created_at": "2024-01-01T10:00:00Z",
  "updated_at": "2024-01-01T10:00:00Z"
}
\`\`\`

---

### 5.3 Get Group Details
\`\`\`
GET /api/groups/{id}/
\`\`\`
**Authentication:** IsAuthenticated
**Parameters:** id - Group ID

---

### 5.4 Update Group (Full)
\`\`\`
PUT /api/groups/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Director)
**Parameters:** id - Group ID

---

### 5.5 Partial Update Group
\`\`\`
PATCH /api/groups/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Director)
**Parameters:** id - Group ID

---

### 5.6 Delete Group
\`\`\`
DELETE /api/groups/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Director)
**Parameters:** id - Group ID

**Response (204 No Content)**

---

### 5.7 Get Group Statistics
\`\`\`
GET /api/groups/{id}/statistics/
\`\`\`
**Authentication:** IsAuthenticated (Director)
**Parameters:** id - Group ID

**Response (200 OK):**
\`\`\`json
{
  "students_count": 18,
  "lessons_count": 12,
  "average_attendance": 85.5,
  "payment_status": {
    "total_payments": 5000,
    "payment_count": 20
  }
}
\`\`\`

---

### 5.8 Get Group Attendance Report
\`\`\`
GET /api/groups/{id}/attendance-report/
\`\`\`
**Authentication:** IsAuthenticated (Director)
**Parameters:** id - Group ID

**Response (200 OK):**
\`\`\`json
{
  "total_lessons": 12,
  "total_attendances": 150,
  "present_count": 128,
  "absent_count": 15,
  "late_count": 7
}
\`\`\`

---

## 6. Students

**Base URL:** `/api/students/`

### 6.1 List All Students
\`\`\`
GET /api/students/
\`\`\`
**Authentication:** IsAuthenticated
**Permissions:** Director/Manager see all; Students see only themselves
**Query Parameters:** page, page_size

---

### 6.2 Create New Student
\`\`\`
POST /api/students/
\`\`\`
**Authentication:** IsAuthenticated (Director/Manager/Admin)

**Request Body:**
\`\`\`json
{
  "user": {
    "username": "student1",
    "password": "Student@123",
    "email": "student1@center.uz",
    "first_name": "Ahmed",
    "last_name": "Begov"
  },
  "group": 1,
  "branch": 1,
  "status": "Active",
  "parent_name": "Father Name",
  "parent_phone": "+998901234567"
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 1,
  "user": {
    "id": 15,
    "username": "student1",
    "email": "student1@center.uz",
    "first_name": "Ahmed",
    "last_name": "Begov"
  },
  "user_info": {...},
  "group": 1,
  "group_name": "English A1",
  "branch": 1,
  "branch_name": "Tashkent Branch",
  "status": "Active",
  "enrollment_date": "2024-01-01",
  "parent_name": "Father Name",
  "parent_phone": "+998901234567",
  "created_at": "2024-01-01T10:00:00Z",
  "updated_at": "2024-01-01T10:00:00Z"
}
\`\`\`

---

### 6.3 Get Student Details
\`\`\`
GET /api/students/{id}/
\`\`\`
**Authentication:** IsAuthenticated
**Parameters:** id - Student ID

---

### 6.4 Update Student (Full)
\`\`\`
PUT /api/students/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Director/Manager/Admin)
**Parameters:** id - Student ID

---

### 6.5 Partial Update Student
\`\`\`
PATCH /api/students/{id}/
\`\`\`
**Authentication:** IsAuthenticated
**Parameters:** id - Student ID

---

### 6.6 Delete Student
\`\`\`
DELETE /api/students/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Director/Manager/Admin)
**Parameters:** id - Student ID

**Response (204 No Content)**

---

### 6.7 Block Student
\`\`\`
POST /api/students/{id}/block/
\`\`\`
**Authentication:** IsAuthenticated (Director/Manager/Admin)
**Parameters:** id - Student ID

**Request Body:** {} (empty)

**Response (200 OK):**
\`\`\`json
{
  "status": "Student blocked"
}
\`\`\`

---

### 6.8 Assign Student to Group
\`\`\`
POST /api/students/{id}/assign-group/
\`\`\`
**Authentication:** IsAuthenticated (Director/Manager/Admin)
**Parameters:** id - Student ID

**Request Body:**
\`\`\`json
{
  "group_id": 2
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "status": "Student assigned to group"
}
\`\`\`

---

### 6.9 Get Student Attendance History
\`\`\`
GET /api/students/{id}/attendance-history/
\`\`\`
**Authentication:** IsAuthenticated
**Parameters:** id - Student ID

**Response (200 OK):**
\`\`\`json
[
  {
    "status": "Present",
    "count": 25
  },
  {
    "status": "Absent",
    "count": 3
  },
  {
    "status": "Late",
    "count": 2
  }
]
\`\`\`

---

### 6.10 Get Student Payment History
\`\`\`
GET /api/students/{id}/payment-history/
\`\`\`
**Authentication:** IsAuthenticated
**Parameters:** id - Student ID

**Response (200 OK):**
\`\`\`json
[
  {
    "id": 1,
    "student_name": "Ahmed Begov",
    "group_name": "English A1",
    "amount": 500,
    "payment_type": "Cash",
    "payment_date": "2024-01-15",
    "due_date": "2024-01-15",
    "receipt_number": "REC-001"
  }
]
\`\`\`

---

## 7. Teachers

**Base URL:** `/api/teachers/`

### 7.1 List All Teachers
\`\`\`
GET /api/teachers/
\`\`\`
**Authentication:** IsAuthenticated

---

### 7.2 Create New Teacher
\`\`\`
POST /api/teachers/
\`\`\`
**Authentication:** IsAuthenticated (Director/Manager)

**Request Body:**
\`\`\`json
{
  "user": {
    "username": "teacher1",
    "password": "Teacher@123",
    "email": "teacher1@center.uz",
    "first_name": "John",
    "last_name": "Teacher"
  },
  "branch": 1,
  "status": "Active",
  "specialization": "English",
  "qualification": "TEFL Certified",
  "hire_date": "2024-01-01",
  "hourly_rate": 50
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 10,
  "user": {...},
  "user_info": {...},
  "branch": 1,
  "branch_name": "Tashkent Branch",
  "status": "Active",
  "specialization": "English",
  "qualification": "TEFL Certified",
  "performance_rating": 0,
  "hire_date": "2024-01-01",
  "hourly_rate": 50,
  "teaching_groups_count": 0,
  "created_at": "2024-01-01T10:00:00Z",
  "updated_at": "2024-01-01T10:00:00Z"
}
\`\`\`

---

### 7.3 Get Teacher Details
\`\`\`
GET /api/teachers/{id}/
\`\`\`
**Authentication:** IsAuthenticated
**Parameters:** id - Teacher ID

---

### 7.4 Update Teacher (Full)
\`\`\`
PUT /api/teachers/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Director/Manager)
**Parameters:** id - Teacher ID

---

### 7.5 Partial Update Teacher
\`\`\`
PATCH /api/teachers/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Director/Manager)
**Parameters:** id - Teacher ID

---

### 7.6 Delete Teacher
\`\`\`
DELETE /api/teachers/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Director/Manager)
**Parameters:** id - Teacher ID

**Response (204 No Content)**

---

### 7.7 Rate Teacher Performance
\`\`\`
POST /api/teachers/{id}/rate/
\`\`\`
**Authentication:** IsAuthenticated (Director/Manager)
**Parameters:** id - Teacher ID

**Request Body:**
\`\`\`json
{
  "rating": 4.5
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "status": "Teacher rated",
  "rating": 4.5
}
\`\`\`

---

### 7.8 Get Teacher Schedule
\`\`\`
GET /api/teachers/{id}/schedule/
\`\`\`
**Authentication:** IsAuthenticated
**Parameters:** id - Teacher ID

**Response (200 OK):**
\`\`\`json
[
  {
    "id": 1,
    "group": 1,
    "group_name": "English A1",
    "teacher": 10,
    "teacher_name": "John Teacher",
    "room": 2,
    "room_name": "Room 101",
    "date": "2024-01-15",
    "start_time": "09:00:00",
    "end_time": "10:30:00",
    "duration": 90,
    "online_link": null,
    "is_cancelled": false
  }
]
\`\`\`

---

### 7.9 Get Teacher Performance Metrics
\`\`\`
GET /api/teachers/{id}/performance/
\`\`\`
**Authentication:** IsAuthenticated
**Parameters:** id - Teacher ID

**Response (200 OK):**
\`\`\`json
{
  "lessons_count": 24,
  "attendances_marked": 120,
  "assignments_given": 8,
  "exams_conducted": 3,
  "performance_rating": 4.5
}
\`\`\`

---

## 8. Lessons

**Base URL:** `/api/lessons/`

### 8.1 List All Lessons
\`\`\`
GET /api/lessons/
\`\`\`
**Authentication:** IsAuthenticated

---

### 8.2 Create New Lesson
\`\`\`
POST /api/lessons/
\`\`\`
**Authentication:** IsAuthenticated (Director/Teacher)

**Request Body:**
\`\`\`json
{
  "group": 1,
  "teacher": 10,
  "room": 2,
  "date": "2024-01-15",
  "start_time": "09:00:00",
  "end_time": "10:30:00",
  "duration": 90
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 1,
  "group": 1,
  "group_name": "English A1",
  "teacher": 10,
  "teacher_name": "John Teacher",
  "room": 2,
  "room_name": "Room 101",
  "date": "2024-01-15",
  "start_time": "09:00:00",
  "end_time": "10:30:00",
  "duration": 90,
  "online_link": null,
  "is_cancelled": false,
  "created_at": "2024-01-01T10:00:00Z",
  "updated_at": "2024-01-01T10:00:00Z"
}
\`\`\`

---

### 8.3 Get Lesson Details
\`\`\`
GET /api/lessons/{id}/
\`\`\`
**Authentication:** IsAuthenticated
**Parameters:** id - Lesson ID

---

### 8.4 Update Lesson (Full)
\`\`\`
PUT /api/lessons/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Director/Teacher)
**Parameters:** id - Lesson ID

---

### 8.5 Partial Update Lesson
\`\`\`
PATCH /api/lessons/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Director/Teacher)
**Parameters:** id - Lesson ID

---

### 8.6 Delete Lesson
\`\`\`
DELETE /api/lessons/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Director/Teacher)
**Parameters:** id - Lesson ID

**Response (204 No Content)**

---

### 8.7 Cancel Lesson
\`\`\`
POST /api/lessons/{id}/cancel/
\`\`\`
**Authentication:** IsAuthenticated (Director/Teacher)
**Parameters:** id - Lesson ID

**Request Body:** {} (empty)

**Response (200 OK):**
\`\`\`json
{
  "status": "Lesson cancelled"
}
\`\`\`

---

### 8.8 Generate Online Meeting Link
\`\`\`
POST /api/lessons/{id}/generate-online-link/
\`\`\`
**Authentication:** IsAuthenticated (Director/Teacher)
**Parameters:** id - Lesson ID

**Request Body:** {} (empty)

**Response (200 OK):**
\`\`\`json
{
  "online_link": "https://meet.example.com/a1b2c3d4e5"
}
\`\`\`

---

## 9. Attendance

**Base URL:** `/api/attendance/`

### 9.1 List All Attendance Records
\`\`\`
GET /api/attendance/
\`\`\`
**Authentication:** IsAuthenticated

---

### 9.2 Mark Attendance (Single Record)
\`\`\`
POST /api/attendance/
\`\`\`
**Authentication:** IsAuthenticated (Teacher/Admin)

**Request Body:**
\`\`\`json
{
  "lesson": 1,
  "student": 1,
  "status": "Present",
  "notes": "All good"
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 1,
  "lesson": 1,
  "lesson_info": "English A1 - 2024-01-15 09:00-10:30",
  "student": 1,
  "student_name": "Ahmed Begov",
  "status": "Present",
  "marked_by": 10,
  "teacher_name": "John Teacher",
  "notes": "All good",
  "marked_at": "2024-01-15T09:00:00Z"
}
\`\`\`

---

### 9.3 Get Attendance Record
\`\`\`
GET /api/attendance/{id}/
\`\`\`
**Authentication:** IsAuthenticated
**Parameters:** id - Attendance ID

---

### 9.4 Update Attendance (Full)
\`\`\`
PUT /api/attendance/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Teacher/Admin)
**Parameters:** id - Attendance ID

---

### 9.5 Partial Update Attendance
\`\`\`
PATCH /api/attendance/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Teacher/Admin)
**Parameters:** id - Attendance ID

---

### 9.6 Delete Attendance
\`\`\`
DELETE /api/attendance/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Teacher/Admin)
**Parameters:** id - Attendance ID

**Response (204 No Content)**

---

### 9.7 Bulk Mark Attendance
\`\`\`
POST /api/attendance/bulk-mark/
\`\`\`
**Authentication:** IsAuthenticated (Teacher)

**Request Body:**
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
      "notes": "Sick leave"
    },
    {
      "student_id": 3,
      "status": "Late",
      "notes": "Traffic jam"
    }
  ]
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "status": "Marked 3 attendance records"
}
\`\`\`

---

## 10. Payments

**Base URL:** `/api/payments/`

### 10.1 List All Payments
\`\`\`
GET /api/payments/
\`\`\`
**Authentication:** IsAuthenticated

---

### 10.2 Create New Payment
\`\`\`
POST /api/payments/
\`\`\`
**Authentication:** IsAuthenticated (Admin/Manager)

**Request Body:**
\`\`\`json
{
  "student": 1,
  "group": 1,
  "amount": 500,
  "payment_type": "Cash",
  "due_date": "2024-01-31",
  "receipt_number": "REC-001",
  "document": "file_upload",
  "notes": "Payment received in cash"
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 1,
  "student": 1,
  "student_name": "Ahmed Begov",
  "group": 1,
  "group_name": "English A1",
  "amount": 500,
  "payment_type": "Cash",
  "payment_date": "2024-01-15",
  "due_date": "2024-01-31",
  "receipt_number": "REC-001",
  "document": "https://...",
  "paid_by": 5,
  "processed_by": "Admin Name",
  "notes": "Payment received in cash",
  "created_at": "2024-01-15T10:00:00Z"
}
\`\`\`

---

### 10.3 Get Payment Details
\`\`\`
GET /api/payments/{id}/
\`\`\`
**Authentication:** IsAuthenticated
**Parameters:** id - Payment ID

---

### 10.4 Update Payment (Full)
\`\`\`
PUT /api/payments/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Admin/Manager)
**Parameters:** id - Payment ID

---

### 10.5 Partial Update Payment
\`\`\`
PATCH /api/payments/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Admin/Manager)
**Parameters:** id - Payment ID

---

### 10.6 Delete Payment
\`\`\`
DELETE /api/payments/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Admin/Manager)
**Parameters:** id - Payment ID

**Response (204 No Content)**

---

### 10.7 List Debtors
\`\`\`
GET /api/payments/debtors/
\`\`\`
**Authentication:** IsAuthenticated (Admin/Manager)

**Response (200 OK):**
\`\`\`json
[
  {
    "id": 1,
    "user_info": {...},
    "group_name": "English A1",
    "status": "Active",
    "enrollment_date": "2024-01-01",
    "parent_name": "Father Name",
    "parent_phone": "+998901234567"
  }
]
\`\`\`

---

### 10.8 Get Payment Statistics
\`\`\`
GET /api/payments/statistics/
\`\`\`
**Authentication:** IsAuthenticated (Admin/Manager)

**Response (200 OK):**
\`\`\`json
{
  "total_revenue": 50000,
  "payment_count": 100,
  "average_payment": 500
}
\`\`\`

---

## 11. Assignments

**Base URL:** `/api/assignments/`

### 11.1 List All Assignments
\`\`\`
GET /api/assignments/
\`\`\`
**Authentication:** IsAuthenticated

---

### 11.2 Create New Assignment
\`\`\`
POST /api/assignments/
\`\`\`
**Authentication:** IsAuthenticated (Teacher)

**Request Body:**
\`\`\`json
{
  "group": 1,
  "teacher": 10,
  "title": "English Essay",
  "description": "Write an essay about your dreams",
  "file": "file_upload",
  "due_date": "2024-01-20",
  "status": "Assigned"
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 1,
  "group": 1,
  "group_name": "English A1",
  "teacher": 10,
  "teacher_name": "John Teacher",
  "title": "English Essay",
  "description": "Write an essay about your dreams",
  "file": "https://...",
  "due_date": "2024-01-20",
  "status": "Assigned",
  "submissions_count": 0,
  "created_at": "2024-01-15T10:00:00Z",
  "updated_at": "2024-01-15T10:00:00Z"
}
\`\`\`

---

### 11.3 Get Assignment Details
\`\`\`
GET /api/assignments/{id}/
\`\`\`
**Authentication:** IsAuthenticated
**Parameters:** id - Assignment ID

---

### 11.4 Update Assignment (Full)
\`\`\`
PUT /api/assignments/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Teacher)
**Parameters:** id - Assignment ID

---

### 11.5 Partial Update Assignment
\`\`\`
PATCH /api/assignments/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Teacher)
**Parameters:** id - Assignment ID

---

### 11.6 Delete Assignment
\`\`\`
DELETE /api/assignments/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Teacher)
**Parameters:** id - Assignment ID

**Response (204 No Content)**

---

## 12. Assignment Submissions

**Base URL:** `/api/submissions/`

### 12.1 List All Submissions
\`\`\`
GET /api/submissions/
\`\`\`
**Authentication:** IsAuthenticated

---

### 12.2 Submit Assignment
\`\`\`
POST /api/submissions/
\`\`\`
**Authentication:** IsAuthenticated (Student)

**Request Body:**
\`\`\`json
{
  "assignment": 1,
  "student": 1,
  "submission_file": "file_upload"
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 1,
  "assignment": 1,
  "assignment_title": "English Essay",
  "student": 1,
  "student_name": "Ahmed Begov",
  "submission_file": "https://...",
  "submitted_at": "2024-01-18T15:30:00Z",
  "grade": null,
  "feedback": null,
  "graded_at": null
}
\`\`\`

---

### 12.3 Get Submission Details
\`\`\`
GET /api/submissions/{id}/
\`\`\`
**Authentication:** IsAuthenticated
**Parameters:** id - Submission ID

---

### 12.4 Update Submission (Grade/Feedback)
\`\`\`
PUT /api/submissions/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Teacher)
**Parameters:** id - Submission ID

**Request Body:**
\`\`\`json
{
  "grade": 95,
  "feedback": "Excellent work!"
}
\`\`\`

---

### 12.5 Partial Update Submission
\`\`\`
PATCH /api/submissions/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Teacher)
**Parameters:** id - Submission ID

---

### 12.6 Delete Submission
\`\`\`
DELETE /api/submissions/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Teacher)
**Parameters:** id - Submission ID

**Response (204 No Content)**

---

## 13. Exams

**Base URL:** `/api/exams/`

### 13.1 List All Exams
\`\`\`
GET /api/exams/
\`\`\`
**Authentication:** IsAuthenticated

---

### 13.2 Create New Exam
\`\`\`
POST /api/exams/
\`\`\`
**Authentication:** IsAuthenticated (Teacher)

**Request Body:**
\`\`\`json
{
  "group": 1,
  "teacher": 10,
  "title": "Final English Test",
  "description": "Final examination for the course",
  "exam_date": "2024-02-15",
  "start_time": "09:00:00",
  "end_time": "11:00:00",
  "total_points": 100,
  "passing_score": 60
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 1,
  "group": 1,
  "group_name": "English A1",
  "teacher": 10,
  "teacher_name": "John Teacher",
  "title": "Final English Test",
  "description": "Final examination for the course",
  "exam_date": "2024-02-15",
  "start_time": "09:00:00",
  "end_time": "11:00:00",
  "total_points": 100,
  "passing_score": 60,
  "results_count": 0,
  "created_at": "2024-01-15T10:00:00Z"
}
\`\`\`

---

### 13.3 Get Exam Details
\`\`\`
GET /api/exams/{id}/
\`\`\`
**Authentication:** IsAuthenticated
**Parameters:** id - Exam ID

---

### 13.4 Update Exam (Full)
\`\`\`
PUT /api/exams/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Teacher)
**Parameters:** id - Exam ID

---

### 13.5 Partial Update Exam
\`\`\`
PATCH /api/exams/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Teacher)
**Parameters:** id - Exam ID

---

### 13.6 Delete Exam
\`\`\`
DELETE /api/exams/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Teacher)
**Parameters:** id - Exam ID

**Response (204 No Content)**

---

### 13.7 Get Exam Results
\`\`\`
GET /api/exams/{id}/results/
\`\`\`
**Authentication:** IsAuthenticated
**Parameters:** id - Exam ID

**Response (200 OK):**
\`\`\`json
[
  {
    "id": 1,
    "exam": 1,
    "exam_title": "Final English Test",
    "student": 1,
    "student_name": "Ahmed Begov",
    "score": 85,
    "grade": "A",
    "answer_file": "https://...",
    "submitted_at": "2024-02-15T11:00:00Z"
  }
]
\`\`\`

---

## 14. Exam Results

**Base URL:** `/api/exam-results/`

### 14.1 List All Exam Results
\`\`\`
GET /api/exam-results/
\`\`\`
**Authentication:** IsAuthenticated

---

### 14.2 Submit Exam Result
\`\`\`
POST /api/exam-results/
\`\`\`
**Authentication:** IsAuthenticated (Student/Teacher)

**Request Body:**
\`\`\`json
{
  "exam": 1,
  "student": 1,
  "score": 85,
  "grade": "A",
  "answer_file": "file_upload"
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 1,
  "exam": 1,
  "exam_title": "Final English Test",
  "student": 1,
  "student_name": "Ahmed Begov",
  "score": 85,
  "grade": "A",
  "answer_file": "https://...",
  "submitted_at": "2024-02-15T11:00:00Z"
}
\`\`\`

---

### 14.3 Get Exam Result Details
\`\`\`
GET /api/exam-results/{id}/
\`\`\`
**Authentication:** IsAuthenticated
**Parameters:** id - Exam Result ID

---

### 14.4 Update Exam Result (Full)
\`\`\`
PUT /api/exam-results/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Teacher)
**Parameters:** id - Exam Result ID

---

### 14.5 Partial Update Exam Result
\`\`\`
PATCH /api/exam-results/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Teacher)
**Parameters:** id - Exam Result ID

---

### 14.6 Delete Exam Result
\`\`\`
DELETE /api/exam-results/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Teacher)
**Parameters:** id - Exam Result ID

**Response (204 No Content)**

---

## 15. Rooms

**Base URL:** `/api/rooms/`

### 15.1 List All Rooms
\`\`\`
GET /api/rooms/
\`\`\`
**Authentication:** IsAuthenticated

---

### 15.2 Create New Room
\`\`\`
POST /api/rooms/
\`\`\`
**Authentication:** IsAuthenticated (Manager/Admin)

**Request Body:**
\`\`\`json
{
  "branch": 1,
  "name": "Room 101",
  "capacity": 30,
  "equipment": "Projector, Whiteboard, Speakers",
  "is_available": true
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 1,
  "branch": 1,
  "branch_name": "Tashkent Branch",
  "name": "Room 101",
  "capacity": 30,
  "equipment": "Projector, Whiteboard, Speakers",
  "is_available": true
}
\`\`\`

---

### 15.3 Get Room Details
\`\`\`
GET /api/rooms/{id}/
\`\`\`
**Authentication:** IsAuthenticated
**Parameters:** id - Room ID

---

### 15.4 Update Room (Full)
\`\`\`
PUT /api/rooms/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Manager/Admin)
**Parameters:** id - Room ID

---

### 15.5 Partial Update Room
\`\`\`
PATCH /api/rooms/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Manager/Admin)
**Parameters:** id - Room ID

---

### 15.6 Delete Room
\`\`\`
DELETE /api/rooms/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Manager/Admin)
**Parameters:** id - Room ID

**Response (204 No Content)**

---

### 15.7 Toggle Room Availability
\`\`\`
POST /api/rooms/{id}/toggle-availability/
\`\`\`
**Authentication:** IsAuthenticated (Manager/Admin)
**Parameters:** id - Room ID

**Request Body:** {} (empty)

**Response (200 OK):**
\`\`\`json
{
  "is_available": false
}
\`\`\`

---

## 16. Payroll

**Base URL:** `/api/payroll/`

### 16.1 List All Payroll Records
\`\`\`
GET /api/payroll/
\`\`\`
**Authentication:** IsAuthenticated

---

### 16.2 Create New Payroll Record
\`\`\`
POST /api/payroll/
\`\`\`
**Authentication:** IsAuthenticated (Director/Manager)

**Request Body:**
\`\`\`json
{
  "teacher": 10,
  "month": "2024-01",
  "base_salary": 2000,
  "bonus": 200,
  "penalty": 50,
  "is_paid": false
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 1,
  "teacher": 10,
  "teacher_name": "John Teacher",
  "month": "2024-01",
  "base_salary": 2000,
  "bonus": 200,
  "penalty": 50,
  "total_salary": 2150,
  "is_paid": false,
  "paid_date": null,
  "created_at": "2024-01-31T10:00:00Z"
}
\`\`\`

---

### 16.3 Get Payroll Record
\`\`\`
GET /api/payroll/{id}/
\`\`\`
**Authentication:** IsAuthenticated
**Parameters:** id - Payroll Record ID

---

### 16.4 Update Payroll Record (Full)
\`\`\`
PUT /api/payroll/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Director/Manager)
**Parameters:** id - Payroll Record ID

---

### 16.5 Partial Update Payroll Record
\`\`\`
PATCH /api/payroll/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Director/Manager)
**Parameters:** id - Payroll Record ID

---

### 16.6 Delete Payroll Record
\`\`\`
DELETE /api/payroll/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Director/Manager)
**Parameters:** id - Payroll Record ID

**Response (204 No Content)**

---

### 16.7 Mark Payroll as Paid
\`\`\`
POST /api/payroll/{id}/mark-paid/
\`\`\`
**Authentication:** IsAuthenticated (Director/Manager)
**Parameters:** id - Payroll Record ID

**Request Body:** {} (empty)

**Response (200 OK):**
\`\`\`json
{
  "status": "Payroll marked as paid"
}
\`\`\`

---

## 17. Notifications

**Base URL:** `/api/notifications/`

### 17.1 List All User Notifications
\`\`\`
GET /api/notifications/
\`\`\`
**Authentication:** IsAuthenticated

**Response (200 OK):**
\`\`\`json
{
  "count": 5,
  "results": [
    {
      "id": 1,
      "user": 1,
      "username": "director1",
      "notification_type": "lesson_reminder",
      "title": "Lesson Starting",
      "message": "Your English A1 lesson starts in 15 minutes",
      "is_read": false,
      "created_at": "2024-01-15T08:45:00Z"
    }
  ]
}
\`\`\`

---

### 17.2 Create Notification
\`\`\`
POST /api/notifications/
\`\`\`
**Authentication:** IsAuthenticated (Admin/Manager)

**Request Body:**
\`\`\`json
{
  "user": 1,
  "notification_type": "payment_reminder",
  "title": "Payment Due",
  "message": "Your payment is due on 2024-01-31"
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 1,
  "user": 1,
  "username": "student1",
  "notification_type": "payment_reminder",
  "title": "Payment Due",
  "message": "Your payment is due on 2024-01-31",
  "is_read": false,
  "created_at": "2024-01-15T10:00:00Z"
}
\`\`\`

---

### 17.3 Get Notification Details
\`\`\`
GET /api/notifications/{id}/
\`\`\`
**Authentication:** IsAuthenticated
**Parameters:** id - Notification ID

---

### 17.4 Update Notification (Mark as Read)
\`\`\`
PUT /api/notifications/{id}/
\`\`\`
**Authentication:** IsAuthenticated
**Parameters:** id - Notification ID

**Request Body:**
\`\`\`json
{
  "is_read": true
}
\`\`\`

---

### 17.5 Partial Update Notification
\`\`\`
PATCH /api/notifications/{id}/
\`\`\`
**Authentication:** IsAuthenticated
**Parameters:** id - Notification ID

---

### 17.6 Delete Notification
\`\`\`
DELETE /api/notifications/{id}/
\`\`\`
**Authentication:** IsAuthenticated
**Parameters:** id - Notification ID

**Response (204 No Content)**

---

### 17.7 Mark All Notifications as Read
\`\`\`
POST /api/notifications/mark-all-read/
\`\`\`
**Authentication:** IsAuthenticated

**Request Body:** {} (empty)

**Response (200 OK):**
\`\`\`json
{
  "status": "All notifications marked as read"
}
\`\`\`

---

## 18. Contracts

**Base URL:** `/api/contracts/`

### 18.1 List All Contracts
\`\`\`
GET /api/contracts/
\`\`\`
**Authentication:** IsAuthenticated

---

### 18.2 Create New Contract
\`\`\`
POST /api/contracts/
\`\`\`
**Authentication:** IsAuthenticated (Admin)

**Request Body:**
\`\`\`json
{
  "student": 1,
  "group": 1,
  "contract_number": "CNT-2024-001",
  "contract_file": "file_upload",
  "signed_date": "2024-01-01"
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 1,
  "student": 1,
  "student_name": "Ahmed Begov",
  "group": 1,
  "group_name": "English A1",
  "contract_number": "CNT-2024-001",
  "contract_file": "https://...",
  "signed_date": "2024-01-01",
  "is_verified": false,
  "verified_by": null,
  "verified_by_name": null,
  "created_at": "2024-01-01T10:00:00Z"
}
\`\`\`

---

### 18.3 Get Contract Details
\`\`\`
GET /api/contracts/{id}/
\`\`\`
**Authentication:** IsAuthenticated
**Parameters:** id - Contract ID

---

### 18.4 Update Contract (Full)
\`\`\`
PUT /api/contracts/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Admin)
**Parameters:** id - Contract ID

---

### 18.5 Partial Update Contract
\`\`\`
PATCH /api/contracts/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Admin)
**Parameters:** id - Contract ID

---

### 18.6 Delete Contract
\`\`\`
DELETE /api/contracts/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Admin)
**Parameters:** id - Contract ID

**Response (204 No Content)**

---

### 18.7 Verify Contract
\`\`\`
POST /api/contracts/{id}/verify/
\`\`\`
**Authentication:** IsAuthenticated (Admin)
**Parameters:** id - Contract ID

**Request Body:** {} (empty)

**Response (200 OK):**
\`\`\`json
{
  "status": "Contract verified"
}
\`\`\`

---

## 19. Leads

**Base URL:** `/api/leads/`

### 19.1 List All Leads
\`\`\`
GET /api/leads/
\`\`\`
**Authentication:** IsAuthenticated (Manager)

---

### 19.2 Create New Lead
\`\`\`
POST /api/leads/
\`\`\`
**Authentication:** IsAuthenticated (Manager)

**Request Body:**
\`\`\`json
{
  "branch": 1,
  "name": "Ahmed Khaitov",
  "email": "ahmed@example.com",
  "phone": "+998901234567",
  "course_interested": 1,
  "status": "New",
  "source": "Website",
  "notes": "Interested in English course"
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 1,
  "branch": 1,
  "branch_name": "Tashkent Branch",
  "name": "Ahmed Khaitov",
  "email": "ahmed@example.com",
  "phone": "+998901234567",
  "course_interested": 1,
  "course_name": "English Language",
  "status": "New",
  "source": "Website",
  "assigned_to": null,
  "assigned_to_name": null,
  "notes": "Interested in English course",
  "created_at": "2024-01-15T10:00:00Z",
  "updated_at": "2024-01-15T10:00:00Z"
}
\`\`\`

---

### 19.3 Get Lead Details
\`\`\`
GET /api/leads/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Manager)
**Parameters:** id - Lead ID

---

### 19.4 Update Lead (Full)
\`\`\`
PUT /api/leads/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Manager)
**Parameters:** id - Lead ID

---

### 19.5 Partial Update Lead
\`\`\`
PATCH /api/leads/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Manager)
**Parameters:** id - Lead ID

---

### 19.6 Delete Lead
\`\`\`
DELETE /api/leads/{id}/
\`\`\`
**Authentication:** IsAuthenticated (Manager)
**Parameters:** id - Lead ID

**Response (204 No Content)**

---

### 19.7 Convert Lead to Student
\`\`\`
POST /api/leads/{id}/convert-to-student/
\`\`\`
**Authentication:** IsAuthenticated (Manager)
**Parameters:** id - Lead ID

**Request Body:** {} (empty)

**Response (200 OK):**
\`\`\`json
{
  "status": "Lead converted to student"
}
\`\`\`

---

### 19.8 Get Lead Conversion Statistics
\`\`\`
GET /api/leads/statistics/
\`\`\`
**Authentication:** IsAuthenticated (Manager)

**Response (200 OK):**
\`\`\`json
{
  "total_leads": 100,
  "converted_leads": 45,
  "conversion_rate": 45.0
}
\`\`\`

---

## Response Status Codes

| Code | Meaning |
|------|---------|
| 200 | OK - Request successful |
| 201 | Created - Resource created successfully |
| 204 | No Content - Successful deletion |
| 400 | Bad Request - Invalid data |
| 401 | Unauthorized - Missing/invalid token |
| 403 | Forbidden - Insufficient permissions |
| 404 | Not Found - Resource not found |
| 500 | Server Error |

---

## Common Error Responses

\`\`\`json
{
  "error": "Invalid credentials",
  "status_code": 401
}
\`\`\`

\`\`\`json
{
  "error": "Not found",
  "status_code": 404
}
\`\`\`

\`\`\`json
{
  "field_name": ["Error message for this field"]
}
\`\`\`

---

## Key Points to Remember

1. All endpoints (except login) require JWT token in header
2. Role-based access control implemented for all endpoints
3. Data filtering based on user's educational center
4. Bulk operations available for attendance marking
5. Custom actions for complex operations
6. Comprehensive pagination and filtering support

\`\`\`

Now let me create a quick reference guide:
