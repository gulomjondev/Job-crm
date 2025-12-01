# Quick Start Guide - Educational Center CRM API

## Prerequisites
- Python 3.8+
- PostgreSQL 12+
- pip

## Installation Steps

### 1. Clone and Setup
\`\`\`bash
cd educational-crm
pip install -r requirements.txt
\`\`\`

### 2. Configure Database
Edit `.env` file with your PostgreSQL credentials:
\`\`\`
DB_NAME=crm_db
DB_USER=postgres
DB_PASSWORD=your_password
DB_HOST=localhost
DB_PORT=5432
\`\`\`

### 3. Initialize Database
\`\`\`bash
# Create migrations
python manage.py makemigrations

# Run migrations
python manage.py migrate

# Load initial data
python manage.py shell < scripts/setup_database.py
\`\`\`

### 4. Create Superuser (Optional)
\`\`\`bash
python manage.py createsuperuser
\`\`\`

### 5. Run Development Server
\`\`\`bash
python manage.py runserver
\`\`\`

## Access Points

### Swagger API Documentation
- URL: `http://localhost:8000/api/docs/`
- Fully interactive API explorer
- Test endpoints directly from the browser

### Django Admin
- URL: `http://localhost:8000/admin/`
- Username: admin / Password: (as set during setup)

### API Root
- URL: `http://localhost:8000/api/`
- Lists all available endpoints

## First Login

Use these test credentials after running setup script:

**Director Login:**
- Username: `director1`
- Password: `Director@123`

**Teacher Login:**
- Username: `teacher1`
- Password: `Teacher@123`

**Student Login:**
- Username: `student1`
- Password: `Student@123`

## API Usage Example

