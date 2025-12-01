# API Setup Guide - Correct Order of Operations

## Problem Solved ✅
Before: Director qo'shishda center kerak, Center qo'shishda director kerak (Chicken & Egg)
After: Center director siz qo'shiladi, keyin director biriktiriladi

---

## Step 1: Center Qo'shish (Director siz)

**Endpoint:** `POST /api/centers/`

\`\`\`json
{
  "name": "Tashkent IT Academy",
  "address": "Tashkent, Uzbekistan",
  "phone": "+998901234567",
  "email": "info@academy.uz",
  "description": "IT va Programming o'quv markazi",
  "license_number": "LIC-2024-001",
  "website": "https://academy.uz",
  "status": "Active"
}
\`\`\`

**Response:**
\`\`\`json
{
  "id": 1,
  "name": "Tashkent IT Academy",
  "address": "Tashkent, Uzbekistan",
  "phone": "+998901234567",
  "email": "info@academy.uz",
  "director": null,
  "director_name": null,
  "status": "Active",
  "created_at": "2024-01-15T10:00:00Z",
  "updated_at": "2024-01-15T10:00:00Z"
}
\`\`\`

---

## Step 2: Direktor User Yaratish

**Endpoint:** `POST /api/directors/`

\`\`\`json
{
  "username": "director1",
  "password": "Director@123",
  "first_name": "Ali",
  "last_name": "Karimov",
  "email": "director@academy.uz",
  "phone": "+998901111111",
  "birthday": "1980-05-15",
  "educational_center": 1
}
\`\`\`

**Response:**
\`\`\`json
{
  "id": 1,
  "user": {
    "id": 1,
    "username": "director1",
    "email": "director@academy.uz",
    "first_name": "Ali",
    "last_name": "Karimov"
  },
  "role": "Director",
  "educational_center": 1,
  "phone": "+998901111111",
  "birthday": "1980-05-15",
  "is_blocked": false,
  "created_at": "2024-01-15T10:05:00Z"
}
\`\`\`

---

## Step 3: Center-ni Direktor bilan Yangilash

**Endpoint:** `PATCH /api/centers/1/`

\`\`\`json
{
  "director": 1
}
\`\`\`

**Response:**
\`\`\`json
{
  "id": 1,
  "name": "Tashkent IT Academy",
  "director": 1,
  "director_name": "Ali Karimov",
  "status": "Active",
  ...
}
\`\`\`

---

## Step 4: Direktor Login Qilish

**Endpoint:** `POST /api/login/`

\`\`\`json
{
  "username": "director1",
  "password": "Director@123"
}
\`\`\`

**Response:**
\`\`\`json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "user_id": 1,
  "username": "director1",
  "role": "Director",
  "center_id": 1
}
\`\`\`

---

## Step 5: O'qituvchi Qo'shish (Director tomonidan)

**Endpoint:** `POST /api/teachers/`

Direktor authorization header bilan:
\`\`\`
Authorization: Bearer <token>
\`\`\`

\`\`\`json
{
  "username": "teacher1",
  "password": "Teacher@123",
  "first_name": "Fatima",
  "last_name": "Sobirova",
  "email": "teacher@academy.uz",
  "phone": "+998902222222",
  "date_of_birth": "1985-03-20",
  "specialization": "Python Programming",
  "qualification": "Master in Computer Science",
  "hourly_rate": "50000",
  "branch": 1
}
\`\`\`

---

## Step 6: Student Qo'shish

**Endpoint:** `POST /api/students/`

\`\`\`json
{
  "username": "student1",
  "password": "Student@123",
  "first_name": "Jamshid",
  "last_name": "Abdullayev",
  "email": "student@academy.uz",
  "phone": "+998903333333",
  "date_of_birth": "2005-08-10",
  "parent_name": "Abdullayev Abdurrahman",
  "parent_phone": "+998903333334",
  "parent_email": "parent@email.uz",
  "address": "Tashkent, Mirabad tumani",
  "passport_number": "AA1234567",
  "group": 1,
  "branch": 1,
  "status": "Active"
}
\`\`\`

---

## Swagger-da Test Qilish

1. **Swagger UI oching:** `http://localhost:8000/api/docs/`
2. **AllowAny** permission bilan barcha API-lar test qilasiz
3. **Login token olish:**
   - `/api/login/` POST
   - Username va password kiriting
   - Token ko'chiring

4. **Token bilan authorized request:**
   - Swagger UI-da "Authorize" tugmasini bosing
   - Token kiriting: `Bearer <your_token>`
   - Hammasini teshirg'id ishlay boshladi!

---

## Key Points ✅

✅ Center qo'shiladi **avval**, director siz  
✅ Director yaratiladi **keyincha**  
✅ Director Center-ga biriktiriladi **oxirida**  
✅ Login token bilan barcha API ishlamasa ham test qila olasiz (AllowAny)  
✅ Production-ga qo'ygach permissions uncomment qilasiz  

---

## Database Migration

\`\`\`bash
# Models o'zgartirilganidan keyin
python manage.py makemigrations
python manage.py migrate

# Serverga qo'yish
python manage.py runserver
