import os
from django.core.asgi import get_asgi_application

# settings.py faylingizni ko‘rsatish
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'crm_project.settings')

application = get_asgi_application()
