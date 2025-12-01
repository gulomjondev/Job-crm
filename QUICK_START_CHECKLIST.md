# Quick Start Checklist

## Pre-Setup
- [ ] Python 3.8+ installed
- [ ] PostgreSQL/SQLite configured
- [ ] `pip install -r requirements.txt` ran

## Database Setup
- [ ] `python manage.py makemigrations`
- [ ] `python manage.py migrate`
- [ ] Migrations applied successfully

## Testing Setup
- [ ] Server running: `python manage.py runserver`
- [ ] Swagger accessible: `http://localhost:8000/api/docs/`
- [ ] AllowAny permissions active in views.py

## API Testing Order

### Phase 1: Center & Director (5 minutes)
- [ ] POST /api/centers/ - Create center
- [ ] POST /api/directors/ - Create director
- [ ] PATCH /api/centers/1/ - Link director
- [ ] POST /api/login/ - Get token

### Phase 2: Branch & Subjects (5 minutes)
- [ ] POST /api/branches/ - Create branch
- [ ] POST /api/subjects/ - Add subjects

### Phase 3: Groups (5 minutes)
- [ ] POST /api/groups/ - Create group

### Phase 4: People (10 minutes)
- [ ] POST /api/teachers/ - Add teacher
- [ ] POST /api/students/ - Add student

### Phase 5: Operations (10 minutes)
- [ ] POST /api/lessons/ - Schedule lesson
- [ ] POST /api/attendance/ - Mark attendance
- [ ] POST /api/payments/ - Record payment

## Verification
- [ ] All POST endpoints return 201 status
- [ ] All GET endpoints return data
- [ ] All PATCH endpoints update correctly
- [ ] No permission errors (AllowAny active)
- [ ] Swagger docs show all endpoints

## Production Migration
- [ ] [ ] Remove/comment AllowAny in views.py
- [ ] [ ] Uncomment IsAuthenticated in views.py
- [ ] [ ] Update permissions to match roles
- [ ] [ ] Test with proper authentication
- [ ] [ ] Deploy to server

## Troubleshooting
- [ ] Check logs: `tail -f logs/error.log`
- [ ] DB connection: `python manage.py dbshell`
- [ ] Migrations status: `python manage.py showmigrations`
- [ ] Clear cache: `python manage.py clear_cache`

---

**Status:** ✅ **READY FOR TESTING**
