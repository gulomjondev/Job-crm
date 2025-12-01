# 📚 Complete Testing & Login Workflow Guide

## Overview
This guide shows how to test all APIs with proper user login/password system and role-based dashboard access.

---

## 📋 Step-by-Step Setup

### Step 1: Create Test Data
Run the setup script to create all test users:

\`\`\`bash
python manage.py shell < scripts/test_create_users.py
\`\`\`

**What gets created:**
- ✅ Educational Center (Main Center)
- ✅ Branch (Main Branch)
- ✅ Subject (English Course)
- ✅ Group (Group A1)
- ✅ **Director User** with login/password
- ✅ **Teacher User** with complete information
- ✅ **Student User** with complete information

---

## 🔐 Login Credentials

### DIRECTOR
\`\`\`
Username: director1
Password: Director@123
Role: Director
API Endpoint: /api/auth/login/
\`\`\`

### TEACHER  
\`\`\`
Username: teacher1
Password: Teacher@123
Role: Teacher
API Endpoint: /api/auth/login/
\`\`\`

### STUDENT
\`\`\`
Username: student1
Password: Student@123
Role: Student
API Endpoint: /api/auth/login/
\`\`\`

---

## 🌐 API Testing Methods

### Method 1: Using Swagger UI (Recommended for Testing)
1. Start server: `python manage.py runserver`
2. Open: http://localhost:8000/api/docs/
3. Scroll to **"Login"** endpoint
4. Click "Try it out"
5. Enter username and password
6. Copy the returned **token**
7. Click "Authorize" button (top right)
8. Paste token in format: `Bearer YOUR_TOKEN_HERE`
9. Now test any endpoint!

### Method 2: Using cURL Commands

#### A. Get Login Token
\`\`\`bash
curl -X POST http://localhost:8000/api/auth/login/ \
  -H "Content-Type: application/json" \
  -d '{
    "username": "director1",
    "password": "Director@123"
  }'
\`\`\`

**Response:**
\`\`\`json
{
  "token": "abc123def456...",
  "user_id": 1,
  "role": "Director",
  "center_id": 1
}
\`\`\`

#### B. Use Token in Requests
\`\`\`bash
# Example: Get all students
curl -X GET http://localhost:8000/api/students/ \
  -H "Authorization: Bearer abc123def456..."

# Example: Get all teachers
curl -X GET http://localhost:8000/api/teachers/ \
  -H "Authorization: Bearer abc123def456..."

# Example: Create new subject
curl -X POST http://localhost:8000/api/subjects/ \
  -H "Authorization: Bearer abc123def456..." \
  -H "Content-Type: application/json" \
  -d '{
    "educational_center": 1,
    "name": "Mathematics",
    "description": "Math Course"
  }'
\`\`\`

### Method 3: Using Postman

1. Download [Postman](https://www.postman.com/downloads/)
2. Create new request with these steps:

**Step 1: Login Request**
- Method: POST
- URL: `http://localhost:8000/api/auth/login/`
- Body (JSON):
  \`\`\`json
  {
    "username": "director1",
    "password": "Director@123"
  }
  \`\`\`
- Click Send → Copy the token

**Step 2: Get Token for Future Requests**
- Go to "Authorization" tab
- Type: Bearer Token
- Paste your token

**Step 3: Test Any Endpoint**
- Change URL to any API endpoint
- Method to GET/POST/PUT/PATCH/DELETE
- Add Body if needed (JSON)
- Click Send!

---

## 📊 API Endpoints by Resource

### 🏢 Educational Center
| Operation | Endpoint | Method |
|-----------|----------|--------|
| List all | `/api/centers/` | GET |
| Create new | `/api/centers/` | POST |
| Get one | `/api/centers/{id}/` | GET |
| Update | `/api/centers/{id}/` | PUT/PATCH |
| Delete | `/api/centers/{id}/` | DELETE |

### 👥 Students
| Operation | Endpoint | Method |
|-----------|----------|--------|
| List all | `/api/students/` | GET |
| Create new | `/api/students/` | POST |
| Get one | `/api/students/{id}/` | GET |
| Update | `/api/students/{id}/` | PUT/PATCH |
| Delete | `/api/students/{id}/` | DELETE |

### 👨‍🏫 Teachers
| Operation | Endpoint | Method |
|-----------|----------|--------|
| List all | `/api/teachers/` | GET |
| Create new | `/api/teachers/` | POST |
| Get one | `/api/teachers/{id}/` | GET |
| Update | `/api/teachers/{id}/` | PUT/PATCH |
| Delete | `/api/teachers/{id}/` | DELETE |

### 📚 Groups
| Operation | Endpoint | Method |
|-----------|----------|--------|
| List all | `/api/groups/` | GET |
| Create new | `/api/groups/` | POST |
| Get one | `/api/groups/{id}/` | GET |
| Update | `/api/groups/{id}/` | PUT/PATCH |
| Delete | `/api/groups/{id}/` | DELETE |

### 📖 Subjects
| Operation | Endpoint | Method |
|-----------|----------|--------|
| List all | `/api/subjects/` | GET |
| Create new | `/api/subjects/` | POST |
| Get one | `/api/subjects/{id}/` | GET |
| Update | `/api/subjects/{id}/` | PUT/PATCH |
| Delete | `/api/subjects/{id}/` | DELETE |

---

## 🧪 Complete Testing Examples

### Example 1: Create a New Student

**Step 1: Get Token**
\`\`\`bash
curl -X POST http://localhost:8000/api/auth/login/ \
  -H "Content-Type: application/json" \
  -d '{
    "username": "director1",
    "password": "Director@123"
  }'
\`\`\`

**Step 2: Create Student**
\`\`\`bash
curl -X POST http://localhost:8000/api/students/ \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "user": {
      "first_name": "Ahmed",
      "last_name": "Shodmonov",
      "username": "ahmed_student",
      "password": "Ahmed@123",
      "email": "ahmed@test.com"
    },
    "group": 1,
    "branch": 1,
    "status": "Active",
    "phone": "+998912345678",
    "date_of_birth": "2005-06-15",
    "parent_name": "Jamshid Shodmonov",
    "parent_phone": "+998901111111",
    "parent_email": "parent@test.com",
    "address": "123 Student Street",
    "passport_number": "CC555666777"
  }'
\`\`\`

### Example 2: Create a New Teacher

\`\`\`bash
curl -X POST http://localhost:8000/api/teachers/ \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "user": {
      "first_name": "Fatima",
      "last_name": "Qodirova",
      "username": "fatima_teacher",
      "password": "Fatima@123",
      "email": "fatima@test.com"
    },
    "branch": 1,
    "status": "Active",
    "phone": "+998913333333",
    "date_of_birth": "1988-01-10",
    "specialization": "Mathematics",
    "qualification": "PhD in Mathematics",
    "hourly_rate": 75000,
    "address": "456 Teacher Avenue",
    "passport_number": "DD888999000"
  }'
\`\`\`

### Example 3: Get All Students for a Group

\`\`\`bash
# Get students with filter
curl -X GET "http://localhost:8000/api/students/?group=1" \
  -H "Authorization: Bearer YOUR_TOKEN"
\`\`\`

### Example 4: Update Student Information

\`\`\`bash
curl -X PATCH http://localhost:8000/api/students/1/ \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "status": "Inactive",
    "phone": "+998919999999"
  }'
\`\`\`

---

## 🎯 Role-Based Access

### Director Permissions
- ✅ See all center information
- ✅ Manage branches
- ✅ Create/manage teachers
- ✅ View all reports
- ✅ Manage payments

### Teacher Permissions
- ✅ See own groups
- ✅ Mark attendance
- ✅ Grade assignments
- ✅ View own students
- ✅ Submit grades

### Student Permissions
- ✅ View own profile
- ✅ See own group
- ✅ View assignments
- ✅ Submit homework

---

## ✅ Testing Checklist

- [ ] Run test creation script
- [ ] Login with Director credentials
- [ ] Login with Teacher credentials
- [ ] Login with Student credentials
- [ ] Create new student
- [ ] Create new teacher
- [ ] Update student information
- [ ] View all endpoints in Swagger
- [ ] Test GET/POST/PUT/PATCH/DELETE for each resource
- [ ] Verify permissions are working

---

## 🚨 Common Issues & Solutions

### Issue: "Invalid credentials" on login
**Solution:** Make sure username and password are exactly as shown above

### Issue: "Token not provided" error
**Solution:** Add `Authorization: Bearer YOUR_TOKEN` header to requests

### Issue: "Permission denied"
**Solution:** This is expected - permissions are commented for testing. Uncomment when deploying to production.

### Issue: Database errors
**Solution:** Run migrations first: `python manage.py migrate`

---

## 📱 Next Steps

1. ✅ Create test users (done)
2. ✅ Test login workflow
3. ✅ Test all CRUD operations
4. ✅ Verify permissions
5. ✅ Uncomment permissions for production
6. ✅ Deploy to server

---

**Ready to test? Start with the Swagger UI! 🚀**
