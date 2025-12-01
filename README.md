# Educational Center CRM API - Complete Documentation

A comprehensive Django REST Framework API for managing educational centers with multi-role support (SuperAdmin, Director, Manager, Admin, Teacher, Student).

## Overview

This is a production-ready backend API that manages all aspects of an educational institution:
- Multi-branch educational centers
- Student enrollment and management
- Teacher assignment and performance tracking
- Attendance and grade management
- Payment processing and invoicing
- Exam scheduling and results tracking
- Payroll management
- Marketing lead tracking
- Role-based access control with JWT authentication

## Tech Stack

- **Framework**: Django 4.2
- **API**: Django REST Framework 3.14
- **Database**: PostgreSQL 12+
- **Authentication**: JWT (Simple JWT)
- **Documentation**: Swagger/OpenAPI (drf-spectacular)
- **Async**: Daphne (optional)

## Features

### Core Features
✓ JWT-based authentication and authorization
✓ Multi-role access control (6 roles)
✓ Full CRUD operations for all entities
✓ Comprehensive Swagger documentation
✓ Advanced filtering and pagination
✓ Bulk operations support
✓ File upload handling
✓ Statistics and reporting
✓ CORS support for frontend integration

### Role-Based Access

**SuperAdmin**
- Create educational centers
- Create and manage directors
- View all system data
- System statistics

**Director**
- Manage branches within center
- Create subjects and groups
- Assign managers and teachers
- Monitor all operations
- Generate reports

**Manager**
- Manage teachers and admins
- Student enrollment
- Payment tracking
- Attendance monitoring
- Lead management

**Admin**
- Accept student payments
- Mark attendance
- Manage documents
- Student verification

**Teacher**
- View assigned groups
- Mark attendance
- Upload homework and grades
- Generate online lesson links
- Track student progress

**Student**
- View their group and schedule
- Track attendance
- Submit assignments
- View grades
- Check payment status

## Database Models

### Core Models
- **EducationalCenter** - Main organization entity
- **UserProfile** - Extended user information with roles
- **Branch** - Educational center branches
- **Subject** - Courses/Subjects offered

### Academic Models
- **Group** - Study groups/classes
- **Lesson** - Individual lessons/classes
- **Attendance** - Attendance tracking
- **Student** - Student records
- **Teacher** - Teacher records
- **Room** - Classroom management

### Academic Assessment
- **Assignment** - Homework/assignments
- **AssignmentSubmission** - Student submissions
- **Exam** - Exam/test records
- **ExamResult** - Exam grades and scores

### Financial Models
- **Payment** - Student payment records
- **Payroll** - Teacher salary management

### Additional Models
- **Notification** - System notifications
- **Contract** - Student contracts
- **Lead** - Marketing leads
- **Comment** - User comments/notes

## API Endpoints Structure

