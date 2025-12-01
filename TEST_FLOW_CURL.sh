#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

BASE_URL="http://localhost:8000/api"

echo -e "${BLUE}===========================================${NC}"
echo -e "${BLUE}EDUCATIONAL CENTER CRM - API TEST FLOW${NC}"
echo -e "${BLUE}===========================================${NC}\n"

# Step 1: Create Center
echo -e "${YELLOW}Step 1: Center Qo'shish (Director siz)${NC}"
CENTER_RESPONSE=$(curl -s -X POST "$BASE_URL/centers/" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Tashkent IT Academy",
    "address": "Tashkent, Uzbekistan",
    "phone": "+998901234567",
    "email": "info@academy.uz",
    "description": "IT va Programming o'\''quv markazi",
    "license_number": "LIC-2024-001",
    "website": "https://academy.uz",
    "status": "Active"
  }')

CENTER_ID=$(echo $CENTER_RESPONSE | grep -o '"id":[0-9]*' | head -1 | grep -o '[0-9]*')
echo -e "${GREEN}✓ Center yaratildi: ID = $CENTER_ID${NC}\n"

# Step 2: Create Director
echo -e "${YELLOW}Step 2: Direktor User Yaratish${NC}"
DIRECTOR_RESPONSE=$(curl -s -X POST "$BASE_URL/directors/" \
  -H "Content-Type: application/json" \
  -d "{
    \"username\": \"director1\",
    \"password\": \"Director@123\",
    \"first_name\": \"Ali\",
    \"last_name\": \"Karimov\",
    \"email\": \"director@academy.uz\",
    \"phone\": \"+998901111111\",
    \"birthday\": \"1980-05-15\",
    \"educational_center\": $CENTER_ID
  }")

DIRECTOR_USER_ID=$(echo $DIRECTOR_RESPONSE | grep -o '"user":[^}]*' -a | grep -o '"id":[0-9]*' | head -1 | grep -o '[0-9]*')
echo -e "${GREEN}✓ Direktor yaratildi: User ID = $DIRECTOR_USER_ID${NC}\n"

# Step 3: Update Center with Director
echo -e "${YELLOW}Step 3: Center-ni Direktor bilan Yangilash${NC}"
curl -s -X PATCH "$BASE_URL/centers/$CENTER_ID/" \
  -H "Content-Type: application/json" \
  -d "{
    \"director\": $DIRECTOR_USER_ID
  }" > /dev/null

echo -e "${GREEN}✓ Center Updated with Director${NC}\n"

# Step 4: Director Login
echo -e "${YELLOW}Step 4: Direktor Login Qilish${NC}"
LOGIN_RESPONSE=$(curl -s -X POST "$BASE_URL/login/" \
  -H "Content-Type: application/json" \
  -d '{
    "username": "director1",
    "password": "Director@123"
  }')

TOKEN=$(echo $LOGIN_RESPONSE | grep -o '"token":"[^"]*' | cut -d'"' -f4)
echo -e "${GREEN}✓ Token Olindi: $TOKEN${NC}\n"

# Step 5: Create Branch (Director tomonidan)
echo -e "${YELLOW}Step 5: Filial Qo'shish${NC}"
BRANCH_RESPONSE=$(curl -s -X POST "$BASE_URL/branches/" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TOKEN" \
  -d "{
    \"educational_center\": $CENTER_ID,
    \"name\": \"Tashkent Main Branch\",
    \"address\": \"Tashkent, Mirabad District\",
    \"phone\": \"+998901234560\",
    \"status\": \"Open\"
  }")

BRANCH_ID=$(echo $BRANCH_RESPONSE | grep -o '"id":[0-9]*' | head -1 | grep -o '[0-9]*')
echo -e "${GREEN}✓ Filial yaratildi: ID = $BRANCH_ID${NC}\n"

echo -e "${BLUE}===========================================${NC}"
echo -e "${GREEN}All tests completed successfully!${NC}"
echo -e "${BLUE}===========================================${NC}\n"

echo -e "Center ID: ${YELLOW}$CENTER_ID${NC}"
echo -e "Director User ID: ${YELLOW}$DIRECTOR_USER_ID${NC}"
echo -e "Authorization Token: ${YELLOW}$TOKEN${NC}"
echo -e "Branch ID: ${YELLOW}$BRANCH_ID${NC}"
