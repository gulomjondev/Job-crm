#!/bin/bash

echo "🚀 Educational Center CRM - Quick Test Setup"
echo "================================================"
echo ""

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Step 1: Run Migrations${NC}"
python manage.py migrate

echo ""
echo -e "${BLUE}Step 2: Create Test Users & Data${NC}"
python manage.py shell < scripts/test_create_users.py

echo ""
echo -e "${GREEN}✅ Setup Complete!${NC}"
echo ""
echo "Now run: python manage.py runserver"
echo "Then open: http://localhost:8000/api/docs/"
echo ""
echo "Test Credentials:"
echo "  Director: director1 / Director@123"
echo "  Teacher:  teacher1 / Teacher@123"
echo "  Student:  student1 / Student@123"