\`\`\`
/api/
├── login/                          # POST - User login
├── centers/                        # GET, POST, PUT, DELETE
├── directors/                      # GET, POST, PUT, DELETE
├── branches/                       # GET, POST, PUT, DELETE
├── subjects/                       # GET, POST, PUT, DELETE
├── groups/                         # GET, POST, PUT, DELETE
├── students/                       # GET, POST, PUT, DELETE
├── teachers/                       # GET, POST, PUT, DELETE
├── lessons/                        # GET, POST, PUT, DELETE
├── attendance/                     # GET, POST, PUT, DELETE
├── payments/                       # GET, POST, PUT, DELETE
├── assignments/                    # GET, POST, PUT, DELETE
├── submissions/                    # GET, POST, PUT, DELETE
├── exams/                          # GET, POST, PUT, DELETE
├── exam-results/                   # GET, POST, PUT, DELETE
├── rooms/                          # GET, POST, PUT, DELETE
├── payroll/                        # GET, POST, PUT, DELETE
├── notifications/                  # GET, POST, PUT, DELETE
├── contracts/                      # GET, POST, PUT, DELETE
└── leads/                          # GET, POST, PUT, DELETE
\`\`\`

## Installation & Setup

### Prerequisites
\`\`\`bash
- Python 3.8+
- PostgreSQL 12+
- pip (Python package manager)
\`\`\`

### Step 1: Install Dependencies
\`\`\`bash
pip install -r requirements.txt
\`\`\`

### Step 2: Configure Environment
\`\`\`bash
# Copy example environment file
cp .env.example .env

# Edit .env with your settings
# Database credentials
DB_NAME=crm_db
DB_USER=postgres
DB_PASSWORD=your_password
DB_HOST=localhost
DB_PORT=5432
\`\`\`

### Step 3: Run Migrations
\`\`\`bash
# Create migrations
python manage.py makemigrations

# Apply migrations
python manage.py migrate
\`\`\`

### Step 4: Load Initial Data (Optional)
\`\`\`bash
# Load sample data for testing
python manage.py shell < scripts/setup_database.py
\`\`\`

### Step 5: Create Superuser
\`\`\`bash
python manage.py createsuperuser
\`\`\`

### Step 6: Start Development Server
\`\`\`bash
python manage.py runserver
\`\`\`

## Accessing the API

### Swagger Documentation (Interactive)
\`\`\`
http://localhost:8000/api/docs/
\`\`\`
- Visual API explorer
- Try endpoints directly
- See request/response examples
- Authentication support

### Django Admin
\`\`\`
http://localhost:8000/admin/
\`\`\`
- Manage all data
- User administration
- Permissions management

### API Root
\`\`\`
http://localhost:8000/api/
\`\`\`
- Lists all endpoints
- RESTful browsable interface

## Authentication

### Login to Get Token

**Request:**
\`\`\`bash
curl -X POST http://localhost:8000/api/login/ \
  -H "Content-Type: application/json" \
  -d '{
    "username": "director1",
    "password": "Director@123"
  }'
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

### Using Token in Requests

\`\`\`bash
curl -X GET http://localhost:8000/api/students/ \
  -H "Authorization: Bearer YOUR_TOKEN_HERE"
\`\`\`

### Token Expiration
- Access Token: 24 hours
- Refresh Token: 7 days

### Refresh Token
\`\`\`bash
curl -X POST http://localhost:8000/api/token/refresh/ \
  -H "Content-Type: application/json" \
  -d '{"refresh": "YOUR_REFRESH_TOKEN"}'
\`\`\`

## API Usage Examples

### 1. Create Educational Center

**Request:**
\`\`\`bash
curl -X POST http://localhost:8000/api/centers/ \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "International Language Academy",
    "address": "123 Main Street, Tashkent",
    "phone": "+998900000000",
    "email": "info@academy.uz",
    "license_number": "LIC2024001",
    "status": "Active"
  }'
\`\`\`

### 2. Create Director

**Request:**
\`\`\`bash
curl -X POST http://localhost:8000/api/directors/ \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "username": "director1",
    "password": "SecurePassword123",
    "first_name": "John",
    "last_name": "Doe",
    "email": "director@academy.uz",
    "role": "Director",
    "educational_center": 1
  }'
\`\`\`

### 3. Add Branch

**Request:**
\`\`\`bash
curl -X POST http://localhost:8000/api/branches/ \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "educational_center": 1,
    "name": "Downtown Branch",
    "address": "456 Park Avenue",
    "phone": "+998900111111",
    "status": "Open"
  }'
\`\`\`

### 4. Create Subject

**Request:**
\`\`\`bash
curl -X POST http://localhost:8000/api/subjects/ \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "educational_center": 1,
    "name": "English Language",
    "description": "Comprehensive English course"
  }'
\`\`\`

### 5. Create Group

**Request:**
\`\`\`bash
curl -X POST http://localhost:8000/api/groups/ \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "educational_center": 1,
    "branch": 1,
    "name": "English Beginners A1",
    "subject": 1,
    "teacher": 1,
    "capacity": 30,
    "status": "Active",
    "start_date": "2024-01-01",
    "end_date": "2024-03-31"
  }'
\`\`\`

### 6. Enroll Student

**Request:**
\`\`\`bash
curl -X POST http://localhost:8000/api/students/ \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "user": {
      "username": "student1",
      "password": "StudentPass123",
      "first_name": "Ahmed",
      "last_name": "Hassan"
    },
    "branch": 1,
    "group": 1,
    "status": "Active",
    "parent_name": "Parent Name",
    "parent_phone": "+998900222222"
  }'
\`\`\`

### 7. Record Payment

**Request:**
\`\`\`bash
curl -X POST http://localhost:8000/api/payments/ \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "student": 1,
    "group": 1,
    "amount": 500.00,
    "payment_type": "Cash",
    "due_date": "2024-12-31",
    "receipt_number": "REC20241201001"
  }'
\`\`\`

### 8. Mark Attendance

**Request:**
\`\`\`bash
curl -X POST http://localhost:8000/api/attendance/bulk-mark/ \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
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
      }
    ]
  }'
\`\`\`

## Test Credentials

After running setup script:

| Role | Username | Password |
|------|----------|----------|
| SuperAdmin | superadmin | SuperAdmin@123 |
| Director | director1 | Director@123 |
| Manager | manager1 | Manager@123 |
| Admin | admin1 | Admin@123 |
| Teacher | teacher1 | Teacher@123 |
| Student | student1 | Student@123 |

## File Structure

\`\`\`
educational-crm/
├── crm_project/              # Django project configuration
│   ├── settings.py           # Main settings
│   ├── urls.py               # URL routing
│   ├── wsgi.py               # WSGI configuration
│   └── __init__.py
├── crm_app/                  # Main application
│   ├── models.py             # Database models (19 models)
│   ├── serializers.py        # DRF serializers (19 serializers)
│   ├── views.py              # ViewSets and endpoints (19 viewsets)
│   ├── urls.py               # App URL configuration
│   ├── admin.py              # Django admin
│   ├── apps.py               # App configuration
│   ├── migrations/           # Database migrations
│   └── __init__.py
├── scripts/                  # Setup and testing scripts
│   ├── setup_database.py     # Initial data setup
│   ├── test_api.py           # API testing script
│   └── init_project.sh       # Project initialization
├── templates/                # HTML templates (if needed)
├── static/                   # Static files
├── media/                    # User uploads
├── manage.py                 # Django management
├── requirements.txt          # Python dependencies
├── .env.example              # Environment variables template
├── .gitignore               # Git ignore rules
├── README.md                # This file
├── API_DOCUMENTATION.md     # Detailed API docs
└── QUICK_START.md           # Quick start guide
\`\`\`

## Key Functionality by Dashboard

### SuperAdmin Dashboard
- Create and manage educational centers
- Create director accounts
- System-wide statistics
- User management
- License verification

### Director Dashboard
- Manage branches (open/close)
- Create and manage subjects
- Create study groups
- Assign managers, teachers, admins
- Monitor attendance and payments
- View performance metrics
- Generate reports

### Manager Dashboard
- Recruit teachers and admins
- Manage leads and conversions
- Monitor group schedules
- Track teacher attendance
- Manage payments and debtors
- Payroll calculations
- Lead conversion tracking

### Admin Dashboard
- Enroll students
- Accept payments
- Issue receipts
- Verify documents
- Mark attendance
- Manage student information

### Teacher Dashboard
- View assigned groups
- Mark student attendance
- Upload homework assignments
- Grade submissions
- Generate online meeting links
- Track student progress

### Student Dashboard
- View enrolled groups
- Check attendance record
- Submit assignments
- View grades
- Check payment status
- Track progress

## API Response Format

### Success Response (200)
\`\`\`json
{
  "id": 1,
  "name": "John Doe",
  "email": "john@example.com",
  "created_at": "2024-11-29T10:00:00Z"
}
\`\`\`

### List Response with Pagination
\`\`\`json
{
  "count": 100,
  "next": "http://localhost:8000/api/students/?page=2",
  "previous": null,
  "results": [
    { /* object */ },
    { /* object */ }
  ]
}
\`\`\`

### Error Response (400)
\`\`\`json
{
  "error": "Invalid input data",
  "details": {
    "field_name": ["Error message"]
  }
}
\`\`\`

## Error Codes

| Code | Meaning |
|------|---------|
| 200 | OK - Request successful |
| 201 | Created - Resource created |
| 400 | Bad Request - Invalid data |
| 401 | Unauthorized - Missing/invalid token |
| 403 | Forbidden - Permission denied |
| 404 | Not Found - Resource not found |
| 500 | Server Error - Internal error |

## Deployment

### Production Checklist
- [ ] Change DEBUG=False in settings
- [ ] Set strong SECRET_KEY
- [ ] Configure ALLOWED_HOSTS
- [ ] Use environment variables for secrets
- [ ] Set up database backups
- [ ] Configure email for notifications
- [ ] Set up logging
- [ ] Use HTTPS
- [ ] Configure CORS properly

### Using Gunicorn
\`\`\`bash
pip install gunicorn
gunicorn crm_project.wsgi --bind 0.0.0.0:8000 --workers 4
\`\`\`

### Using Docker
\`\`\`bash
docker build -t crm-api .
docker run -p 8000:8000 --env-file .env crm-api
\`\`\`

### Using AWS/Heroku/DigitalOcean
Follow respective platform documentation with provided WSGI application.

## Performance Optimization

- Database indexing on frequently queried fields
- Pagination for large datasets
- Caching with Redis (optional)
- CDN for static files
- Database query optimization with select_related()
- Async tasks with Celery (optional)

## Security Features

- JWT authentication with expiration
- Password hashing with Django built-in
- CSRF protection
- SQL injection prevention
- CORS configuration
- Rate limiting (can be added)
- Input validation
- Row-level security ready

## Logging & Monitoring

All API requests are logged automatically. Configure logging in settings.py for production.

## Troubleshooting

### Database Connection Error
\`\`\`
Check PostgreSQL is running and .env credentials are correct
\`\`\`

### Migration Error
\`\`\`bash
# Reset migrations
python manage.py migrate crm_app zero
# Recreate
python manage.py makemigrations
python manage.py migrate
\`\`\`

### Port Already in Use
\`\`\`bash
# Use different port
python manage.py runserver 8001
\`\`\`

### Token Expired
\`\`\`bash
# Use refresh token to get new access token
curl -X POST http://localhost:8000/api/token/refresh/ \
  -H "Content-Type: application/json" \
  -d '{"refresh": "YOUR_REFRESH_TOKEN"}'
\`\`\`

## API Statistics

- **Total Endpoints**: 50+
- **Total Models**: 19
- **Total Serializers**: 19
- **Total ViewSets**: 19
- **Authentication Methods**: JWT + Session
- **Supported Roles**: 6
- **Custom Actions**: 30+

## Future Enhancements

- SMS/Email notifications
- Mobile app API support
- Advanced reporting and analytics
- Video recording integration
- Virtual classroom support
- Student portal
- Parent portal
- Advanced analytics dashboard
- Machine learning for student predictions

## Contributing

Contributions are welcome! Please follow:
1. Create feature branch
2. Add tests for new features
3. Update documentation
4. Submit pull request

## License

MIT License - See LICENSE file for details

## Support

- Email: support@crm.uz
- Documentation: See API_DOCUMENTATION.md
- Swagger Docs: http://localhost:8000/api/docs/

## Author

Created as a comprehensive educational management system using Django REST Framework.

## Changelog

### v1.0.0 (2024-11-29)
- Initial release
- 19 models implemented
- Full CRUD operations
- JWT authentication
- Role-based access control
- Swagger documentation
- Bulk operations support
