# 🎓 Educational Center CRM - Complete API Guide (Step by Step)

Bu dokumentda har bir API alohida alohida tushuntiriladi. Swagger-da to'g'ri ko'rinadi va barcha CRUD operatsiyalar jasad bilan tuzilgan.

---

## 📋 TABLE OF CONTENTS

1. [Authentication API (Login)](#1-authentication-api-login)
2. [Educational Center API](#2-educational-center-api)
3. [Director API](#3-director-api)
4. [Branch API](#4-branch-api)
5. [Subject/Course API](#5-subjectcourse-api)
6. [Group API](#6-group-api)
7. [Student API](#7-student-api)
8. [Teacher API](#8-teacher-api)
9. [Lesson API](#9-lesson-api)
10. [Attendance API](#10-attendance-api)
11. [Payment API](#11-payment-api)
12. [Assignment API](#12-assignment-api)
13. [Assignment Submission API](#13-assignment-submission-api)
14. [Exam API](#14-exam-api)
15. [Exam Result API](#15-exam-result-api)
16. [Room API](#16-room-api)
17. [Payroll API](#17-payroll-api)
18. [Notification API](#18-notification-api)
19. [Contract API](#19-contract-api)
20. [Lead API](#20-lead-api)

---

## 1. AUTHENTICATION API (Login)

### Endpoint: `POST /api/auth/login/`

**Description:** User login - barcha foydalanuvchilar uchun JWT token olish

**Method:** `POST`

**URL:** `http://localhost:8000/api/auth/login/`

**Permission:** `AllowAny` (Hech kim kirishi shart emas)

**Request Body (JSON):**
\`\`\`json
{
  "username": "director1",
  "password": "Director@123"
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9...",
  "refresh": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9...",
  "user_id": 2,
  "username": "director1",
  "role": "Director",
  "center_id": 1
}
\`\`\`

**Test Credentials:**
\`\`\`
SuperAdmin: superadmin / SuperAdmin@123
Director: director1 / Director@123
Manager: manager1 / Manager@123
Admin: admin1 / Admin@123
Teacher: teacher1 / Teacher@123
Student: student1 / Student@123
\`\`\`

---

## 2. EDUCATIONAL CENTER API

### Base Endpoint: `/api/centers/`

**Role:** SuperAdmin only

---

### 2.1 GET - Barcha markazlarni ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/centers/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
[
  {
    "id": 1,
    "name": "Education Hub",
    "address": "Tashkent, Uzbekistan",
    "phone": "+998901234567",
    "email": "hub@example.com",
    "logo": "http://localhost:8000/media/logos/hub.png",
    "description": "Leading educational center",
    "license_number": "LIC123456",
    "opened_at": "2023-01-15",
    "status": "Active",
    "website": "https://educationhub.uz",
    "director": "John Doe",
    "created_at": "2023-01-15T10:30:00Z"
  }
]
\`\`\`

---

### 2.2 POST - Yangi markaz qo'shish

**Method:** `POST`

**URL:** `http://localhost:8000/api/centers/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "name": "New Education Center",
  "address": "Samarkand, Uzbekistan",
  "phone": "+998901234567",
  "email": "center@example.com",
  "logo": null,
  "description": "Modern educational facility",
  "license_number": "LIC789012",
  "opened_at": "2024-01-01",
  "status": "Active",
  "website": "https://newcenter.uz",
  "director": "Jane Smith"
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 2,
  "name": "New Education Center",
  "address": "Samarkand, Uzbekistan",
  "phone": "+998901234567",
  "email": "center@example.com",
  "logo": null,
  "description": "Modern educational facility",
  "license_number": "LIC789012",
  "opened_at": "2024-01-01",
  "status": "Active",
  "website": "https://newcenter.uz",
  "director": "Jane Smith",
  "created_at": "2024-11-29T10:00:00Z"
}
\`\`\`

---

### 2.3 GET - Bir markazni ko'rish (ID orqali)

**Method:** `GET`

**URL:** `http://localhost:8000/api/centers/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "name": "Education Hub",
  "address": "Tashkent, Uzbekistan",
  "phone": "+998901234567",
  "email": "hub@example.com",
  "status": "Active",
  ...
}
\`\`\`

---

### 2.4 PUT - Markazni to'liq yangilash

**Method:** `PUT`

**URL:** `http://localhost:8000/api/centers/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body (barcha maydonlar):
\`\`\`json
{
  "name": "Updated Education Hub",
  "address": "Tashkent, Uzbekistan",
  "phone": "+998901234567",
  "email": "newemail@example.com",
  "logo": null,
  "description": "Updated description",
  "license_number": "LIC123456",
  "opened_at": "2023-01-15",
  "status": "Active",
  "website": "https://newhub.uz",
  "director": "Updated Director"
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "name": "Updated Education Hub",
  "address": "Tashkent, Uzbekistan",
  "email": "newemail@example.com",
  ...
}
\`\`\`

---

### 2.5 PATCH - Markazni qisman yangilash

**Method:** `PATCH`

**URL:** `http://localhost:8000/api/centers/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body (faqat o'zgartirilishi kerak bo'lgan maydonlar):**
\`\`\`json
{
  "name": "Updated Hub Name Only",
  "status": "Inactive"
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "name": "Updated Hub Name Only",
  "status": "Inactive",
  ...
}
\`\`\`

---

### 2.6 DELETE - Markazni o'chirish

**Method:** `DELETE`

**URL:** `http://localhost:8000/api/centers/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (204 No Content):**
\`\`\`
(Bo'sh)
\`\`\`

---

### 2.7 POST - Markazni faollashtirish

**Method:** `POST`

**URL:** `http://localhost:8000/api/centers/1/activate/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "status": "Center activated"
}
\`\`\`

---

### 2.8 POST - Markazni deaktivlashtirish

**Method:** `POST`

**URL:** `http://localhost:8000/api/centers/1/deactivate/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "status": "Center deactivated"
}
\`\`\`

---

## 3. DIRECTOR API

### Base Endpoint: `/api/directors/`

**Role:** SuperAdmin only

**Description:** Direktori yaratish va boshqarish

---

### 3.1 GET - Barcha direktorlarni ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/directors/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
[
  {
    "id": 2,
    "user": {
      "id": 2,
      "username": "director1",
      "email": "director1@example.com",
      "first_name": "Abdulla",
      "last_name": "Nasrullayev"
    },
    "role": "Director",
    "educational_center": 1,
    "phone": "+998901234567",
    "passport_number": "AB123456",
    "birthday": "1985-05-20",
    "image": null
  }
]
\`\`\`

---

### 3.2 POST - Yangi direktor yaratish

**Method:** `POST`

**URL:** `http://localhost:8000/api/directors/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "username": "new_director",
  "password": "NewDirector@123",
  "first_name": "Ali",
  "last_name": "Karim",
  "email": "ali@example.com",
  "educational_center": 1,
  "phone": "+998901234567",
  "passport_number": "AB789456",
  "birthday": "1982-03-15",
  "image": null
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 3,
  "user": {
    "id": 3,
    "username": "new_director",
    "email": "ali@example.com",
    "first_name": "Ali",
    "last_name": "Karim"
  },
  "role": "Director",
  "educational_center": 1,
  "phone": "+998901234567",
  "passport_number": "AB789456",
  "birthday": "1982-03-15",
  "image": null
}
\`\`\`

---

### 3.3 GET - Bir direktorni ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/directors/2/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 2,
  "user": {
    "id": 2,
    "username": "director1",
    "email": "director1@example.com",
    "first_name": "Abdulla",
    "last_name": "Nasrullayev"
  },
  "role": "Director",
  "educational_center": 1,
  "phone": "+998901234567",
  "passport_number": "AB123456",
  "birthday": "1985-05-20",
  "image": null
}
\`\`\`

---

### 3.4 PUT - Direktorni to'liq yangilash

**Method:** `PUT`

**URL:** `http://localhost:8000/api/directors/2/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "username": "director1",
  "first_name": "Abdulla",
  "last_name": "Nasrullayev",
  "email": "new_email@example.com",
  "educational_center": 1,
  "phone": "+998909876543",
  "passport_number": "AB123456",
  "birthday": "1985-05-20",
  "image": null
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 2,
  "user": {
    "id": 2,
    "username": "director1",
    "email": "new_email@example.com"
  },
  ...
}
\`\`\`

---

### 3.5 PATCH - Direktorni qisman yangilash

**Method:** `PATCH`

**URL:** `http://localhost:8000/api/directors/2/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "phone": "+998909999999"
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 2,
  "phone": "+998909999999",
  ...
}
\`\`\`

---

### 3.6 DELETE - Direktorni o'chirish

**Method:** `DELETE`

**URL:** `http://localhost:8000/api/directors/2/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (204 No Content):**
\`\`\`
(Bo'sh)
\`\`\`

---

## 4. BRANCH API

### Base Endpoint: `/api/branches/`

**Role:** Director, Manager

**Description:** Filiallar boshqaruvi - o'quv markazining filiallarini yaratish va boshqarish

---

### 4.1 GET - Barcha filiallarni ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/branches/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
[
  {
    "id": 1,
    "name": "Main Branch",
    "address": "123 Main Street",
    "phone": "+998901234567",
    "educational_center": 1,
    "manager": 3,
    "status": "Open",
    "student_count": 45,
    "created_at": "2023-01-15T10:30:00Z"
  }
]
\`\`\`

---

### 4.2 POST - Yangi filial ochish

**Method:** `POST`

**URL:** `http://localhost:8000/api/branches/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "name": "South Branch",
  "address": "456 South Avenue",
  "phone": "+998901234567",
  "educational_center": 1,
  "manager": 3,
  "status": "Open"
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 2,
  "name": "South Branch",
  "address": "456 South Avenue",
  "phone": "+998901234567",
  "educational_center": 1,
  "manager": 3,
  "status": "Open",
  "student_count": 0,
  "created_at": "2024-11-29T10:00:00Z"
}
\`\`\`

---

### 4.3 GET - Bir filialni ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/branches/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "name": "Main Branch",
  "address": "123 Main Street",
  "phone": "+998901234567",
  "status": "Open",
  ...
}
\`\`\`

---

### 4.4 PUT - Filialni to'liq yangilash

**Method:** `PUT`

**URL:** `http://localhost:8000/api/branches/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "name": "Updated Main Branch",
  "address": "123 Main Street, Updated",
  "phone": "+998901234567",
  "educational_center": 1,
  "manager": 3,
  "status": "Open"
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "name": "Updated Main Branch",
  "address": "123 Main Street, Updated",
  ...
}
\`\`\`

---

### 4.5 PATCH - Filialni qisman yangilash

**Method:** `PATCH`

**URL:** `http://localhost:8000/api/branches/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "phone": "+998909876543"
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "phone": "+998909876543",
  ...
}
\`\`\`

---

### 4.6 DELETE - Filialni o'chirish

**Method:** `DELETE`

**URL:** `http://localhost:8000/api/branches/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (204 No Content):**
\`\`\`
(Bo'sh)
\`\`\`

---

### 4.7 POST - Filialni ochish

**Method:** `POST`

**URL:** `http://localhost:8000/api/branches/1/open/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "status": "Branch opened"
}
\`\`\`

---

### 4.8 POST - Filialni yopish

**Method:** `POST`

**URL:** `http://localhost:8000/api/branches/1/close/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "status": "Branch closed"
}
\`\`\`

---

## 5. SUBJECT/COURSE API

### Base Endpoint: `/api/subjects/`

**Role:** Director

**Description:** Fanlar va kurslar boshqaruvi - matematika, ona tili, informatika kabi fanlarni qo'shish

---

### 5.1 GET - Barcha fanlarni ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/subjects/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
[
  {
    "id": 1,
    "name": "Mathematics",
    "code": "MATH101",
    "description": "Introduction to Mathematics",
    "credits": 3,
    "educational_center": 1,
    "created_at": "2023-01-15T10:30:00Z"
  }
]
\`\`\`

---

### 5.2 POST - Yangi fan qo'shish

**Method:** `POST`

**URL:** `http://localhost:8000/api/subjects/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "name": "English Language",
  "code": "ENG101",
  "description": "English speaking and writing skills",
  "credits": 3,
  "educational_center": 1
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 2,
  "name": "English Language",
  "code": "ENG101",
  "description": "English speaking and writing skills",
  "credits": 3,
  "educational_center": 1,
  "created_at": "2024-11-29T10:00:00Z"
}
\`\`\`

---

### 5.3 GET - Bir fanni ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/subjects/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "name": "Mathematics",
  "code": "MATH101",
  "description": "Introduction to Mathematics",
  "credits": 3,
  "educational_center": 1
}
\`\`\`

---

### 5.4 PUT - Fanni to'liq yangilash

**Method:** `PUT`

**URL:** `http://localhost:8000/api/subjects/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "name": "Advanced Mathematics",
  "code": "MATH102",
  "description": "Advanced Math Concepts",
  "credits": 4,
  "educational_center": 1
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "name": "Advanced Mathematics",
  "code": "MATH102",
  "description": "Advanced Math Concepts",
  "credits": 4,
  "educational_center": 1
}
\`\`\`

---

### 5.5 PATCH - Fanni qisman yangilash

**Method:** `PATCH`

**URL:** `http://localhost:8000/api/subjects/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "name": "Updated Mathematics"
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "name": "Updated Mathematics",
  ...
}
\`\`\`

---

### 5.6 DELETE - Fanni o'chirish

**Method:** `DELETE`

**URL:** `http://localhost:8000/api/subjects/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (204 No Content):**
\`\`\`
(Bo'sh)
\`\`\`

---

## 6. GROUP API

### Base Endpoint: `/api/groups/`

**Role:** Director, Manager

**Description:** Guruhlarni boshqarish - har bir guruh bir fan, bir o'qituvchi, bir jadvalla

---

### 6.1 GET - Barcha guruhlarni ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/groups/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
[
  {
    "id": 1,
    "name": "Mathematics Group A",
    "subject": 1,
    "teacher": 4,
    "branch": 1,
    "educational_center": 1,
    "level": "Beginner",
    "capacity": 30,
    "schedule": "Monday, Wednesday, Friday 10:00 AM",
    "status": "Active",
    "created_at": "2023-01-15T10:30:00Z"
  }
]
\`\`\`

---

### 6.2 POST - Yangi guruh yaratish

**Method:** `POST`

**URL:** `http://localhost:8000/api/groups/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "name": "English Group B",
  "subject": 2,
  "teacher": 4,
  "branch": 1,
  "educational_center": 1,
  "level": "Intermediate",
  "capacity": 25,
  "schedule": "Tuesday, Thursday 2:00 PM",
  "status": "Active"
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 2,
  "name": "English Group B",
  "subject": 2,
  "teacher": 4,
  "branch": 1,
  "educational_center": 1,
  "level": "Intermediate",
  "capacity": 25,
  "schedule": "Tuesday, Thursday 2:00 PM",
  "status": "Active",
  "created_at": "2024-11-29T10:00:00Z"
}
\`\`\`

---

### 6.3 GET - Bir guruhni ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/groups/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "name": "Mathematics Group A",
  "subject": 1,
  "teacher": 4,
  "branch": 1,
  "level": "Beginner",
  "capacity": 30,
  "schedule": "Monday, Wednesday, Friday 10:00 AM",
  "status": "Active"
}
\`\`\`

---

### 6.4 PUT - Guruhni to'liq yangilash

**Method:** `PUT`

**URL:** `http://localhost:8000/api/groups/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "name": "Updated Mathematics Group A",
  "subject": 1,
  "teacher": 4,
  "branch": 1,
  "educational_center": 1,
  "level": "Intermediate",
  "capacity": 35,
  "schedule": "Monday, Wednesday, Friday 11:00 AM",
  "status": "Active"
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "name": "Updated Mathematics Group A",
  "level": "Intermediate",
  "capacity": 35,
  ...
}
\`\`\`

---

### 6.5 PATCH - Guruhni qisman yangilash

**Method:** `PATCH`

**URL:** `http://localhost:8000/api/groups/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "status": "Inactive"
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "status": "Inactive",
  ...
}
\`\`\`

---

### 6.6 DELETE - Guruhni o'chirish

**Method:** `DELETE`

**URL:** `http://localhost:8000/api/groups/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (204 No Content):**
\`\`\`
(Bo'sh)
\`\`\`

---

### 6.7 GET - Guruh statistikasi

**Method:** `GET`

**URL:** `http://localhost:8000/api/groups/1/statistics/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "students_count": 28,
  "lessons_count": 24,
  "average_attendance": 85.5,
  "payment_status": {
    "total_payments": 2800,
    "payment_count": 28
  }
}
\`\`\`

---

### 6.8 GET - Guruh davomati hisoboti

**Method:** `GET`

**URL:** `http://localhost:8000/api/groups/1/attendance-report/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "total_lessons": 24,
  "total_attendances": 672,
  "present_count": 573,
  "absent_count": 67,
  "late_count": 32
}
\`\`\`

---

## 7. STUDENT API

### Base Endpoint: `/api/students/`

**Role:** Director, Manager, Admin, Student

**Description:** Talabalarni qo'shish va boshqarish

---

### 7.1 GET - Barcha talabalarni ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/students/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
[
  {
    "id": 1,
    "user": {
      "id": 7,
      "username": "student1",
      "email": "student1@example.com",
      "first_name": "Ali",
      "last_name": "Karim"
    },
    "phone": "+998901234567",
    "parent_phone": "+998901234568",
    "group": 1,
    "branch": 1,
    "status": "Active",
    "enrollment_date": "2023-09-01",
    "birthday": "2005-03-15",
    "address": "Tashkent, Uzbekistan",
    "image": null,
    "created_at": "2023-09-01T10:30:00Z"
  }
]
\`\`\`

---

### 7.2 POST - Yangi talaba qo'shish

**Method:** `POST`

**URL:** `http://localhost:8000/api/students/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "username": "new_student",
  "password": "Student@123",
  "first_name": "Fatima",
  "last_name": "Shodmonova",
  "email": "fatima@example.com",
  "phone": "+998901234567",
  "parent_phone": "+998901234568",
  "group": 1,
  "branch": 1,
  "status": "Active",
  "enrollment_date": "2024-11-29",
  "birthday": "2006-05-20",
  "address": "Samarkand, Uzbekistan",
  "image": null
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 2,
  "user": {
    "id": 8,
    "username": "new_student",
    "email": "fatima@example.com",
    "first_name": "Fatima",
    "last_name": "Shodmonova"
  },
  "phone": "+998901234567",
  "parent_phone": "+998901234568",
  "group": 1,
  "branch": 1,
  "status": "Active",
  "enrollment_date": "2024-11-29",
  "birthday": "2006-05-20",
  "address": "Samarkand, Uzbekistan",
  "image": null,
  "created_at": "2024-11-29T10:00:00Z"
}
\`\`\`

---

### 7.3 GET - Bir talabani ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/students/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "user": {
    "id": 7,
    "username": "student1",
    "email": "student1@example.com",
    "first_name": "Ali",
    "last_name": "Karim"
  },
  "phone": "+998901234567",
  "parent_phone": "+998901234568",
  "group": 1,
  "branch": 1,
  "status": "Active",
  "enrollment_date": "2023-09-01",
  "birthday": "2005-03-15",
  "address": "Tashkent, Uzbekistan",
  "image": null
}
\`\`\`

---

### 7.4 PUT - Talabani to'liq yangilash

**Method:** `PUT`

**URL:** `http://localhost:8000/api/students/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "username": "student1",
  "first_name": "Ali",
  "last_name": "Karim",
  "email": "newemail@example.com",
  "phone": "+998909876543",
  "parent_phone": "+998909876544",
  "group": 1,
  "branch": 1,
  "status": "Active",
  "enrollment_date": "2023-09-01",
  "birthday": "2005-03-15",
  "address": "Tashkent, Uzbekistan",
  "image": null
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "user": {
    "id": 7,
    "username": "student1",
    "email": "newemail@example.com"
  },
  "phone": "+998909876543",
  ...
}
\`\`\`

---

### 7.5 PATCH - Talabani qisman yangilash

**Method:** `PATCH`

**URL:** `http://localhost:8000/api/students/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "phone": "+998909999999"
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "phone": "+998909999999",
  ...
}
\`\`\`

---

### 7.6 DELETE - Talabani o'chirish

**Method:** `DELETE`

**URL:** `http://localhost:8000/api/students/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (204 No Content):**
\`\`\`
(Bo'sh)
\`\`\`

---

### 7.7 POST - Talabani bloklash

**Method:** `POST`

**URL:** `http://localhost:8000/api/students/1/block/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "status": "Student blocked"
}
\`\`\`

---

### 7.8 POST - Talabani guruhga birikish

**Method:** `POST`

**URL:** `http://localhost:8000/api/students/1/assign-group/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

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

