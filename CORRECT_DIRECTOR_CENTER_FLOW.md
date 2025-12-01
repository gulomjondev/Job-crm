# Correct Director → Center Creation Flow

## API Workflow - Step by Step

### STEP 1: Create Director (FIRST - No Center Required)
**Endpoint:** `POST /api/directors/`

**Request Body:**
\`\`\`json
{
  "username": "director1",
  "password": "Director@123",
  "first_name": "Ali",
  "last_name": "Karimov",
  "email": "director1@example.com",
  "phone": "+998901234567",
  "passport_number": "AB1234567",
  "birthday": "1985-05-15",
  "role": "Director"
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 1,
  "user": {
    "id": 5,
    "username": "director1",
    "first_name": "Ali",
    "last_name": "Karimov",
    "email": "director1@example.com"
  },
  "role": "Director",
  "educational_center": null,
  "phone": "+998901234567",
  "passport_number": "AB1234567",
  "birthday": "1985-05-15",
  "image": null,
  "is_blocked": false,
  "created_at": "2024-11-29T10:30:00Z"
}
\`\`\`

**Note:** 
- `educational_center` is `null` - Director has no center yet
- This step is INDEPENDENT - no center needed

---

### STEP 2: Create Educational Center (SECOND - With Director Selection)
**Endpoint:** `POST /api/centers/`

**Request Body:**
\`\`\`json
{
  "name": "Tashkent Educational Center",
  "address": "Tashkent, Uzbekistan",
  "phone": "+998712345678",
  "email": "center@example.com",
  "director": 1,
  "license_number": "LIC-2024-001",
  "description": "Leading educational center in Tashkent",
  "opened_at": "2024-01-01",
  "status": "Active",
  "website": "https://example.com"
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": 1,
  "name": "Tashkent Educational Center",
  "address": "Tashkent, Uzbekistan",
  "phone": "+998712345678",
  "email": "center@example.com",
  "director": 1,
  "director_name": "Ali Karimov",
  "director_username": "director1",
  "users_count": 1,
  "available_directors": [],
  "license_number": "LIC-2024-001",
  "description": "Leading educational center in Tashkent",
  "opened_at": "2024-01-01",
  "status": "Active",
  "website": "https://example.com",
  "created_at": "2024-11-29T10:35:00Z",
  "updated_at": "2024-11-29T10:35:00Z"
}
\`\`\`

**Note:**
- `director` field shows Director ID (1)
- `director_name` and `director_username` show director details
- `available_directors` will now be empty (director1 is assigned)

---

### STEP 3: View Available Directors

**Endpoint:** `GET /api/centers/1/`

**Response:**
\`\`\`json
{
  "id": 1,
  "name": "Tashkent Educational Center",
  "available_directors": [
    {
      "id": 2,
      "user_full_name": "Fatima Abdullayeva",
      "user_username": "director2",
      "phone": "+998902345678",
      "role": "Director"
    },
    {
      "id": 3,
      "user_full_name": "Omonjon Yusupov",
      "user_username": "director3",
      "phone": "+998903456789",
      "role": "Director"
    }
  ],
  "director": 1,
  "director_name": "Ali Karimov"
}
\`\`\`

---

### STEP 4: Login with Director Account

**Endpoint:** `POST /api/login/`

**Request Body:**
\`\`\`json
{
  "username": "director1",
  "password": "Director@123"
}
\`\`\`

**Response:**
\`\`\`json
{
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9...",
  "refresh": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9...",
  "user_id": 5,
  "username": "director1",
  "role": "Director",
  "center_id": 1
}
\`\`\`

---

### STEP 5: Director Can Now Create Branches, Teachers, Students

Once logged in with token, Director can create:
- Branches
- Teachers  
- Students
- Subjects
- Groups
- Etc.

---

## Complete cURL Example

\`\`\`bash
#!/bin/bash

# STEP 1: Create Director (without center)
curl -X POST http://localhost:8000/api/directors/ \
  -H "Content-Type: application/json" \
  -d '{
    "username": "director1",
    "password": "Director@123",
    "first_name": "Ali",
    "last_name": "Karimov",
    "email": "director1@example.com",
    "phone": "+998901234567",
    "role": "Director"
  }'

# STEP 2: Create Center (with director)
curl -X POST http://localhost:8000/api/centers/ \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Tashkent Educational Center",
    "address": "Tashkent, Uzbekistan",
    "phone": "+998712345678",
    "email": "center@example.com",
    "director": 1,
    "license_number": "LIC-2024-001",
    "status": "Active"
  }'

# STEP 3: Login
curl -X POST http://localhost:8000/api/login/ \
  -H "Content-Type: application/json" \
  -d '{
    "username": "director1",
    "password": "Director@123"
  }'

# STEP 4: Get Center with Available Directors
curl -X GET http://localhost:8000/api/centers/1/ \
  -H "Authorization: Bearer <TOKEN>"
\`\`\`

---

## Summary

✅ **Correct Order:**
1. Create Director (no center required)
2. Create Center (select director from list)
3. Login with director
4. Create other resources

✅ **Key Points:**
- Directors are created independently
- Centers show list of available directors in `available_directors` field
- Director can only belong to ONE educational center
- After assignment, director won't appear in available directors anymore
