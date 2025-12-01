# How to Use the API Documentation Files

## Files Created

1. **API_ENDPOINTS_DETAILED.md** - Complete reference with all details
2. **API_QUICK_REFERENCE.md** - Quick lookup table
3. **CURL_EXAMPLES.sh** - Ready-to-use cURL commands
4. **UPDATE_SUMMARY.md** - Summary of documentation

## Quick Start

### Step 1: Login
\`\`\`bash
curl -X POST http://localhost:8000/api/auth/login/ \
  -H "Content-Type: application/json" \
  -d '{"username": "director1", "password": "Director@123"}'
\`\`\`

Copy the `token` from response.

### Step 2: Use the Token
\`\`\`bash
curl -X GET http://localhost:8000/api/students/ \
  -H "Authorization: Bearer YOUR_TOKEN_HERE"
\`\`\`

### Step 3: Browse Examples
- See **CURL_EXAMPLES.sh** for ready-to-use commands
- See **API_QUICK_REFERENCE.md** for endpoint table
- See **API_ENDPOINTS_DETAILED.md** for full details

## File Organization

### By Resource Type (All Standard CRUD)

\`\`\`
/api/centers/              → Educational centers
/api/directors/            → Directors
/api/branches/             → Branches
/api/subjects/             → Subjects/Courses
/api/groups/               → Groups/Classes
/api/students/             → Students
/api/teachers/             → Teachers
/api/lessons/              → Lessons
/api/attendance/           → Attendance
/api/payments/             → Payments
/api/assignments/          → Assignments
/api/submissions/          → Submissions
/api/exams/                → Exams
/api/exam-results/         → Exam Results
/api/rooms/                → Rooms
/api/payroll/              → Payroll
/api/notifications/        → Notifications
/api/contracts/            → Contracts
/api/leads/                → Leads
/api/auth/login/           → Authentication
\`\`\`

## Pattern Recognition

### All endpoints follow standard REST pattern:

| Operation | Method | URL | Example |
|-----------|--------|-----|---------|
| List All | GET | `/api/students/` | Get all students |
| Create | POST | `/api/students/` | Create new student |
| Get One | GET | `/api/students/{id}/` | Get student #1 |
| Update Full | PUT | `/api/students/{id}/` | Replace student |
| Update Partial | PATCH | `/api/students/{id}/` | Update one field |
| Delete | DELETE | `/api/students/{id}/` | Delete student |
| Custom Action | POST | `/api/students/{id}/block/` | Block student |

## Most Important Endpoints

**For Day-to-Day Use:**
1. `POST /api/auth/login/` - Get token
2. `POST /api/students/` - Add student
3. `POST /api/attendance/bulk-mark/` - Mark attendance
4. `POST /api/payments/` - Record payment
5. `GET /api/groups/{id}/statistics/` - View stats

**For Management:**
6. `GET /api/teachers/{id}/performance/` - Teacher performance
7. `GET /api/payments/debtors/` - Find late payers
8. `GET /api/leads/statistics/` - Lead conversion rate
9. `POST /api/lessons/` - Create lesson
10. `GET /api/notifications/` - Check messages

## Documentation Reading Order

1. **First time?** → Read **API_QUICK_REFERENCE.md** (5 min)
2. **Need details?** → Read **API_ENDPOINTS_DETAILED.md** (30 min)
3. **Want to test?** → Use **CURL_EXAMPLES.sh** (copy-paste)
4. **Need reference?** → Use **UPDATE_SUMMARY.md** (2 min)

## Testing Guide

### Option 1: Use cURL (Bash)
\`\`\`bash
# Copy from CURL_EXAMPLES.sh
bash CURL_EXAMPLES.sh > output.txt
\`\`\`

### Option 2: Use Swagger UI
\`\`\`
Go to: http://localhost:8000/api/docs/
Click on endpoint → Try it out → Execute
\`\`\`

### Option 3: Use Postman/Insomnia
\`\`\`
Import the cURL commands into Postman
Set Authorization header: Bearer {token}
\`\`\`

## Common Tasks

### Create a New Group
See: `API_ENDPOINTS_DETAILED.md` → Section 5.2

### Mark Attendance for Entire Class
See: `API_ENDPOINTS_DETAILED.md` → Section 9.7

### Get Student Payment History
See: `API_ENDPOINTS_DETAILED.md` → Section 6.10

### View Teacher Performance
See: `API_ENDPOINTS_DETAILED.md` → Section 7.9

### Get Lead Statistics
See: `API_ENDPOINTS_DETAILED.md` → Section 19.8

## Authentication Reference

All endpoints (except login) require:
\`\`\`
Header: Authorization: Bearer {jwt_token}
\`\`\`

Get token from:
\`\`\`
POST /api/auth/login/
\`\`\`

Token lasts 24 hours (refresh token also provided).

## Response Status Codes

| Code | Meaning |
|------|---------|
| 200 | Success |
| 201 | Created |
| 204 | Deleted |
| 400 | Bad request |
| 401 | Unauthorized |
| 403 | Forbidden |
| 404 | Not found |

## Troubleshooting

**"Invalid credentials"** → Check username/password in test credentials

**"Not found"** → Check resource ID exists

**"Not authenticated"** → Add Authorization header with valid token

**"Permission denied"** → Check if role has access to endpoint

**"Field required"** → Check all required fields in request

---

**Next:** Pick a file and start exploring!
