## API Documentation

We have created comprehensive API documentation to make it easy to understand and use all endpoints:

### Quick Start
1. **Start the server**: `python manage.py runserver`
2. **Access Swagger UI**: `http://localhost:8000/api/docs/`
3. **Login with test credentials**: See [Test Credentials](#test-credentials) below

### Documentation Files

- **`API_ENDPOINTS_DETAILED.md`** - Complete reference for all 19 resources with:
  - Detailed endpoint descriptions
  - Request/response examples
  - Authentication requirements
  - Permissions for each endpoint
  - HTTP status codes

- **`API_QUICK_REFERENCE.md`** - Quick lookup guide with:
  - Endpoint overview table (all 50+ endpoints at a glance)
  - Standard CRUD patterns
  - Test credentials
  - Common filters & pagination
  - Most used endpoints

- **`CURL_EXAMPLES.sh`** - Ready-to-use cURL commands for:
  - All API endpoints
  - Login examples
  - Batch operations (bulk attendance marking)
  - Custom actions (activate center, block student, etc.)

### Test Credentials

\`\`\`
Director:       director1 / Director@123
Manager:        manager1 / Manager@123
Admin:          admin1 / Admin@123
Teacher:        teacher1 / Teacher@123
Student:        student1 / Student@123
SuperAdmin:     superadmin / Admin@123
\`\`\`

### Quick Reference: Main Endpoints

#### Authentication
\`\`\`
POST /api/auth/login/ - Get JWT token
\`\`\`

#### Top 10 Most Used APIs
\`\`\`
1. GET /api/students/ - List all students
2. POST /api/attendance/bulk-mark/ - Mark attendance for entire class
3. POST /api/payments/ - Record student payment
4. GET /api/teachers/{id}/performance/ - View teacher performance metrics
5. GET /api/groups/{id}/statistics/ - Get group statistics & attendance
6. POST /api/lessons/ - Create lesson/class
7. GET /api/students/{id}/payment-history/ - View payment history
8. POST /api/students/ - Create new student
9. GET /api/notifications/ - Get user notifications
10. GET /api/leads/statistics/ - Get lead conversion stats
\`\`\`

## API Resource Overview

| Resource | Purpose | CRUD Methods | Custom Actions |
|----------|---------|------|-----------------|
| Centers | Manage educational centers | ✓ | activate, deactivate |
| Directors | Manage center directors | ✓ | - |
| Branches | Manage branch locations | ✓ | open, close |
| Subjects | Manage courses | ✓ | - |
| Groups | Manage student groups/classes | ✓ | statistics, attendance-report |
| Students | Manage students | ✓ | block, assign-group, attendance-history, payment-history |
| Teachers | Manage teachers | ✓ | rate, schedule, performance |
| Lessons | Manage lessons/classes | ✓ | cancel, generate-online-link |
| Attendance | Track attendance | ✓ | bulk-mark |
| Payments | Record payments | ✓ | debtors, statistics |
| Assignments | Create assignments | ✓ | - |
| Submissions | Track submissions | ✓ | - |
| Exams | Create exams | ✓ | results |
| Exam Results | Track exam results | ✓ | - |
| Rooms | Manage classrooms | ✓ | toggle-availability |
| Payroll | Manage teacher salary | ✓ | mark-paid |
| Notifications | User notifications | ✓ | mark-all-read |
| Contracts | Student contracts | ✓ | verify |
| Leads | Marketing leads | ✓ | convert-to-student, statistics |

## Implementation Guide

### Standard CRUD Operations

Every resource follows this pattern:

**List All**
\`\`\`
GET /api/{resource}/
Authorization: Bearer {token}
\`\`\`

**Create New**
\`\`\`
POST /api/{resource}/
Authorization: Bearer {token}
Content-Type: application/json

{...resource data...}
\`\`\`

**Get Specific**
\`\`\`
GET /api/{resource}/{id}/
Authorization: Bearer {token}
\`\`\`

**Update Full**
\`\`\`
PUT /api/{resource}/{id}/
Authorization: Bearer {token}
Content-Type: application/json

{...updated data...}
\`\`\`

**Update Partial**
\`\`\`
PATCH /api/{resource}/{id}/
Authorization: Bearer {token}
Content-Type: application/json

{...partial data...}
\`\`\`

**Delete**
\`\`\`
DELETE /api/{resource}/{id}/
Authorization: Bearer {token}
\`\`\`

### Authentication

1. **Login to get token**:
\`\`\`bash
curl -X POST http://localhost:8000/api/auth/login/ \
  -H "Content-Type: application/json" \
  -d '{"username": "director1", "password": "Director@123"}'
\`\`\`

2. **Response includes JWT token**:
\`\`\`json
{
  "token": "eyJ0eXAiOiJKV1QiLCJhbGc...",
  "refresh": "eyJ0eXAiOiJKV1QiLCJhbGc...",
  "user_id": 1,
  "username": "director1",
  "role": "Director",
  "center_id": 1
}
\`\`\`

3. **Use token in all subsequent requests**:
\`\`\`bash
curl -X GET http://localhost:8000/api/students/ \
  -H "Authorization: Bearer {token_from_login}"
\`\`\`

### Role-Based Access Control

- **SuperAdmin**: Full access to all resources
- **Director**: Manage their educational center and branches
- **Manager**: Manage branches and users within branch
- **Admin**: Administrative tasks (payments, contracts)
- **Teacher**: Manage lessons, attendance, assignments, exams
- **Student**: View own information, submit assignments, view grades

### Key Bulk Operations

**Mark Attendance for Entire Class**
\`\`\`
POST /api/attendance/bulk-mark/
{
  "lesson_id": 1,
  "attendance_data": [
    {"student_id": 1, "status": "Present", "notes": ""},
    {"student_id": 2, "status": "Absent", "notes": "Sick"}
  ]
}
\`\`\`

**Convert Lead to Student**
\`\`\`
POST /api/leads/{id}/convert-to-student/
\`\`\`

**Get Statistics**
\`\`\`
GET /api/groups/{id}/statistics/
GET /api/teachers/{id}/performance/
GET /api/payments/statistics/
GET /api/leads/statistics/
\`\`\`

## File Structure

\`\`\`
crm_project/
├── crm_app/
│   ├── models.py          # 19 database models
│   ├── serializers.py     # 19 serializers for data validation
│   ├── views.py           # 19 viewsets with 50+ endpoints
│   ├── urls.py            # URL routing
│   ├── admin.py           # Django admin configuration
│   ├── apps.py            # App configuration
│   └── __init__.py
├── crm_project/
│   ├── settings.py        # Django settings
│   ├── urls.py            # Main URL configuration
│   ├── wsgi.py
│   └── asgi.py
├── scripts/
│   ├── setup_database.py  # Initial data setup
│   └── test_api.py        # API testing script
├── manage.py              # Django management
├── requirements.txt       # Python dependencies
├── API_ENDPOINTS_DETAILED.md
├── API_QUICK_REFERENCE.md
├── CURL_EXAMPLES.sh
└── README.md
\`\`\`

## Response Examples

### Success Response (200 OK)
\`\`\`json
{
  "id": 1,
  "name": "Ahmed Begov",
  "email": "student@center.uz",
  "status": "Active",
  "created_at": "2024-01-15T10:00:00Z"
}
\`\`\`

### List Response (200 OK)
\`\`\`json
{
  "count": 25,
  "next": "http://localhost:8000/api/students/?page=2",
  "previous": null,
  "results": [
    {...},
    {...}
  ]
}
\`\`\`

### Error Response (400 Bad Request)
\`\`\`json
{
  "field_name": ["Error message for this field"]
}
\`\`\`

### Unauthorized (401)
\`\`\`json
{
  "error": "Invalid credentials"
}
\`\`\`

## Deployment

To deploy to production:

1. Set `DEBUG=False` in settings.py
2. Configure allowed hosts
3. Use environment variables for sensitive data
4. Use a production WSGI server (Gunicorn, uWSGI)
5. Set up PostgreSQL database
6. Run migrations: `python manage.py migrate`
7. Collect static files: `python manage.py collectstatic`

## Support

For API issues:
- Check swagger documentation: `/api/docs/`
- Review error messages in response
- Check permission level required
- Verify JWT token is valid
- Review detailed documentation files

\`\`\`

Finally, let me move to the next task:
