# API Endpoints Quick Reference

## Authentication
\`\`\`
POST   /api/login/                    Login and get JWT token
POST   /api/token/refresh/            Refresh access token
\`\`\`

## Educational Centers (SuperAdmin)
\`\`\`
GET    /api/centers/                  List all centers
POST   /api/centers/                  Create center
GET    /api/centers/{id}/             Retrieve center
PUT    /api/centers/{id}/             Update center (full)
PATCH  /api/centers/{id}/             Update center (partial)
DELETE /api/centers/{id}/             Delete center
POST   /api/centers/{id}/activate/    Activate center
POST   /api/centers/{id}/deactivate/  Deactivate center
\`\`\`

## Directors (SuperAdmin)
\`\`\`
GET    /api/directors/                List all directors
POST   /api/directors/                Create director
GET    /api/directors/{id}/           Retrieve director
PUT    /api/directors/{id}/           Update director
DELETE /api/directors/{id}/           Delete director
\`\`\`

## Branches (Director/Manager)
\`\`\`
GET    /api/branches/                 List branches
POST   /api/branches/                 Create branch
GET    /api/branches/{id}/            Retrieve branch
PUT    /api/branches/{id}/            Update branch
DELETE /api/branches/{id}/            Delete branch
POST   /api/branches/{id}/open/       Open branch
POST   /api/branches/{id}/close/      Close branch
\`\`\`

## Subjects (Director)
\`\`\`
GET    /api/subjects/                 List subjects
POST   /api/subjects/                 Create subject
GET    /api/subjects/{id}/            Retrieve subject
PUT    /api/subjects/{id}/            Update subject
DELETE /api/subjects/{id}/            Delete subject
\`\`\`

## Groups (Director)
\`\`\`
GET    /api/groups/                   List groups
POST   /api/groups/                   Create group
GET    /api/groups/{id}/              Retrieve group
PUT    /api/groups/{id}/              Update group
DELETE /api/groups/{id}/              Delete group
GET    /api/groups/{id}/statistics/   Get group statistics
GET    /api/groups/{id}/attendance-report/  Get attendance report
\`\`\`

## Students
\`\`\`
GET    /api/students/                 List students
POST   /api/students/                 Create student
GET    /api/students/{id}/            Retrieve student
PUT    /api/students/{id}/            Update student
DELETE /api/students/{id}/            Delete student
POST   /api/students/{id}/block/      Block student
POST   /api/students/{id}/assign-group/    Assign to group
GET    /api/students/{id}/attendance-history/   Attendance history
GET    /api/students/{id}/payment-history/     Payment history
\`\`\`

## Teachers
\`\`\`
GET    /api/teachers/                 List teachers
POST   /api/teachers/                 Create teacher
GET    /api/teachers/{id}/            Retrieve teacher
PUT    /api/teachers/{id}/            Update teacher
DELETE /api/teachers/{id}/            Delete teacher
POST   /api/teachers/{id}/rate/       Rate teacher performance
GET    /api/teachers/{id}/schedule/   Get teacher schedule
GET    /api/teachers/{id}/performance/ Get performance metrics
\`\`\`

## Lessons
\`\`\`
GET    /api/lessons/                  List lessons
POST   /api/lessons/                  Create lesson
GET    /api/lessons/{id}/             Retrieve lesson
PUT    /api/lessons/{id}/             Update lesson
DELETE /api/lessons/{id}/             Delete lesson
POST   /api/lessons/{id}/cancel/      Cancel lesson
POST   /api/lessons/{id}/generate-online-link/  Generate meeting link
\`\`\`

## Attendance
\`\`\`
GET    /api/attendance/               List attendance records
POST   /api/attendance/               Mark attendance
GET    /api/attendance/{id}/          Retrieve record
PUT    /api/attendance/{id}/          Update record
DELETE /api/attendance/{id}/          Delete record
POST   /api/attendance/bulk-mark/     Bulk mark attendance
\`\`\`

## Payments
\`\`\`
GET    /api/payments/                 List payments
POST   /api/payments/                 Record payment
GET    /api/payments/{id}/            Retrieve payment
PUT    /api/payments/{id}/            Update payment
DELETE /api/payments/{id}/            Delete payment
GET    /api/payments/debtors/         List debtors
GET    /api/payments/statistics/      Payment statistics
\`\`\`

## Assignments
\`\`\`
GET    /api/assignments/              List assignments
POST   /api/assignments/              Create assignment
GET    /api/assignments/{id}/         Retrieve assignment
PUT    /api/assignments/{id}/         Update assignment
DELETE /api/assignments/{id}/         Delete assignment
\`\`\`

## Submissions
\`\`\`
GET    /api/submissions/              List submissions
POST   /api/submissions/              Submit assignment
GET    /api/submissions/{id}/         Retrieve submission
PUT    /api/submissions/{id}/         Update with grade/feedback
DELETE /api/submissions/{id}/         Delete submission
\`\`\`

## Exams
\`\`\`
GET    /api/exams/                    List exams
POST   /api/exams/                    Create exam
GET    /api/exams/{id}/               Retrieve exam
PUT    /api/exams/{id}/               Update exam
DELETE /api/exams/{id}/               Delete exam
GET    /api/exams/{id}/results/       Get exam results
\`\`\`

## Exam Results
\`\`\`
GET    /api/exam-results/             List results
POST   /api/exam-results/             Submit result
GET    /api/exam-results/{id}/        Retrieve result
PUT    /api/exam-results/{id}/        Update result
DELETE /api/exam-results/{id}/        Delete result
\`\`\`

## Rooms
\`\`\`
GET    /api/rooms/                    List rooms
POST   /api/rooms/                    Create room
GET    /api/rooms/{id}/               Retrieve room
PUT    /api/rooms/{id}/               Update room
DELETE /api/rooms/{id}/               Delete room
POST   /api/rooms/{id}/toggle-availability/  Toggle availability
\`\`\`

## Payroll
\`\`\`
GET    /api/payroll/                  List payroll records
POST   /api/payroll/                  Create payroll
GET    /api/payroll/{id}/             Retrieve payroll
PUT    /api/payroll/{id}/             Update payroll
DELETE /api/payroll/{id}/             Delete payroll
POST   /api/payroll/{id}/mark-paid/   Mark as paid
\`\`\`

## Notifications
\`\`\`
GET    /api/notifications/            List notifications
POST   /api/notifications/            Create notification
GET    /api/notifications/{id}/       Retrieve notification
PUT    /api/notifications/{id}/       Update notification
DELETE /api/notifications/{id}/       Delete notification
POST   /api/notifications/mark-all-read/  Mark all as read
\`\`\`

## Contracts
\`\`\`
GET    /api/contracts/                List contracts
POST   /api/contracts/                Create contract
GET    /api/contracts/{id}/           Retrieve contract
PUT    /api/contracts/{id}/           Update contract
DELETE /api/contracts/{id}/           Delete contract
POST   /api/contracts/{id}/verify/    Verify contract
\`\`\`

## Leads
\`\`\`
GET    /api/leads/                    List leads
POST   /api/leads/                    Create lead
GET    /api/leads/{id}/               Retrieve lead
PUT    /api/leads/{id}/               Update lead
DELETE /api/leads/{id}/               Delete lead
POST   /api/leads/{id}/convert-to-student/  Convert lead to student
GET    /api/leads/statistics/         Lead statistics
\`\`\`

## Query Parameters

### Pagination
\`\`\`
?page=1              Page number (default: 1)
?page_size=20        Items per page (default: 20)
\`\`\`

### Filtering
\`\`\`
?status=Active       Filter by status
?role=Teacher        Filter by role
?search=name         Search by name
\`\`\`

### Ordering
\`\`\`
?ordering=name       Order by field
?ordering=-created_at  Order descending
\`\`\`

## Example: Complex Query
\`\`\`
GET /api/students/?page=2&page_size=10&status=Active&ordering=-created_at
\`\`\`

---

For detailed documentation, see API_DOCUMENTATION.md
For Swagger UI, visit: http://localhost:8000/api/docs/
