#!/bin/bash

echo "================================"
echo "Educational Center CRM Setup"
echo "================================"

# Install dependencies
echo ""
echo "1. Installing Python dependencies..."
pip install -r requirements.txt

# Create .env file if it doesn't exist
if [ ! -f .env ]; then
    echo ""
    echo "2. Creating .env file..."
    cp .env.example .env
    echo "   Please update .env with your database credentials"
fi

# Run migrations
echo ""
echo "3. Running database migrations..."
python manage.py makemigrations
python manage.py migrate

# Create superuser
echo ""
echo "4. Creating superuser..."
python manage.py createsuperuser --username admin --email admin@crm.uz --noinput 2>/dev/null || echo "   Superuser already exists"

# Setup initial data
echo ""
echo "5. Setting up initial data..."
python manage.py shell -c "
from scripts.setup_database import setup_database
setup_database()
"

# Collect static files
echo ""
echo "6. Collecting static files..."
python manage.py collectstatic --noinput

echo ""
echo "================================"
echo "Setup completed successfully!"
echo "================================"
echo ""
echo "To start the server, run:"
echo "  python manage.py runserver"
echo ""
echo "Access Swagger UI at:"
echo "  http://localhost:8000/api/docs/"
echo ""
echo "Access Django Admin at:"
echo "  http://localhost:8000/admin/"
