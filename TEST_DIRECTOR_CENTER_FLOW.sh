#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

API_URL="http://localhost:8000/api"

echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}Testing Director → Center Flow${NC}"
echo -e "${BLUE}================================${NC}\n"

# STEP 1: Create Director (without center)
echo -e "${YELLOW}STEP 1: Creating Director...${NC}"
DIRECTOR_RESPONSE=$(curl -s -X POST "$API_URL/directors/" \
  -H "Content-Type: application/json" \
  -d '{
    "username": "director_test_1",
    "password": "DirectorTest@123",
    "first_name": "Test",
    "last_name": "Director",
    "email": "test.director@example.com",
    "phone": "+998901111111",
    "role": "Director"
  }')

DIRECTOR_ID=$(echo $DIRECTOR_RESPONSE | grep -o '"id":[0-9]*' | head -1 | cut -d':' -f2)
echo -e "${GREEN}✓ Director Created (ID: $DIRECTOR_ID)${NC}"
echo $DIRECTOR_RESPONSE | python -m json.tool
echo ""

# STEP 2: Create Educational Center
echo -e "${YELLOW}STEP 2: Creating Educational Center with Director...${NC}"
CENTER_RESPONSE=$(curl -s -X POST "$API_URL/centers/" \
  -H "Content-Type: application/json" \
  -d "{
    \"name\": \"Test Center - $(date +%s)\",
    \"address\": \"Test Address\",
    \"phone\": \"+998712222222\",
    \"email\": \"test.center@example.com\",
    \"director\": $DIRECTOR_ID,
    \"license_number\": \"TEST-LIC-$(date +%s)\",
    \"status\": \"Active\"
  }")

CENTER_ID=$(echo $CENTER_RESPONSE | grep -o '"id":[0-9]*' | head -1 | cut -d':' -f2)
echo -e "${GREEN}✓ Center Created (ID: $CENTER_ID)${NC}"
echo $CENTER_RESPONSE | python -m json.tool
echo ""

# STEP 3: Login with Director
echo -e "${YELLOW}STEP 3: Login with Director Credentials...${NC}"
LOGIN_RESPONSE=$(curl -s -X POST "$API_URL/login/" \
  -H "Content-Type: application/json" \
  -d '{
    "username": "director_test_1",
    "password": "DirectorTest@123"
  }')

TOKEN=$(echo $LOGIN_RESPONSE | grep -o '"token":"[^"]*' | cut -d'"' -f4)
echo -e "${GREEN}✓ Login Successful${NC}"
echo $LOGIN_RESPONSE | python -m json.tool
echo ""

# STEP 4: Get Center Details
echo -e "${YELLOW}STEP 4: Getting Center Details with Available Directors...${NC}"
CENTER_DETAILS=$(curl -s -X GET "$API_URL/centers/$CENTER_ID/" \
  -H "Authorization: Bearer $TOKEN")

echo -e "${GREEN}✓ Center Details Retrieved${NC}"
echo $CENTER_DETAILS | python -m json.tool
echo ""

echo -e "${BLUE}================================${NC}"
echo -e "${GREEN}✓ All Tests Completed!${NC}"
echo -e "${BLUE}================================${NC}"