### 7.9 GET - Talabaning davomati tarixi

**Method:** `GET`

**URL:** `http://localhost:8000/api/students/1/attendance-history/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
[
  {
    "status": "Present",
    "count": 20
  },
  {
    "status": "Absent",
    "count": 2
  },
  {
    "status": "Late",
    "count": 3
  }
]
\`\`\`

---

### 7.10 GET - Talabaning to'lov tarixi

**Method:** `GET`

**URL:** `http://localhost:8000/api/students/1/payment-history/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
[
  {
    "id": 1,
    "student": 1,
    "group": 1,
    "amount": 100.0,
    "payment_date": "2023-09-01",
    "due_date": "2023-09-01",
    "status": "Paid",
    "payment_method": "Cash",
    "receipt_number": "REC001"
  }
]
\`\`\`

---

## 8. TEACHER API

### Base Endpoint: `/api/teachers/`

**Role:** Director, Manager

**Description:** O'qituvchilarni qo'shish va boshqarish

---

### 8.1 GET - Barcha o'qituvchilarni ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/teachers/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
[
  {
    "id": 1,
    "user": {
      "id": 4,
      "username": "teacher1",
      "email": "teacher1@example.com",
      "first_name": "Muhammad",
      "last_name": "Abdullayev"
    },
    "phone": "+998901234567",
    "specialization": "Mathematics",
    "qualification": "Master's Degree",
    "branch": 1,
    "performance_rating": 4.5,
    "hire_date": "2022-08-01",
    "birthday": "1988-06-12",
    "image": null,
    "created_at": "2022-08-01T10:30:00Z"
  }
]
\`\`\`

---

### 8.2 POST - Yangi o'qituvchi qo'shish

**Method:** `POST`

**URL:** `http://localhost:8000/api/teachers/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "username": "teacher2",
  "password": "Teacher@123",
  "first_name": "Sardar",
  "last_name": "Hasanov",
  "email": "sardar@example.com",
  "phone": "+998901234567",
  "specialization": "English Language",
  "qualification": "Bachelor's Degree",
  "branch": 1,
  "performance_rating": 0,
  "hire_date": "2024-11-29",
  "birthday": "1990-07-15",
  "image": null
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 2,
  "user": {
    "id": 5,
    "username": "teacher2",
    "email": "sardar@example.com",
    "first_name": "Sardar",
    "last_name": "Hasanov"
  },
  "phone": "+998901234567",
  "specialization": "English Language",
  "qualification": "Bachelor's Degree",
  "branch": 1,
  "performance_rating": 0,
  "hire_date": "2024-11-29",
  "birthday": "1990-07-15",
  "image": null,
  "created_at": "2024-11-29T10:00:00Z"
}
\`\`\`

---

### 8.3 GET - Bir o'qituvchini ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/teachers/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "user": {
    "id": 4,
    "username": "teacher1",
    "email": "teacher1@example.com",
    "first_name": "Muhammad",
    "last_name": "Abdullayev"
  },
  "phone": "+998901234567",
  "specialization": "Mathematics",
  "qualification": "Master's Degree",
  "branch": 1,
  "performance_rating": 4.5,
  "hire_date": "2022-08-01",
  "birthday": "1988-06-12",
  "image": null
}
\`\`\`

---

### 8.4 PUT - O'qituvchini to'liq yangilash

**Method:** `PUT`

**URL:** `http://localhost:8000/api/teachers/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "username": "teacher1",
  "first_name": "Muhammad",
  "last_name": "Abdullayev",
  "email": "newemail@example.com",
  "phone": "+998909876543",
  "specialization": "Mathematics",
  "qualification": "Master's Degree",
  "branch": 1,
  "performance_rating": 4.5,
  "hire_date": "2022-08-01",
  "birthday": "1988-06-12",
  "image": null
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "user": {
    "id": 4,
    "username": "teacher1",
    "email": "newemail@example.com"
  },
  "phone": "+998909876543",
  ...
}
\`\`\`

---

### 8.5 PATCH - O'qituvchini qisman yangilash

**Method:** `PATCH`

**URL:** `http://localhost:8000/api/teachers/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "performance_rating": 4.8
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "performance_rating": 4.8,
  ...
}
\`\`\`

---

### 8.6 DELETE - O'qituvchini o'chirish

**Method:** `DELETE`

**URL:** `http://localhost:8000/api/teachers/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (204 No Content):**
\`\`\`
(Bo'sh)
\`\`\`

---

### 8.7 POST - O'qituvchini baholash

**Method:** `POST`

**URL:** `http://localhost:8000/api/teachers/1/rate/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "rating": 4.7
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "status": "Teacher rated",
  "rating": 4.7
}
\`\`\`

---

### 8.8 GET - O'qituvchining jadvali

**Method:** `GET`

**URL:** `http://localhost:8000/api/teachers/1/schedule/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
[
  {
    "id": 1,
    "group": {
      "id": 1,
      "name": "Mathematics Group A"
    },
    "subject": 1,
    "date": "2024-11-29",
    "start_time": "10:00:00",
    "end_time": "11:30:00",
    "room": 1,
    "is_cancelled": false,
    "online_link": null
  }
]
\`\`\`

---

### 8.9 GET - O'qituvchining faoliyat ko'rsatkichlari

**Method:** `GET`

**URL:** `http://localhost:8000/api/teachers/1/performance/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "lessons_count": 24,
  "attendances_marked": 456,
  "assignments_given": 12,
  "exams_conducted": 4,
  "performance_rating": 4.5
}
\`\`\`

---

## 9. LESSON API

### Base Endpoint: `/api/lessons/`

**Role:** Director, Manager, Teacher

**Description:** Darslar boshqaruvi - dars kunları, vaqtlari, jadvallar

---

### 9.1 GET - Barcha darslarni ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/lessons/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
[
  {
    "id": 1,
    "group": {
      "id": 1,
      "name": "Mathematics Group A"
    },
    "subject": 1,
    "teacher": 1,
    "date": "2024-11-29",
    "start_time": "10:00:00",
    "end_time": "11:30:00",
    "duration_minutes": 90,
    "room": 1,
    "is_cancelled": false,
    "online_link": null,
    "created_at": "2024-11-28T15:30:00Z"
  }
]
\`\`\`

---

### 9.2 POST - Yangi dars yaratish

**Method:** `POST`

**URL:** `http://localhost:8000/api/lessons/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "group": 1,
  "subject": 1,
  "teacher": 1,
  "date": "2024-12-01",
  "start_time": "10:00:00",
  "end_time": "11:30:00",
  "duration_minutes": 90,
  "room": 1,
  "is_cancelled": false,
  "online_link": null
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 2,
  "group": {
    "id": 1,
    "name": "Mathematics Group A"
  },
  "subject": 1,
  "teacher": 1,
  "date": "2024-12-01",
  "start_time": "10:00:00",
  "end_time": "11:30:00",
  "duration_minutes": 90,
  "room": 1,
  "is_cancelled": false,
  "online_link": null,
  "created_at": "2024-11-29T10:00:00Z"
}
\`\`\`

---

### 9.3 GET - Bir darsni ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/lessons/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "group": {
    "id": 1,
    "name": "Mathematics Group A"
  },
  "subject": 1,
  "teacher": 1,
  "date": "2024-11-29",
  "start_time": "10:00:00",
  "end_time": "11:30:00",
  "duration_minutes": 90,
  "room": 1,
  "is_cancelled": false,
  "online_link": null
}
\`\`\`

---

### 9.4 PUT - Darsni to'liq yangilash

**Method:** `PUT`

**URL:** `http://localhost:8000/api/lessons/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "group": 1,
  "subject": 1,
  "teacher": 1,
  "date": "2024-11-29",
  "start_time": "11:00:00",
  "end_time": "12:30:00",
  "duration_minutes": 90,
  "room": 2,
  "is_cancelled": false,
  "online_link": null
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "group": 1,
  "subject": 1,
  "teacher": 1,
  "date": "2024-11-29",
  "start_time": "11:00:00",
  "end_time": "12:30:00",
  "room": 2,
  ...
}
\`\`\`

---

### 9.5 PATCH - Darsni qisman yangilash

**Method:** `PATCH`

**URL:** `http://localhost:8000/api/lessons/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "room": 3
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "room": 3,
  ...
}
\`\`\`

---

### 9.6 DELETE - Darsni o'chirish

**Method:** `DELETE`

**URL:** `http://localhost:8000/api/lessons/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (204 No Content):**
\`\`\`
(Bo'sh)
\`\`\`

---

### 9.7 POST - Darsni bekor qilish

**Method:** `POST`

**URL:** `http://localhost:8000/api/lessons/1/cancel/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "status": "Lesson cancelled"
}
\`\`\`

---

### 9.8 POST - Onlayn dars havolasi generatsiya qilish

**Method:** `POST`

**URL:** `http://localhost:8000/api/lessons/1/generate-online-link/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "online_link": "https://meet.example.com/abc123def456"
}
\`\`\`

---

## 10. ATTENDANCE API

### Base Endpoint: `/api/attendance/`

**Role:** Teacher, Admin

**Description:** Dars davomatini qo'yish va boshqarish

---

### 10.1 GET - Barcha davomatlarni ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/attendance/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
[
  {
    "id": 1,
    "lesson": {
      "id": 1,
      "date": "2024-11-29"
    },
    "student": {
      "id": 1,
      "user": {
        "first_name": "Ali",
        "last_name": "Karim"
      }
    },
    "status": "Present",
    "marked_by": 1,
    "notes": "",
    "marked_at": "2024-11-29T11:30:00Z"
  }
]
\`\`\`

---

### 10.2 POST - Dars davomati qo'yish

**Method:** `POST`

**URL:** `http://localhost:8000/api/attendance/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "lesson": 1,
  "student": 1,
  "status": "Present",
  "notes": ""
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 2,
  "lesson": {
    "id": 1,
    "date": "2024-11-29"
  },
  "student": {
    "id": 1,
    "user": {
      "first_name": "Ali",
      "last_name": "Karim"
    }
  },
  "status": "Present",
  "marked_by": 1,
  "notes": "",
  "marked_at": "2024-11-29T10:00:00Z"
}
\`\`\`

---

### 10.3 GET - Bir davomatni ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/attendance/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "lesson": {
    "id": 1,
    "date": "2024-11-29"
  },
  "student": {
    "id": 1,
    "user": {
      "first_name": "Ali",
      "last_name": "Karim"
    }
  },
  "status": "Present",
  "marked_by": 1,
  "notes": "",
  "marked_at": "2024-11-29T11:30:00Z"
}
\`\`\`

---

### 10.4 PUT - Davomatni to'liq yangilash

**Method:** `PUT`

**URL:** `http://localhost:8000/api/attendance/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "lesson": 1,
  "student": 1,
  "status": "Late",
  "notes": "15 minuta kech keldi"
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "lesson": 1,
  "student": 1,
  "status": "Late",
  "notes": "15 minuta kech keldi",
  ...
}
\`\`\`

---

### 10.5 PATCH - Davomatni qisman yangilash

**Method:** `PATCH`

**URL:** `http://localhost:8000/api/attendance/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "status": "Absent",
  "notes": "Bemor edi"
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "status": "Absent",
  "notes": "Bemor edi",
  ...
}
\`\`\`

---

### 10.6 DELETE - Davomatni o'chirish

**Method:** `DELETE`

**URL:** `http://localhost:8000/api/attendance/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (204 No Content):**
\`\`\`
(Bo'sh)
\`\`\`

---

### 10.7 POST - Ommaviy davomat qo'yish

**Method:** `POST`

**URL:** `http://localhost:8000/api/attendance/bulk-mark/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

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
      "notes": "Bemor edi"
    },
    {
      "student_id": 3,
      "status": "Late",
      "notes": "10 minuta kech"
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

## 11. PAYMENT API

### Base Endpoint: `/api/payments/`

**Role:** Admin, Manager

**Description:** Talaba to'lovlarini boshqarish

---

### 11.1 GET - Barcha to'lovlarni ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/payments/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
[
  {
    "id": 1,
    "student": {
      "id": 1,
      "user": {
        "first_name": "Ali",
        "last_name": "Karim"
      }
    },
    "group": 1,
    "amount": 100.0,
    "payment_date": "2024-11-29",
    "due_date": "2024-11-29",
    "status": "Paid",
    "payment_method": "Cash",
    "receipt_number": "REC001"
  }
]
\`\`\`

---

### 11.2 POST - Yangi to'lov qo'shish

**Method:** `POST`

**URL:** `http://localhost:8000/api/payments/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "student": 1,
  "group": 1,
  "amount": 100.0,
  "payment_date": "2024-11-29",
  "due_date": "2024-12-29",
  "status": "Paid",
  "payment_method": "Card",
  "receipt_number": "REC002"
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 2,
  "student": {
    "id": 1,
    "user": {
      "first_name": "Ali",
      "last_name": "Karim"
    }
  },
  "group": 1,
  "amount": 100.0,
  "payment_date": "2024-11-29",
  "due_date": "2024-12-29",
  "status": "Paid",
  "payment_method": "Card",
  "receipt_number": "REC002"
}
\`\`\`

---

### 11.3 GET - Bir to'lovni ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/payments/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "student": {
    "id": 1,
    "user": {
      "first_name": "Ali",
      "last_name": "Karim"
    }
  },
  "group": 1,
  "amount": 100.0,
  "payment_date": "2024-11-29",
  "due_date": "2024-11-29",
  "status": "Paid",
  "payment_method": "Cash",
  "receipt_number": "REC001"
}
\`\`\`

---

### 11.4 PUT - To'lovni to'liq yangilash

**Method:** `PUT`

**URL:** `http://localhost:8000/api/payments/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "student": 1,
  "group": 1,
  "amount": 120.0,
  "payment_date": "2024-11-29",
  "due_date": "2024-12-29",
  "status": "Paid",
  "payment_method": "Bank Transfer",
  "receipt_number": "REC001"
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "student": 1,
  "group": 1,
  "amount": 120.0,
  "payment_date": "2024-11-29",
  "due_date": "2024-12-29",
  "status": "Paid",
  "payment_method": "Bank Transfer",
  "receipt_number": "REC001"
}
\`\`\`

---

### 11.5 PATCH - To'lovni qisman yangilash

**Method:** `PATCH`

**URL:** `http://localhost:8000/api/payments/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "status": "Pending"
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "status": "Pending",
  ...
}
\`\`\`

---

### 11.6 DELETE - To'lovni o'chirish

**Method:** `DELETE`

**URL:** `http://localhost:8000/api/payments/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (204 No Content):**
\`\`\`
(Bo'sh)
\`\`\`

---

### 11.7 GET - Qarzdor talabalar ro'yxati

**Method:** `GET`

**URL:** `http://localhost:8000/api/payments/debtors/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
[
  {
    "id": 2,
    "user": {
      "id": 8,
      "username": "student2",
      "email": "student2@example.com",
      "first_name": "Fatima",
      "last_name": "Shodmonova"
    },
    "phone": "+998901234567",
    "group": 2,
    "branch": 1,
    "status": "Active"
  }
]
\`\`\`

---

### 11.8 GET - To'lovlar statistikasi

**Method:** `GET`

**URL:** `http://localhost:8000/api/payments/statistics/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "total_revenue": 2800.0,
  "payment_count": 28,
  "average_payment": 100.0
}
\`\`\`

---

## 12. ASSIGNMENT API

### Base Endpoint: `/api/assignments/`

**Role:** Teacher

**Description:** Uy vazifalarni qo'shish va boshqarish

---

### 12.1 GET - Barcha uy vazifalarni ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/assignments/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
[
  {
    "id": 1,
    "teacher": 1,
    "group": 1,
    "title": "Chapter 5 Exercises",
    "description": "Solve all exercises from Chapter 5",
    "due_date": "2024-12-01",
    "created_at": "2024-11-29T10:00:00Z"
  }
]
\`\`\`

---

### 12.2 POST - Yangi uy vazifasi yaratish

**Method:** `POST`

**URL:** `http://localhost:8000/api/assignments/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "teacher": 1,
  "group": 1,
  "title": "Algebra Homework",
  "description": "Solve 20 algebra problems from textbook page 45-47",
  "due_date": "2024-12-03"
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 2,
  "teacher": 1,
  "group": 1,
  "title": "Algebra Homework",
  "description": "Solve 20 algebra problems from textbook page 45-47",
  "due_date": "2024-12-03",
  "created_at": "2024-11-29T10:00:00Z"
}
\`\`\`

---

### 12.3 GET - Bir uy vazifasini ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/assignments/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "teacher": 1,
  "group": 1,
  "title": "Chapter 5 Exercises",
  "description": "Solve all exercises from Chapter 5",
  "due_date": "2024-12-01",
  "created_at": "2024-11-29T10:00:00Z"
}
\`\`\`

---

### 12.4 PUT - Uy vazifasini to'liq yangilash

**Method:** `PUT`

**URL:** `http://localhost:8000/api/assignments/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "teacher": 1,
  "group": 1,
  "title": "Updated Chapter 5 Exercises",
  "description": "Solve all exercises and write explanation",
  "due_date": "2024-12-02"
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "teacher": 1,
  "group": 1,
  "title": "Updated Chapter 5 Exercises",
  "description": "Solve all exercises and write explanation",
  "due_date": "2024-12-02"
}
\`\`\`

---

### 12.5 PATCH - Uy vazifasini qisman yangilash

**Method:** `PATCH`

**URL:** `http://localhost:8000/api/assignments/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "due_date": "2024-12-05"
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "due_date": "2024-12-05",
  ...
}
\`\`\`

---

### 12.6 DELETE - Uy vazifasini o'chirish

**Method:** `DELETE`

**URL:** `http://localhost:8000/api/assignments/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (204 No Content):**
\`\`\`
(Bo'sh)
\`\`\`

---

## 13. ASSIGNMENT SUBMISSION API

### Base Endpoint: `/api/submissions/`

**Role:** Student, Teacher

**Description:** Talabalar tomonidan uy vazifalarini yuborish va o'qituvchi tomonidan baholash

---

### 13.1 GET - Barcha uy vazifasi topshiriqlarini ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/submissions/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
[
  {
    "id": 1,
    "assignment": {
      "id": 1,
      "title": "Chapter 5 Exercises"
    },
    "student": {
      "id": 1,
      "user": {
        "first_name": "Ali",
        "last_name": "Karim"
      }
    },
    "submission_date": "2024-11-30",
    "grade": 85,
    "feedback": "Great work!",
    "file": "http://localhost:8000/media/submissions/file.pdf"
  }
]
\`\`\`

---

### 13.2 POST - Uy vazifasini yuborish

**Method:** `POST`

**URL:** `http://localhost:8000/api/submissions/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: multipart/form-data
\`\`\`

**Request Body (form-data):**
\`\`\`
assignment: 1
student: 1
submission_date: 2024-11-30
file: <binary file data>
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 2,
  "assignment": {
    "id": 1,
    "title": "Chapter 5 Exercises"
  },
  "student": {
    "id": 1,
    "user": {
      "first_name": "Ali",
      "last_name": "Karim"
    }
  },
  "submission_date": "2024-11-30",
  "grade": null,
  "feedback": "",
  "file": "http://localhost:8000/media/submissions/uploaded_file.pdf"
}
\`\`\`

---

### 13.3 GET - Bir topshiriqni ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/submissions/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "assignment": {
    "id": 1,
    "title": "Chapter 5 Exercises"
  },
  "student": {
    "id": 1,
    "user": {
      "first_name": "Ali",
      "last_name": "Karim"
    }
  },
  "submission_date": "2024-11-30",
  "grade": 85,
  "feedback": "Great work!",
  "file": "http://localhost:8000/media/submissions/file.pdf"
}
\`\`\`

---

### 13.4 PUT - Topshiriqni to'liq yangilash

**Method:** `PUT`

**URL:** `http://localhost:8000/api/submissions/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "assignment": 1,
  "student": 1,
  "submission_date": "2024-11-30",
  "grade": 90,
  "feedback": "Excellent! Keep it up!"
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "assignment": 1,
  "student": 1,
  "submission_date": "2024-11-30",
  "grade": 90,
  "feedback": "Excellent! Keep it up!"
}
\`\`\`

---

### 13.5 PATCH - Topshiriqni qisman yangilash

**Method:** `PATCH`

**URL:** `http://localhost:8000/api/submissions/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "grade": 95,
  "feedback": "Perfect!"
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "grade": 95,
  "feedback": "Perfect!",
  ...
}
\`\`\`

---

### 13.6 DELETE - Topshiriqni o'chirish

**Method:** `DELETE`

**URL:** `http://localhost:8000/api/submissions/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (204 No Content):**
\`\`\`
(Bo'sh)
\`\`\`

---

## 14. EXAM API

### Base Endpoint: `/api/exams/`

**Role:** Teacher

**Description:** Imtihonlarni yaratish va boshqarish

---

### 14.1 GET - Barcha imtihonlarni ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/exams/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
[
  {
    "id": 1,
    "teacher": 1,
    "group": 1,
    "title": "Midterm Exam",
    "date": "2024-12-15",
    "start_time": "10:00:00",
    "end_time": "12:00:00",
    "total_marks": 100,
    "passing_marks": 40,
    "created_at": "2024-11-29T10:00:00Z"
  }
]
\`\`\`

---

### 14.2 POST - Yangi imtihon yaratish

**Method:** `POST`

**URL:** `http://localhost:8000/api/exams/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "teacher": 1,
  "group": 1,
  "title": "Final Exam",
  "date": "2024-12-20",
  "start_time": "14:00:00",
  "end_time": "16:00:00",
  "total_marks": 100,
  "passing_marks": 50
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 2,
  "teacher": 1,
  "group": 1,
  "title": "Final Exam",
  "date": "2024-12-20",
  "start_time": "14:00:00",
  "end_time": "16:00:00",
  "total_marks": 100,
  "passing_marks": 50,
  "created_at": "2024-11-29T10:00:00Z"
}
\`\`\`

---

### 14.3 GET - Bir imtihonni ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/exams/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "teacher": 1,
  "group": 1,
  "title": "Midterm Exam",
  "date": "2024-12-15",
  "start_time": "10:00:00",
  "end_time": "12:00:00",
  "total_marks": 100,
  "passing_marks": 40
}
\`\`\`

---

### 14.4 PUT - Imtihonni to'liq yangilash

**Method:** `PUT`

**URL:** `http://localhost:8000/api/exams/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "teacher": 1,
  "group": 1,
  "title": "Updated Midterm Exam",
  "date": "2024-12-16",
  "start_time": "11:00:00",
  "end_time": "13:00:00",
  "total_marks": 100,
  "passing_marks": 40
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "teacher": 1,
  "group": 1,
  "title": "Updated Midterm Exam",
  "date": "2024-12-16",
  "start_time": "11:00:00",
  "end_time": "13:00:00",
  "total_marks": 100,
  "passing_marks": 40
}
\`\`\`

---

### 14.5 PATCH - Imtihonni qisman yangilash

**Method:** `PATCH`

**URL:** `http://localhost:8000/api/exams/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "passing_marks": 45
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "passing_marks": 45,
  ...
}
\`\`\`

---

### 14.6 DELETE - Imtihonni o'chirish

**Method:** `DELETE`

**URL:** `http://localhost:8000/api/exams/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (204 No Content):**
\`\`\`
(Bo'sh)
\`\`\`

---

### 14.7 GET - Imtihon natijalari

**Method:** `GET`

**URL:** `http://localhost:8000/api/exams/1/results/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
[
  {
    "id": 1,
    "student": {
      "id": 1,
      "user": {
        "first_name": "Ali",
        "last_name": "Karim"
      }
    },
    "exam": 1,
    "marks": 85,
    "percentage": 85.0,
    "grade": "A",
    "is_passed": true
  }
]
\`\`\`

---

## 15. EXAM RESULT API

### Base Endpoint: `/api/exam-results/`

**Role:** Student, Teacher

**Description:** Imtihon natijalari va balllar

---

### 15.1 GET - Barcha imtihon natijalarini ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/exam-results/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
[
  {
    "id": 1,
    "student": {
      "id": 1,
      "user": {
        "first_name": "Ali",
        "last_name": "Karim"
      }
    },
    "exam": {
      "id": 1,
      "title": "Midterm Exam"
    },
    "marks": 85,
    "percentage": 85.0,
    "grade": "A",
    "is_passed": true
  }
]
\`\`\`

---

### 15.2 POST - Imtihon natijalasini kiritish

**Method:** `POST`

**URL:** `http://localhost:8000/api/exam-results/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "student": 1,
  "exam": 1,
  "marks": 90,
  "percentage": 90.0,
  "grade": "A+",
  "is_passed": true
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 2,
  "student": {
    "id": 1,
    "user": {
      "first_name": "Ali",
      "last_name": "Karim"
    }
  },
  "exam": {
    "id": 1,
    "title": "Midterm Exam"
  },
  "marks": 90,
  "percentage": 90.0,
  "grade": "A+",
  "is_passed": true
}
\`\`\`

---

### 15.3 GET - Bir imtihon natijasini ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/exam-results/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "student": {
    "id": 1,
    "user": {
      "first_name": "Ali",
      "last_name": "Karim"
    }
  },
  "exam": {
    "id": 1,
    "title": "Midterm Exam"
  },
  "marks": 85,
  "percentage": 85.0,
  "grade": "A",
  "is_passed": true
}
\`\`\`

---

### 15.4 PUT - Imtihon natijasini to'liq yangilash

**Method:** `PUT`

**URL:** `http://localhost:8000/api/exam-results/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "student": 1,
  "exam": 1,
  "marks": 92,
  "percentage": 92.0,
  "grade": "A+",
  "is_passed": true
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "student": 1,
  "exam": 1,
  "marks": 92,
  "percentage": 92.0,
  "grade": "A+",
  "is_passed": true
}
\`\`\`

---

### 15.5 PATCH - Imtihon natijasini qisman yangilash

**Method:** `PATCH`

**URL:** `http://localhost:8000/api/exam-results/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "marks": 88,
  "percentage": 88.0,
  "grade": "A"
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "marks": 88,
  "percentage": 88.0,
  "grade": "A",
  ...
}
\`\`\`

---

### 15.6 DELETE - Imtihon natijasini o'chirish

**Method:** `DELETE`

**URL:** `http://localhost:8000/api/exam-results/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (204 No Content):**
\`\`\`
(Bo'sh)
\`\`\`

---

## 16. ROOM API

### Base Endpoint: `/api/rooms/`

**Role:** Manager, Admin

**Description:** O'quv markazining xonalarini boshqarish

---

### 16.1 GET - Barcha xonalarni ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/rooms/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
[
  {
    "id": 1,
    "name": "Room A1",
    "capacity": 30,
    "branch": 1,
    "is_available": true,
    "created_at": "2023-01-15T10:30:00Z"
  }
]
\`\`\`

---

### 16.2 POST - Yangi xona qo'shish

**Method:** `POST`

**URL:** `http://localhost:8000/api/rooms/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "name": "Room B2",
  "capacity": 40,
  "branch": 1,
  "is_available": true
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 2,
  "name": "Room B2",
  "capacity": 40,
  "branch": 1,
  "is_available": true,
  "created_at": "2024-11-29T10:00:00Z"
}
\`\`\`

---

### 16.3 GET - Bir xonani ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/rooms/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "name": "Room A1",
  "capacity": 30,
  "branch": 1,
  "is_available": true
}
\`\`\`

---

### 16.4 PUT - Xonani to'liq yangilash

**Method:** `PUT`

**URL:** `http://localhost:8000/api/rooms/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "name": "Room A1 Updated",
  "capacity": 35,
  "branch": 1,
  "is_available": true
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "name": "Room A1 Updated",
  "capacity": 35,
  "branch": 1,
  "is_available": true
}
\`\`\`

---

### 16.5 PATCH - Xonani qisman yangilash

**Method:** `PATCH`

**URL:** `http://localhost:8000/api/rooms/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "capacity": 50
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "capacity": 50,
  ...
}
\`\`\`

---

### 16.6 DELETE - Xonani o'chirish

**Method:** `DELETE`

**URL:** `http://localhost:8000/api/rooms/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (204 No Content):**
\`\`\`
(Bo'sh)
\`\`\`

---

### 16.7 POST - Xonaning mavjudligini o'zgarrish

**Method:** `POST`

**URL:** `http://localhost:8000/api/rooms/1/toggle-availability/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "is_available": false
}
\`\`\`

---

## 17. PAYROLL API

### Base Endpoint: `/api/payroll/`

**Role:** Director, Manager

**Description:** O'qituvchilar oylik va voqealarga pul berish

---

### 17.1 GET - Barcha oyliklar ro'yxati

**Method:** `GET`

**URL:** `http://localhost:8000/api/payroll/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
[
  {
    "id": 1,
    "teacher": {
      "id": 1,
      "user": {
        "first_name": "Muhammad",
        "last_name": "Abdullayev"
      }
    },
    "month": "November 2024",
    "salary": 2000.0,
    "bonus": 0.0,
    "deduction": 0.0,
    "net_salary": 2000.0,
    "is_paid": false,
    "paid_date": null
  }
]
\`\`\`

---

### 17.2 POST - Yangi oylik yaratish

**Method:** `POST`

**URL:** `http://localhost:8000/api/payroll/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "teacher": 1,
  "month": "December 2024",
  "salary": 2000.0,
  "bonus": 200.0,
  "deduction": 0.0,
  "net_salary": 2200.0,
  "is_paid": false
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 2,
  "teacher": {
    "id": 1,
    "user": {
      "first_name": "Muhammad",
      "last_name": "Abdullayev"
    }
  },
  "month": "December 2024",
  "salary": 2000.0,
  "bonus": 200.0,
  "deduction": 0.0,
  "net_salary": 2200.0,
  "is_paid": false,
  "paid_date": null
}
\`\`\`

---

### 17.3 GET - Bir oylikni ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/payroll/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "teacher": {
    "id": 1,
    "user": {
      "first_name": "Muhammad",
      "last_name": "Abdullayev"
    }
  },
  "month": "November 2024",
  "salary": 2000.0,
  "bonus": 0.0,
  "deduction": 0.0,
  "net_salary": 2000.0,
  "is_paid": false,
  "paid_date": null
}
\`\`\`

---

### 17.4 PUT - Oylikni to'liq yangilash

**Method:** `PUT`

**URL:** `http://localhost:8000/api/payroll/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "teacher": 1,
  "month": "November 2024",
  "salary": 2200.0,
  "bonus": 100.0,
  "deduction": 0.0,
  "net_salary": 2300.0,
  "is_paid": false
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "teacher": 1,
  "month": "November 2024",
  "salary": 2200.0,
  "bonus": 100.0,
  "deduction": 0.0,
  "net_salary": 2300.0,
  "is_paid": false
}
\`\`\`

---

### 17.5 PATCH - Oylikni qisman yangilash

**Method:** `PATCH`

**URL:** `http://localhost:8000/api/payroll/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "bonus": 150.0,
  "net_salary": 2150.0
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "bonus": 150.0,
  "net_salary": 2150.0,
  ...
}
\`\`\`

---

### 17.6 DELETE - Oylikni o'chirish

**Method:** `DELETE`

**URL:** `http://localhost:8000/api/payroll/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (204 No Content):**
\`\`\`
(Bo'sh)
\`\`\`

---

### 17.7 POST - Oylikni to'lanadi deb belgilash

**Method:** `POST`

**URL:** `http://localhost:8000/api/payroll/1/mark-paid/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "status": "Payroll marked as paid"
}
\`\`\`

---

## 18. NOTIFICATION API

### Base Endpoint: `/api/notifications/`

**Role:** All Users

**Description:** Barcha foydalanuvchilar uchun xabarnomalar

---

### 18.1 GET - Barcha xabarnomalarni ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/notifications/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
[
  {
    "id": 1,
    "user": 7,
    "title": "New Assignment",
    "message": "You have a new assignment to complete",
    "is_read": false,
    "created_at": "2024-11-29T10:00:00Z"
  }
]
\`\`\`

---

### 18.2 POST - Yangi xabarnoma yaratish

**Method:** `POST`

**URL:** `http://localhost:8000/api/notifications/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "user": 7,
  "title": "Class Reminder",
  "message": "Mathematics class starts in 30 minutes",
  "is_read": false
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 2,
  "user": 7,
  "title": "Class Reminder",
  "message": "Mathematics class starts in 30 minutes",
  "is_read": false,
  "created_at": "2024-11-29T10:00:00Z"
}
\`\`\`

---

### 18.3 GET - Bir xabarnomani ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/notifications/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "user": 7,
  "title": "New Assignment",
  "message": "You have a new assignment to complete",
  "is_read": false,
  "created_at": "2024-11-29T10:00:00Z"
}
\`\`\`

---

### 18.4 PUT - Xabarnomani to'liq yangilash

**Method:** `PUT`

**URL:** `http://localhost:8000/api/notifications/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "user": 7,
  "title": "Assignment Updated",
  "message": "The assignment has been updated",
  "is_read": false
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "user": 7,
  "title": "Assignment Updated",
  "message": "The assignment has been updated",
  "is_read": false
}
\`\`\`

---

### 18.5 PATCH - Xabarnomani qisman yangilash

**Method:** `PATCH`

**URL:** `http://localhost:8000/api/notifications/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "is_read": true
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "is_read": true,
  ...
}
\`\`\`

---

### 18.6 DELETE - Xabarnomani o'chirish

**Method:** `DELETE`

**URL:** `http://localhost:8000/api/notifications/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (204 No Content):**
\`\`\`
(Bo'sh)
\`\`\`

---

### 18.7 POST - Barcha xabarnomalarni o'qilganlik belgilash

**Method:** `POST`

**URL:** `http://localhost:8000/api/notifications/mark-all-read/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "status": "All notifications marked as read"
}
\`\`\`

---

## 19. CONTRACT API

### Base Endpoint: `/api/contracts/`

**Role:** Admin

**Description:** Talaba shartnomalarini boshqarish

---

### 19.1 GET - Barcha shartnomalarni ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/contracts/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
[
  {
    "id": 1,
    "student": {
      "id": 1,
      "user": {
        "first_name": "Ali",
        "last_name": "Karim"
      }
    },
    "contract_date": "2023-09-01",
    "duration_months": 12,
    "amount": 1200.0,
    "is_verified": true,
    "verified_by": 5,
    "file": "http://localhost:8000/media/contracts/contract_1.pdf"
  }
]
\`\`\`

---

### 19.2 POST - Yangi shartnoma yaratish

**Method:** `POST`

**URL:** `http://localhost:8000/api/contracts/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: multipart/form-data
\`\`\`

**Request Body (form-data):**
\`\`\`
student: 1
contract_date: 2024-11-29
duration_months: 6
amount: 600.0
is_verified: false
file: <binary file data>
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 2,
  "student": {
    "id": 1,
    "user": {
      "first_name": "Ali",
      "last_name": "Karim"
    }
  },
  "contract_date": "2024-11-29",
  "duration_months": 6,
  "amount": 600.0,
  "is_verified": false,
  "verified_by": null,
  "file": "http://localhost:8000/media/contracts/contract_2.pdf"
}
\`\`\`

---

### 19.3 GET - Bir shartnomani ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/contracts/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "student": {
    "id": 1,
    "user": {
      "first_name": "Ali",
      "last_name": "Karim"
    }
  },
  "contract_date": "2023-09-01",
  "duration_months": 12,
  "amount": 1200.0,
  "is_verified": true,
  "verified_by": 5,
  "file": "http://localhost:8000/media/contracts/contract_1.pdf"
}
\`\`\`

---

### 19.4 PUT - Shartnomani to'liq yangilash

**Method:** `PUT`

**URL:** `http://localhost:8000/api/contracts/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "student": 1,
  "contract_date": "2023-09-01",
  "duration_months": 12,
  "amount": 1300.0,
  "is_verified": true
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "student": 1,
  "contract_date": "2023-09-01",
  "duration_months": 12,
  "amount": 1300.0,
  "is_verified": true
}
\`\`\`

---

### 19.5 PATCH - Shartnomani qisman yangilash

**Method:** `PATCH`

**URL:** `http://localhost:8000/api/contracts/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "amount": 1400.0
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "amount": 1400.0,
  ...
}
\`\`\`

---

### 19.6 DELETE - Shartnomani o'chirish

**Method:** `DELETE`

**URL:** `http://localhost:8000/api/contracts/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (204 No Content):**
\`\`\`
(Bo'sh)
\`\`\`

---

### 19.7 POST - Shartnomani tasdiqlash

**Method:** `POST`

**URL:** `http://localhost:8000/api/contracts/1/verify/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "status": "Contract verified"
}
\`\`\`

---

## 20. LEAD API

### Base Endpoint: `/api/leads/`

**Role:** Manager

**Description:** Marketing leadlarni boshqarish - potensial talabalar

---

### 20.1 GET - Barcha leadlarni ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/leads/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
[
  {
    "id": 1,
    "name": "Hassan Ahmad",
    "phone": "+998901234567",
    "email": "hassan@example.com",
    "source": "Website",
    "status": "New",
    "branch": 1,
    "created_at": "2024-11-28T15:30:00Z"
  }
]
\`\`\`

---

### 20.2 POST - Yangi lead yaratish

**Method:** `POST`

**URL:** `http://localhost:8000/api/leads/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "name": "Zohra Ismoilova",
  "phone": "+998909876543",
  "email": "zohra@example.com",
  "source": "Facebook",
  "status": "New",
  "branch": 1
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 2,
  "name": "Zohra Ismoilova",
  "phone": "+998909876543",
  "email": "zohra@example.com",
  "source": "Facebook",
  "status": "New",
  "branch": 1,
  "created_at": "2024-11-29T10:00:00Z"
}
\`\`\`

---

### 20.3 GET - Bir leadni ko'rish

**Method:** `GET`

**URL:** `http://localhost:8000/api/leads/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "name": "Hassan Ahmad",
  "phone": "+998901234567",
  "email": "hassan@example.com",
  "source": "Website",
  "status": "New",
  "branch": 1
}
\`\`\`

---

### 20.4 PUT - Leadni to'liq yangilash

**Method:** `PUT`

**URL:** `http://localhost:8000/api/leads/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "name": "Hassan Ahmad",
  "phone": "+998901234567",
  "email": "hassan@example.com",
  "source": "Website",
  "status": "Contacted",
  "branch": 1
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "name": "Hassan Ahmad",
  "phone": "+998901234567",
  "email": "hassan@example.com",
  "source": "Website",
  "status": "Contacted",
  "branch": 1
}
\`\`\`

---

### 20.5 PATCH - Leadni qisman yangilash

**Method:** `PATCH`

**URL:** `http://localhost:8000/api/leads/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Request Body:**
\`\`\`json
{
  "status": "Converted"
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "id": 1,
  "status": "Converted",
  ...
}
\`\`\`

---

### 20.6 DELETE - Leadni o'chirish

**Method:** `DELETE`

**URL:** `http://localhost:8000/api/leads/1/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (204 No Content):**
\`\`\`
(Bo'sh)
\`\`\`

---

### 20.7 POST - Leadni talabaga aylantirish

**Method:** `POST`

**URL:** `http://localhost:8000/api/leads/1/convert-to-student/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "status": "Lead converted to student"
}
\`\`\`

---

### 20.8 GET - Lead konversiya statistikasi

**Method:** `GET`

**URL:** `http://localhost:8000/api/leads/statistics/`