### 1. Get Authentication Token
\`\`\`bash
curl -X POST http://localhost:8000/api/login/ \
  -H "Content-Type: application/json" \
  -d '{
    "username": "director1",
    "password": "Director@123"
  }'
\`\`\`

Response:
\`\`\`json
{
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9...",
  "user_id": 1,
  "role": "Director",
  "center_id": 1
}
\`\`\`

### 2. Use Token to Access Protected Endpoints
\`\`\`bash
curl -X GET http://localhost:8000/api/students/ \
  -H "Authorization: Bearer YOUR_TOKEN"
\`\`\`

### 3. Create New Entity
\`\`\`bash
curl -X POST http://localhost:8000/api/branches/ \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "educational_center": 1,
    "name": "New Branch",
    "address": "123 New St",
    "phone": "+998900000000",
    "status": "Open"
  }'
\`\`\`

## Project Structure

\`\`\`
educational-crm/
├── crm_project/
│   ├── settings.py          # Django settings
│   ├── urls.py              # Main URL configuration
│   ├── wsgi.py              # WSGI configuration
│   └── __init__.py
├── crm_app/
│   ├── models.py            # Database models
│   ├── serializers.py       # DRF serializers
│   ├── views.py             # API viewsets
│   ├── urls.py              # App URL routing
│   ├── admin.py             # Django admin configuration
│   └── apps.py
├── scripts/
│   ├── setup_database.py    # Initial data setup
│   ├── test_api.py          # API testing
│   └── init_project.sh      # Setup script
├── manage.py                 # Django CLI
├── requirements.txt          # Python dependencies
├── .env.example             # Environment variables template
└── API_DOCUMENTATION.md     # Detailed API documentation
\`\`\`

## Available Endpoints Summary

### Authentication
- `POST /api/login/` - User login

### Educational Centers (SuperAdmin)
- `GET/POST /api/centers/` - List/Create centers
- `PUT/PATCH /api/centers/{id}/` - Update center
- `DELETE /api/centers/{id}/` - Delete center

### Directors (SuperAdmin)
- `GET/POST /api/directors/` - Manage directors

### Branches (Director/Manager)
- `GET/POST /api/branches/` - Manage branches
- `POST /api/branches/{id}/open/` - Open branch
- `POST /api/branches/{id}/close/` - Close branch

### Subjects (Director)
- `GET/POST /api/subjects/` - Manage subjects

### Groups (Director)
- `GET/POST /api/groups/` - Manage groups
- `GET /api/groups/{id}/statistics/` - Group stats
- `GET /api/groups/{id}/attendance-report/` - Attendance report

### Students
- `GET/POST /api/students/` - Manage students
- `POST /api/students/{id}/block/` - Block student
- `POST /api/students/{id}/assign-group/` - Assign to group
- `GET /api/students/{id}/attendance-history/` - Attendance history
- `GET /api/students/{id}/payment-history/` - Payment history

### Teachers
- `GET/POST /api/teachers/` - Manage teachers
- `POST /api/teachers/{id}/rate/` - Rate performance
- `GET /api/teachers/{id}/schedule/` - Get schedule
- `GET /api/teachers/{id}/performance/` - Performance metrics

### Lessons
- `GET/POST /api/lessons/` - Manage lessons
- `POST /api/lessons/{id}/cancel/` - Cancel lesson
- `POST /api/lessons/{id}/generate-online-link/` - Generate meeting link

### Attendance
- `GET/POST /api/attendance/` - Manage attendance
- `POST /api/attendance/bulk-mark/` - Bulk mark attendance

### Payments
- `GET/POST /api/payments/` - Manage payments
- `GET /api/payments/debtors/` - List debtors
- `GET /api/payments/statistics/` - Payment stats

### Assignments & Submissions
- `GET/POST /api/assignments/` - Manage assignments
- `GET/POST /api/submissions/` - Manage submissions

### Exams & Results
- `GET/POST /api/exams/` - Manage exams
- `GET /api/exams/{id}/results/` - Get results
- `GET/POST /api/exam-results/` - Manage results

### Rooms
- `GET/POST /api/rooms/` - Manage rooms
- `POST /api/rooms/{id}/toggle-availability/` - Toggle availability

### Payroll
- `GET/POST /api/payroll/` - Manage payroll
- `POST /api/payroll/{id}/mark-paid/` - Mark as paid

### Notifications
- `GET /api/notifications/` - Get notifications
- `POST /api/notifications/mark-all-read/` - Mark all read

### Contracts
- `GET/POST /api/contracts/` - Manage contracts
- `POST /api/contracts/{id}/verify/` - Verify contract

### Leads
- `GET/POST /api/leads/` - Manage leads
- `GET /api/leads/statistics/` - Lead statistics

## Environment Variables

Required environment variables in `.env`:

\`\`\`
DEBUG=True
SECRET_KEY=your-secret-key-here
DB_NAME=crm_db
DB_USER=postgres
DB_PASSWORD=your_password
DB_HOST=localhost
DB_PORT=5432
ALLOWED_HOSTS=localhost,127.0.0.1
\`\`\`

## Troubleshooting

### Database Connection Error
\`\`\`
Error: could not translate host name "localhost" to address
\`\`\`
Solution: Ensure PostgreSQL is running and credentials in .env are correct.

### Migration Error
\`\`\`bash
# Reset migrations (development only)
python manage.py migrate crm_app zero
rm crm_app/migrations/0*.py
python manage.py makemigrations
python manage.py migrate
\`\`\`

### Port Already in Use
\`\`\`bash
# Use different port
python manage.py runserver 8001
\`\`\`

## Production Deployment

### Using Gunicorn
\`\`\`bash
pip install gunicorn
gunicorn crm_project.wsgi --bind 0.0.0.0:8000 --workers 4
\`\`\`

### Using Docker
\`\`\`bash
docker build -t crm-api .
docker run -p 8000:8000 crm-api
\`\`\`

## Support & Documentation

For detailed API documentation, see `API_DOCUMENTATION.md`

Visit Swagger UI: `http://localhost:8000/api/docs/`

## License

This project is licensed under MIT License.
\`\`\`
