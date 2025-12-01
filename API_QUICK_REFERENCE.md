# API Quick Reference

## Endpoint Overview Table

| Resource | Create | Read | Update | Delete | Custom Actions |
|----------|--------|------|--------|--------|-----------------|
| Centers | POST `/api/centers/` | GET `/api/centers/{id}/` | PUT/PATCH | DELETE | activate, deactivate |
| Directors | POST `/api/directors/` | GET `/api/directors/{id}/` | PUT/PATCH | DELETE | - |
| Branches | POST `/api/branches/` | GET `/api/branches/{id}/` | PUT/PATCH | DELETE | open, close |
| Subjects | POST `/api/subjects/` | GET `/api/subjects/{id}/` | PUT/PATCH | DELETE | - |
| Groups | POST `/api/groups/` | GET `/api/groups/{id}/` | PUT/PATCH | DELETE | statistics, attendance-report |
| Students | POST `/api/students/` | GET `/api/students/{id}/` | PUT/PATCH | DELETE | block, assign-group, attendance-history, payment-history |
| Teachers | POST `/api/teachers/` | GET `/api/teachers/{id}/` | PUT/PATCH | DELETE | rate, schedule, performance |
| Lessons | POST `/api/lessons/` | GET `/api/lessons/{id}/` | PUT/PATCH | DELETE | cancel, generate-online-link |
| Attendance | POST `/api/attendance/` | GET `/api/attendance/{id}/` | PUT/PATCH | DELETE | bulk-mark |
| Payments | POST `/api/payments/` | GET `/api/payments/{id}/` | PUT/PATCH | DELETE | debtors, statistics |
| Assignments | POST `/api/assignments/` | GET `/api/assignments/{id}/` | PUT/PATCH | DELETE | - |
| Submissions | POST `/api/submissions/` | GET `/api/submissions/{id}/` | PUT/PATCH | DELETE | - |
| Exams | POST `/api/exams/` | GET `/api/exams/{id}/` | PUT/PATCH | DELETE | results |
| Exam Results | POST `/api/exam-results/` | GET `/api/exam-results/{id}/` | PUT/PATCH | DELETE | - |
| Rooms | POST `/api/rooms/` | GET `/api/rooms/{id}/` | PUT/PATCH | DELETE | toggle-availability |
| Payroll | POST `/api/payroll/` | GET `/api/payroll/{id}/` | PUT/PATCH | DELETE | mark-paid |
| Notifications | POST `/api/notifications/` | GET `/api/notifications/{id}/` | PUT/PATCH | DELETE | mark-all-read |
| Contracts | POST `/api/contracts/` | GET `/api/contracts/{id}/` | PUT/PATCH | DELETE | verify |
| Leads | POST `/api/leads/` | GET `/api/leads/{id}/` | PUT/PATCH | DELETE | convert-to-student, statistics |

## Standard CRUD Pattern

Every resource follows this pattern:

\`\`\`
List All:    GET /api/{resource}/
Create:      POST /api/{resource}/
Get One:     GET /api/{resource}/{id}/
Update Full: PUT /api/{resource}/{id}/
Update Part: PATCH /api/{resource}/{id}/
Delete:      DELETE /api/{resource}/{id}/
\`\`\`

## Test Credentials

\`\`\`
Superadmin: superadmin / Admin@123
Director:   director1 / Director@123
Manager:    manager1 / Manager@123
Admin:      admin1 / Admin@123
Teacher:    teacher1 / Teacher@123
Student:    student1 / Student@123
\`\`\`

## Quick Login Example

\`\`\`bash
curl -X POST http://localhost:8000/api/auth/login/ \
  -H "Content-Type: application/json" \
  -d '{
    "username": "director1",
    "password": "Director@123"
  }'
\`\`\`

## Common Filters & Pagination

\`\`\`
?page=1                    # Pagination
?page_size=20              # Items per page
?search=term               # Search
?ordering=created_at       # Ordering
?created_at__gte=2024-01-01  # Date filtering
\`\`\`

## Permission Levels

- **AllowAny**: /api/auth/login/
- **IsAuthenticated**: Most endpoints
- **SuperAdmin Only**: Centers, Directors
- **Director/Manager**: Branches, Subjects, Groups
- **Role-Specific**: Student, Teacher, Admin endpoints

## Authentication Header

\`\`\`
Authorization: Bearer {jwt_token_from_login}
\`\`\`

## Response Structure

**Success (200/201):**
\`\`\`json
{
  "id": 1,
  "field1": "value1",
  "field2": "value2"
}
\`\`\`

**List Response (200):**
\`\`\`json
{
  "count": 100,
  "next": "http://api.example.com?page=2",
  "previous": null,
  "results": [...]
}
\`\`\`

**Error (400/401/403/404):**
\`\`\`json
{
  "error": "Error message"
}
\`\`\`

## Most Used Endpoints

1. **Login**: `POST /api/auth/login/`
2. **List Students**: `GET /api/students/`
3. **Mark Attendance**: `POST /api/attendance/bulk-mark/`
4. **Create Payment**: `POST /api/payments/`
5. **Get Teacher Performance**: `GET /api/teachers/{id}/performance/`
6. **Get Group Statistics**: `GET /api/groups/{id}/statistics/`
7. **Create Lesson**: `POST /api/lessons/`
8. **Submit Assignment**: `POST /api/submissions/`
9. **List Notifications**: `GET /api/notifications/`
10. **Get Lead Statistics**: `GET /api/leads/statistics/`

## API Base URL

**Development**: `http://localhost:8000/api/`
**Production**: `https://your-domain.com/api/`

## Swagger Documentation

Access interactive API docs at:
`http://localhost:8000/api/docs/`

\`\`\`

Finally, let me create a cURL examples file:
