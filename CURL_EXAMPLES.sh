#!/bin/bash

# Educational Center CRM API - cURL Examples
# This file contains example cURL commands for all major API endpoints

BASE_URL="http://localhost:8000/api"
TOKEN=""  # Will be set after login

# Color codes for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Educational Center CRM API - cURL Examples ===${NC}\n"

# ============================================================================
# 1. AUTHENTICATION - LOGIN
# ============================================================================
echo -e "${GREEN}1. LOGIN - Get JWT Token${NC}"
echo "Command:"
echo "curl -X POST $BASE_URL/auth/login/ \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -d '{\"username\": \"director1\", \"password\": \"Director@123\"}'"
echo ""
echo "Response:"
echo "{"
echo "  \"token\": \"eyJ0eXAiOiJKV1QiLCJhbGc...\","
echo "  \"refresh\": \"eyJ0eXAiOiJKV1QiLCJhbGc...\","
echo "  \"user_id\": 1,"
echo "  \"username\": \"director1\","
echo "  \"role\": \"Director\","
echo "  \"center_id\": 1"
echo "}"
echo ""
echo "---"
echo ""

# ============================================================================
# 2. EDUCATIONAL CENTERS
# ============================================================================
echo -e "${GREEN}2. EDUCATIONAL CENTERS${NC}"
echo ""

echo "2.1 List All Centers"
echo "curl -X GET $BASE_URL/centers/ \\"
echo "  -H 'Authorization: Bearer {token}'"
echo ""

echo "2.2 Create Center"
echo "curl -X POST $BASE_URL/centers/ \\"
echo "  -H 'Authorization: Bearer {token}' \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -d '{
    \"name\": \"New Center\",
    \"address\": \"Tashkent\",
    \"phone\": \"+998901234567\",
    \"email\": \"center@example.com\",
    \"license_number\": \"LIC-001\",
    \"status\": \"Active\"
  }'"
echo ""

echo "2.3 Get Center Details"
echo "curl -X GET $BASE_URL/centers/1/ \\"
echo "  -H 'Authorization: Bearer {token}'"
echo ""

echo "2.4 Update Center (Full)"
echo "curl -X PUT $BASE_URL/centers/1/ \\"
echo "  -H 'Authorization: Bearer {token}' \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -d '{\"name\": \"Updated Center Name\", \"status\": \"Active\"}'"
echo ""

echo "2.5 Partial Update Center"
echo "curl -X PATCH $BASE_URL/centers/1/ \\"
echo "  -H 'Authorization: Bearer {token}' \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -d '{\"status\": \"Inactive\"}'"
echo ""

echo "2.6 Delete Center"
echo "curl -X DELETE $BASE_URL/centers/1/ \\"
echo "  -H 'Authorization: Bearer {token}'"
echo ""

echo "2.7 Activate Center"
echo "curl -X POST $BASE_URL/centers/1/activate/ \\"
echo "  -H 'Authorization: Bearer {token}' \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -d '{}'"
echo ""

echo "2.8 Deactivate Center"
echo "curl -X POST $BASE_URL/centers/1/deactivate/ \\"
echo "  -H 'Authorization: Bearer {token}' \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -d '{}'"
echo ""
echo "---"
echo ""

# ============================================================================
# 3. BRANCHES
# ============================================================================
echo -e "${GREEN}3. BRANCHES${NC}"
echo ""

echo "3.1 List All Branches"
echo "curl -X GET $BASE_URL/branches/ \\"
echo "  -H 'Authorization: Bearer {token}'"
echo ""

echo "3.2 Create Branch"
echo "curl -X POST $BASE_URL/branches/ \\"
echo "  -H 'Authorization: Bearer {token}' \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -d '{
    \"educational_center\": 1,
    \"name\": \"Tashkent Branch\",
    \"address\": \"Tashkent, Uzbekistan\",
    \"phone\": \"+998901234567\",
    \"status\": \"Open\"
  }'"
echo ""

echo "3.3 Open Branch"
echo "curl -X POST $BASE_URL/branches/1/open/ \\"
echo "  -H 'Authorization: Bearer {token}' \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -d '{}'"
echo ""

echo "3.4 Close Branch"
echo "curl -X POST $BASE_URL/branches/1/close/ \\"
echo "  -H 'Authorization: Bearer {token}' \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -d '{}'"
echo ""
echo "---"
echo ""

# ============================================================================
# 4. SUBJECTS/COURSES
# ============================================================================
echo -e "${GREEN}4. SUBJECTS/COURSES${NC}"
echo ""

echo "4.1 Create Subject"
echo "curl -X POST $BASE_URL/subjects/ \\"
echo "  -H 'Authorization: Bearer {token}' \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -d '{
    \"educational_center\": 1,
    \"name\": \"English Language\",
    \"description\": \"English for beginners\"
  }'"
echo ""

echo "4.2 List Subjects"
echo "curl -X GET $BASE_URL/subjects/ \\"
echo "  -H 'Authorization: Bearer {token}'"
echo ""
echo "---"
echo ""

# ============================================================================
# 5. GROUPS/CLASSES
# ============================================================================
echo -e "${GREEN}5. GROUPS/CLASSES${NC}"
echo ""

echo "5.1 Create Group"
echo "curl -X POST $BASE_URL/groups/ \\"
echo "  -H 'Authorization: Bearer {token}' \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -d '{
    \"educational_center\": 1,
    \"branch\": 1,
    \"name\": \"English A1\",
    \"subject\": 1,
    \"teacher\": 10,
    \"capacity\": 25,
    \"status\": \"Active\",
    \"start_date\": \"2024-01-15\",
    \"end_date\": \"2024-06-15\"
  }'"
echo ""

echo "5.2 List Groups"
echo "curl -X GET $BASE_URL/groups/ \\"
echo "  -H 'Authorization: Bearer {token}'"
echo ""

echo "5.3 Get Group Statistics"
echo "curl -X GET $BASE_URL/groups/1/statistics/ \\"
echo "  -H 'Authorization: Bearer {token}'"
echo ""

echo "5.4 Get Group Attendance Report"
echo "curl -X GET $BASE_URL/groups/1/attendance-report/ \\"
echo "  -H 'Authorization: Bearer {token}'"
echo ""
echo "---"
echo ""

# ============================================================================
# 6. STUDENTS
# ============================================================================
echo -e "${GREEN}6. STUDENTS${NC}"
echo ""

echo "6.1 Create Student"
echo "curl -X POST $BASE_URL/students/ \\"
echo "  -H 'Authorization: Bearer {token}' \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -d '{
    \"user\": {
      \"username\": \"student1\",
      \"password\": \"Student@123\",
      \"email\": \"student1@center.uz\",
      \"first_name\": \"Ahmed\",
      \"last_name\": \"Begov\"
    },
    \"group\": 1,
    \"branch\": 1,
    \"status\": \"Active\",
    \"parent_name\": \"Father Name\",
    \"parent_phone\": \"+998901234567\"
  }'"
echo ""

echo "6.2 List Students"
echo "curl -X GET $BASE_URL/students/ \\"
echo "  -H 'Authorization: Bearer {token}'"
echo ""

echo "6.3 Get Student Attendance History"
echo "curl -X GET $BASE_URL/students/1/attendance-history/ \\"
echo "  -H 'Authorization: Bearer {token}'"
echo ""

echo "6.4 Get Student Payment History"
echo "curl -X GET $BASE_URL/students/1/payment-history/ \\"
echo "  -H 'Authorization: Bearer {token}'"
echo ""

echo "6.5 Block Student"
echo "curl -X POST $BASE_URL/students/1/block/ \\"
echo "  -H 'Authorization: Bearer {token}' \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -d '{}'"
echo ""

echo "6.6 Assign Student to Group"
echo "curl -X POST $BASE_URL/students/1/assign-group/ \\"
echo "  -H 'Authorization: Bearer {token}' \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -d '{\"group_id\": 2}'"
echo ""
echo "---"
echo ""

# ============================================================================
# 7. TEACHERS
# ============================================================================
echo -e "${GREEN}7. TEACHERS${NC}"
echo ""

echo "7.1 Create Teacher"
echo "curl -X POST $BASE_URL/teachers/ \\"
echo "  -H 'Authorization: Bearer {token}' \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -d '{
    \"user\": {
      \"username\": \"teacher1\",
      \"password\": \"Teacher@123\",
      \"email\": \"teacher1@center.uz\",
      \"first_name\": \"John\",
      \"last_name\": \"Teacher\"
    },
    \"branch\": 1,
    \"status\": \"Active\",
    \"specialization\": \"English\",
    \"qualification\": \"TEFL Certified\",
    \"hire_date\": \"2024-01-01\",
    \"hourly_rate\": 50
  }'"
echo ""

echo "7.2 List Teachers"
echo "curl -X GET $BASE_URL/teachers/ \\"
echo "  -H 'Authorization: Bearer {token}'"
echo ""

echo "7.3 Rate Teacher Performance"
echo "curl -X POST $BASE_URL/teachers/10/rate/ \\"
echo "  -H 'Authorization: Bearer {token}' \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -d '{\"rating\": 4.5}'"
echo ""

echo "7.4 Get Teacher Schedule"
echo "curl -X GET $BASE_URL/teachers/10/schedule/ \\"
echo "  -H 'Authorization: Bearer {token}'"
echo ""

echo "7.5 Get Teacher Performance Metrics"
echo "curl -X GET $BASE_URL/teachers/10/performance/ \\"
echo "  -H 'Authorization: Bearer {token}'"
echo ""
echo "---"
echo ""

# ============================================================================
# 8. LESSONS
# ============================================================================
echo -e "${GREEN}8. LESSONS${NC}"
echo ""

echo "8.1 Create Lesson"
echo "curl -X POST $BASE_URL/lessons/ \\"
echo "  -H 'Authorization: Bearer {token}' \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -d '{
    \"group\": 1,
    \"teacher\": 10,
    \"room\": 2,
    \"date\": \"2024-01-15\",
    \"start_time\": \"09:00:00\",
    \"end_time\": \"10:30:00\",
    \"duration\": 90
  }'"
echo ""

echo "8.2 List Lessons"
echo "curl -X GET $BASE_URL/lessons/ \\"
echo "  -H 'Authorization: Bearer {token}'"
echo ""

echo "8.3 Cancel Lesson"
echo "curl -X POST $BASE_URL/lessons/1/cancel/ \\"
echo "  -H 'Authorization: Bearer {token}' \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -d '{}'"
echo ""

echo "8.4 Generate Online Link"
echo "curl -X POST $BASE_URL/lessons/1/generate-online-link/ \\"
echo "  -H 'Authorization: Bearer {token}' \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -d '{}'"
echo ""
echo "---"
echo ""

# ============================================================================
# 9. ATTENDANCE
# ============================================================================
echo -e "${GREEN}9. ATTENDANCE${NC}"
echo ""

echo "9.1 Mark Single Attendance"
echo "curl -X POST $BASE_URL/attendance/ \\"
echo "  -H 'Authorization: Bearer {token}' \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -d '{
    \"lesson\": 1,
    \"student\": 1,
    \"status\": \"Present\",
    \"notes\": \"\"
  }'"
echo ""

echo "9.2 Bulk Mark Attendance"
echo "curl -X POST $BASE_URL/attendance/bulk-mark/ \\"
echo "  -H 'Authorization: Bearer {token}' \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -d '{
    \"lesson_id\": 1,
    \"attendance_data\": [
      {\"student_id\": 1, \"status\": \"Present\", \"notes\": \"\"},
      {\"student_id\": 2, \"status\": \"Absent\", \"notes\": \"Sick\"},
      {\"student_id\": 3, \"status\": \"Late\", \"notes\": \"Traffic\"}
    ]
  }'"
echo ""

echo "9.3 List Attendance"
echo "curl -X GET $BASE_URL/attendance/ \\"
echo "  -H 'Authorization: Bearer {token}'"
echo ""
echo "---"
echo ""

# ============================================================================
# 10. PAYMENTS
# ============================================================================
echo -e "${GREEN}10. PAYMENTS${NC}"
echo ""

echo "10.1 Create Payment"
echo "curl -X POST $BASE_URL/payments/ \\"
echo "  -H 'Authorization: Bearer {token}' \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -d '{
    \"student\": 1,
    \"group\": 1,
    \"amount\": 500,
    \"payment_type\": \"Cash\",
    \"due_date\": \"2024-01-31\",
    \"receipt_number\": \"REC-001\",
    \"notes\": \"Payment received\"
  }'"
echo ""

echo "10.2 List Payments"
echo "curl -X GET $BASE_URL/payments/ \\"
echo "  -H 'Authorization: Bearer {token}'"
echo ""

echo "10.3 List Debtors"
echo "curl -X GET $BASE_URL/payments/debtors/ \\"
echo "  -H 'Authorization: Bearer {token}'"
echo ""

echo "10.4 Get Payment Statistics"
echo "curl -X GET $BASE_URL/payments/statistics/ \\"
echo "  -H 'Authorization: Bearer {token}'"
echo ""
echo "---"
echo ""

# ============================================================================
# 11. ASSIGNMENTS
# ============================================================================
echo -e "${GREEN}11. ASSIGNMENTS${NC}"
echo ""

echo "11.1 Create Assignment"
echo "curl -X POST $BASE_URL/assignments/ \\"
echo "  -H 'Authorization: Bearer {token}' \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -d '{
    \"group\": 1,
    \"teacher\": 10,
    \"title\": \"English Essay\",
    \"description\": \"Write an essay\",
    \"due_date\": \"2024-01-20\",
    \"status\": \"Assigned\"
  }'"
echo ""

echo "11.2 List Assignments"
echo "curl -X GET $BASE_URL/assignments/ \\"
echo "  -H 'Authorization: Bearer {token}'"
echo ""
echo "---"
echo ""

# ============================================================================
# 12. EXAMS
# ============================================================================
echo -e "${GREEN}12. EXAMS${NC}"
echo ""

echo "12.1 Create Exam"
echo "curl -X POST $BASE_URL/exams/ \\"
echo "  -H 'Authorization: Bearer {token}' \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -d '{
    \"group\": 1,
    \"teacher\": 10,
    \"title\": \"Final English Test\",
    \"description\": \"Final examination\",
    \"exam_date\": \"2024-02-15\",
    \"start_time\": \"09:00:00\",
    \"end_time\": \"11:00:00\",
    \"total_points\": 100,
    \"passing_score\": 60
  }'"
echo ""

echo "12.2 List Exams"
echo "curl -X GET $BASE_URL/exams/ \\"
echo "  -H 'Authorization: Bearer {token}'"
echo ""

echo "12.3 Get Exam Results"
echo "curl -X GET $BASE_URL/exams/1/results/ \\"
echo "  -H 'Authorization: Bearer {token}'"
echo ""
echo "---"
echo ""

# ============================================================================
# 13. NOTIFICATIONS
# ============================================================================
echo -e "${GREEN}13. NOTIFICATIONS${NC}"
echo ""

echo "13.1 List Notifications"
echo "curl -X GET $BASE_URL/notifications/ \\"
echo "  -H 'Authorization: Bearer {token}'"
echo ""

echo "13.2 Mark All as Read"
echo "curl -X POST $BASE_URL/notifications/mark-all-read/ \\"
echo "  -H 'Authorization: Bearer {token}' \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -d '{}'"
echo ""
echo "---"
echo ""

# ============================================================================
# 14. LEADS
# ============================================================================
echo -e "${GREEN}14. LEADS${NC}"
echo ""

echo "14.1 Create Lead"
echo "curl -X POST $BASE_URL/leads/ \\"
echo "  -H 'Authorization: Bearer {token}' \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -d '{
    \"branch\": 1,
    \"name\": \"Ahmed Khaitov\",
    \"email\": \"ahmed@example.com\",
    \"phone\": \"+998901234567\",
    \"course_interested\": 1,
    \"status\": \"New\",
    \"source\": \"Website\",
    \"notes\": \"Interested in English\"
  }'"
echo ""

echo "14.2 List Leads"
echo "curl -X GET $BASE_URL/leads/ \\"
echo "  -H 'Authorization: Bearer {token}'"
echo ""

echo "14.3 Get Lead Statistics"
echo "curl -X GET $BASE_URL/leads/statistics/ \\"
echo "  -H 'Authorization: Bearer {token}'"
echo ""

echo "14.4 Convert Lead to Student"
echo "curl -X POST $BASE_URL/leads/1/convert-to-student/ \\"
echo "  -H 'Authorization: Bearer {token}' \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -d '{}'"
echo ""
echo "---"
echo ""

echo -e "${BLUE}=== End of Examples ===${NC}"