**Headers:**
\`\`\`
Authorization: Bearer <your_token>
Content-Type: application/json
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "total_leads": 15,
  "converted_leads": 8,
  "conversion_rate": 53.33
}
\`\`\`

---

## QUICK REFERENCE TABLE

| Resource | GET | POST | PUT | PATCH | DELETE | Custom Actions |
|----------|-----|------|-----|-------|--------|---|
| Centers | `/api/centers/` | `/api/centers/` | `/api/centers/{id}/` | `/api/centers/{id}/` | `/api/centers/{id}/` | activate, deactivate |
| Directors | `/api/directors/` | `/api/directors/` | `/api/directors/{id}/` | `/api/directors/{id}/` | `/api/directors/{id}/` | - |
| Branches | `/api/branches/` | `/api/branches/` | `/api/branches/{id}/` | `/api/branches/{id}/` | `/api/branches/{id}/` | open, close |
| Subjects | `/api/subjects/` | `/api/subjects/` | `/api/subjects/{id}/` | `/api/subjects/{id}/` | `/api/subjects/{id}/` | - |
| Groups | `/api/groups/` | `/api/groups/` | `/api/groups/{id}/` | `/api/groups/{id}/` | `/api/groups/{id}/` | statistics, attendance-report |
| Students | `/api/students/` | `/api/students/` | `/api/students/{id}/` | `/api/students/{id}/` | `/api/students/{id}/` | block, assign-group, attendance-history, payment-history |
| Teachers | `/api/teachers/` | `/api/teachers/` | `/api/teachers/{id}/` | `/api/teachers/{id}/` | `/api/teachers/{id}/` | rate, schedule, performance |
| Lessons | `/api/lessons/` | `/api/lessons/` | `/api/lessons/{id}/` | `/api/lessons/{id}/` | `/api/lessons/{id}/` | cancel, generate-online-link |
| Attendance | `/api/attendance/` | `/api/attendance/` | `/api/attendance/{id}/` | `/api/attendance/{id}/` | `/api/attendance/{id}/` | bulk-mark |
| Payments | `/api/payments/` | `/api/payments/` | `/api/payments/{id}/` | `/api/payments/{id}/` | `/api/payments/{id}/` | debtors, statistics |
| Assignments | `/api/assignments/` | `/api/assignments/` | `/api/assignments/{id}/` | `/api/assignments/{id}/` | `/api/assignments/{id}/` | - |
| Submissions | `/api/submissions/` | `/api/submissions/` | `/api/submissions/{id}/` | `/api/submissions/{id}/` | `/api/submissions/{id}/` | - |
| Exams | `/api/exams/` | `/api/exams/` | `/api/exams/{id}/` | `/api/exams/{id}/` | `/api/exams/{id}/` | results |
| Exam Results | `/api/exam-results/` | `/api/exam-results/` | `/api/exam-results/{id}/` | `/api/exam-results/{id}/` | `/api/exam-results/{id}/` | - |
| Rooms | `/api/rooms/` | `/api/rooms/` | `/api/rooms/{id}/` | `/api/rooms/{id}/` | `/api/rooms/{id}/` | toggle-availability |
| Payroll | `/api/payroll/` | `/api/payroll/` | `/api/payroll/{id}/` | `/api/payroll/{id}/` | `/api/payroll/{id}/` | mark-paid |
| Notifications | `/api/notifications/` | `/api/notifications/` | `/api/notifications/{id}/` | `/api/notifications/{id}/` | `/api/notifications/{id}/` | mark-all-read |
| Contracts | `/api/contracts/` | `/api/contracts/` | `/api/contracts/{id}/` | `/api/contracts/{id}/` | `/api/contracts/{id}/` | verify |
| Leads | `/api/leads/` | `/api/leads/` | `/api/leads/{id}/` | `/api/leads/{id}/` | `/api/leads/{id}/` | convert-to-student, statistics |

---

## AUTHENTICATION HEADER

Barcha so'rovlar uchun (login bundan tashqari):

\`\`\`
Authorization: Bearer <your_jwt_token>
\`\`\`

Token `/api/auth/login/` endpointdan olinadi.

---

## ERROR RESPONSES

### 401 Unauthorized
\`\`\`json
{
  "detail": "Authentication credentials were not provided."
}
\`\`\`

### 403 Forbidden
\`\`\`json
{
  "detail": "You do not have permission to perform this action."
}
\`\`\`

### 404 Not Found
\`\`\`json
{
  "detail": "Not found."
}
\`\`\`

### 400 Bad Request
\`\`\`json
{
  "field_name": ["Error message"]
}
\`\`\`

---

**Hammasini birgalikda o'rganish uchun bu hujjat foydalaniladi!**
