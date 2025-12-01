# Database Migration Notes

## After Model Changes

Run these commands to apply the new changes:

\`\`\`bash
# 1. Create migration
python manage.py makemigrations crm_app

# Expected output:
# Migrations for 'crm_app':
#   crm_app/migrations/XXXX_auto_XXXX.py
#     - Alter field director on educationalcenter

# 2. Apply migration
python manage.py migrate

# Expected output:
# Running migrations:
#   Applying crm_app.XXXX... OK

# 3. Test server
python manage.py runserver
\`\`\`

## What Changed in Database

### EducationalCenter Table

**Before:**
\`\`\`sql
ALTER TABLE crm_app_educationalcenter
MODIFY COLUMN director_id INT NOT NULL;
\`\`\`

**After:**
\`\`\`sql
ALTER TABLE crm_app_educationalcenter
MODIFY COLUMN director_id INT NULL;
\`\`\`

This allows:
- Creating centers WITHOUT a director
- Updating director later
- No circular dependency

## Verification

To verify changes were applied:

\`\`\`bash
python manage.py dbshell

# Run:
sqlite> .schema crm_app_educationalcenter
# or
mysql> DESCRIBE crm_app_educationalcenter;
# or  
psql> \d crm_app_educationalcenter

# You should see director_id as nullable (NULL in output)
\`\`\`

## Rollback (if needed)

If something goes wrong:

\`\`\`bash
# Check migrations
python manage.py showmigrations crm_app

# Rollback last migration
python manage.py migrate crm_app XXXX  # (previous migration number)

# Delete the new migration file and re-run
