# 🎯 Role-Based Dashboard Redirection Guide

## How Login & Dashboard Redirect Works

When a user logs in with their username and password, the system automatically redirects them to their appropriate dashboard based on their role.

---

## 📝 Login Flow Diagram

\`\`\`
User Login
    ↓
username + password
    ↓
/api/auth/login/ API
    ↓
User Found? → Check Role
    ↓
    ├─ DIRECTOR → /dashboard/director/
    ├─ MANAGER → /dashboard/manager/
    ├─ ADMIN → /dashboard/admin/
    ├─ TEACHER → /dashboard/teacher/
    └─ STUDENT → /dashboard/student/
\`\`\`

---

## 🔑 Login Response Structure

When user logs in successfully:

\`\`\`json
{
  "token": "eyJ0eXAiOiJKV1QiLCJhbGc...",
  "user_id": 1,
  "username": "director1",
  "first_name": "John",
  "last_name": "Director",
  "role": "Director",
  "center_id": 1,
  "branch_id": null
}
\`\`\`

**Frontend should use `role` field to redirect:**

\`\`\`javascript
// After successful login
const response = await fetch('/api/auth/login/', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({
    username: 'director1',
    password: 'Director@123'
  })
});

const data = await response.json();

// Store token
localStorage.setItem('token', data.token);
localStorage.setItem('role', data.role);

// Redirect based on role
switch(data.role) {
  case 'Director':
    window.location.href = '/dashboard/director/';
    break;
  case 'Manager':
    window.location.href = '/dashboard/manager/';
    break;
  case 'Admin':
    window.location.href = '/dashboard/admin/';
    break;
  case 'Teacher':
    window.location.href = '/dashboard/teacher/';
    break;
  case 'Student':
    window.location.href = '/dashboard/student/';
    break;
}
\`\`\`

---

## 🏠 Dashboard Endpoints

Each role has its own dashboard:

### 1. Director Dashboard
**Endpoint:** `/api/dashboard/director/`

**Shows:**
- Center overview
- All branches
- All students
- All teachers
- Financial reports
- Performance metrics

**Sample Response:**
\`\`\`json
{
  "center": {
    "id": 1,
    "name": "Test Center",
    "branches": 5,
    "teachers": 25,
    "students": 150
  },
  "statistics": {
    "total_revenue": 450000,
    "active_groups": 12,
    "attendance_rate": 0.92
  }
}
\`\`\`

### 2. Manager Dashboard
**Endpoint:** `/api/dashboard/manager/`

**Shows:**
- Assigned branch info
- Teachers in branch
- Students in branch
- Attendance statistics
- Payment records

### 3. Admin Dashboard
**Endpoint:** `/api/dashboard/admin/`

**Shows:**
- Student list
- Attendance records
- Payment status
- Notifications
- Reports

### 4. Teacher Dashboard
**Endpoint:** `/api/dashboard/teacher/`

**Shows:**
- Own groups
- Lessons schedule
- Students in groups
- Assignment submissions
- Grades

### 5. Student Dashboard
**Endpoint:** `/api/dashboard/student/`

**Shows:**
- Own group info
- Lessons schedule
- Attendance record
- Assignments
- Grades received

---

## 🛡️ Protecting Routes with Authentication

### Backend (Django)

All routes are currently set to `AllowAny` for testing. When deploying to production, uncomment the permission classes in `views.py`:

\`\`\`python
from rest_framework.permissions import IsAuthenticated

class DirectorViewSet(viewsets.ModelViewSet):
    # FOR TESTING (current):
    permission_classes = [permissions.AllowAny]
    
    # FOR PRODUCTION (uncomment):
    # permission_classes = [IsAuthenticated]
    
    queryset = UserProfile.objects.filter(role='Director')
    serializer_class = DirectorSerializer
\`\`\`

### Frontend (React/Vue/etc.)

Protect routes by checking token and role:

\`\`\`javascript
// Auth Guard Component
function ProtectedRoute({ role, children }) {
  const token = localStorage.getItem('token');
  const userRole = localStorage.getItem('role');
  
  if (!token) {
    // Redirect to login
    return <Navigate to="/login" />;
  }
  
  if (role && userRole !== role) {
    // Redirect to appropriate dashboard
    return <Navigate to={`/dashboard/${userRole.toLowerCase()}`} />;
  }
  
  return children;
}

// Usage
<Routes>
  <Route 
    path="/dashboard/director" 
    element={
      <ProtectedRoute role="Director">
        <DirectorDashboard />
      </ProtectedRoute>
    }
  />
</Routes>
\`\`\`

---

## 🔄 Session Management

### Storing Credentials

\`\`\`javascript
// After successful login
const credentials = {
  token: response.token,
  user_id: response.user_id,
  username: response.username,
  role: response.role,
  first_name: response.first_name,
  last_name: response.last_name,
  center_id: response.center_id
};

// Store securely
localStorage.setItem('auth', JSON.stringify(credentials));
localStorage.setItem('token', credentials.token);
\`\`\`

### Checking if User is Logged In

\`\`\`javascript
function isLoggedIn() {
  const token = localStorage.getItem('token');
  return !!token;
}

function getUserRole() {
  const auth = JSON.parse(localStorage.getItem('auth'));
  return auth?.role;
}
\`\`\`

### Logout

\`\`\`javascript
function logout() {
  localStorage.removeItem('token');
  localStorage.removeItem('auth');
  window.location.href = '/login';
}
\`\`\`

---

## 📊 Sample Login Tests

### Test 1: Director Login & Get Token

\`\`\`bash
#!/bin/bash

# Save token to variable
TOKEN=$(curl -s -X POST http://localhost:8000/api/auth/login/ \
  -H "Content-Type: application/json" \
  -d '{
    "username": "director1",
    "password": "Director@123"
  }' | jq -r '.token')

echo "Token: $TOKEN"

# Now use token in requests
curl -X GET http://localhost:8000/api/dashboard/director/ \
  -H "Authorization: Bearer $TOKEN"
\`\`\`

### Test 2: Teacher Login & Get Their Groups

\`\`\`bash
TOKEN=$(curl -s -X POST http://localhost:8000/api/auth/login/ \
  -H "Content-Type: application/json" \
  -d '{
    "username": "teacher1",
    "password": "Teacher@123"
  }' | jq -r '.token')

# Get teacher's own groups
curl -X GET http://localhost:8000/api/groups/?teacher__user__username=teacher1 \
  -H "Authorization: Bearer $TOKEN"
\`\`\`

### Test 3: Student Login & View Assigned Group

\`\`\`bash
TOKEN=$(curl -s -X POST http://localhost:8000/api/auth/login/ \
  -H "Content-Type: application/json" \
  -d '{
    "username": "student1",
    "password": "Student@123"
  }' | jq -r '.token')

# Get student's group info
curl -X GET http://localhost:8000/api/dashboard/student/ \
  -H "Authorization: Bearer $TOKEN"
\`\`\`

---

## 🎓 Production Deployment Checklist

- [ ] **Test all user logins work**
  \`\`\`bash
  python manage.py shell < scripts/test_create_users.py
  \`\`\`

- [ ] **Uncomment permissions in views.py**
  Replace: `permission_classes = [permissions.AllowAny]`
  With: `permission_classes = [permissions.IsAuthenticated]`

- [ ] **Setup email verification** (optional)
  - Add email confirmation on signup
  - Reset password via email

- [ ] **Enable HTTPS**
  - Use SSL certificate
  - Set `SECURE_SSL_REDIRECT = True` in settings.py

- [ ] **Configure CORS properly**
  \`\`\`python
  CORS_ALLOWED_ORIGINS = [
      "https://yourdomain.com",
      "https://www.yourdomain.com",
  ]
  \`\`\`

- [ ] **Add rate limiting**
  - Prevent brute force attacks
  - Use packages like `djangorestframework-ratelimit`

- [ ] **Setup logging & monitoring**
  - Log all login attempts
  - Monitor suspicious activities

---

## 🚀 Ready to Deploy?

1. ✅ Create test users
2. ✅ Test login workflow
3. ✅ Verify role-based redirection
4. ✅ Uncomment permissions
5. ✅ Setup production database (PostgreSQL)
6. ✅ Configure environment variables
7. ✅ Deploy to server

---

**Your CRM API is ready for role-based access control!** 🎯
