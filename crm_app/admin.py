from django.contrib import admin
from .models import (
    EducationalCenter, UserProfile, Branch, Subject, Group, Student,
    Teacher, Lesson, Attendance, Payment, Assignment, AssignmentSubmission,
    Exam, ExamResult, Room, Payroll, Notification, Contract, Lead
)

@admin.register(EducationalCenter)
class EducationalCenterAdmin(admin.ModelAdmin):
    list_display = ('name', 'email', 'phone', 'status', 'created_at')
    list_filter = ('status', 'created_at')
    search_fields = ('name', 'email')

@admin.register(UserProfile)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ('user', 'role', 'educational_center', 'is_blocked')
    list_filter = ('role', 'is_blocked')
    search_fields = ('user__username', 'user__email')

@admin.register(Branch)
class BranchAdmin(admin.ModelAdmin):
    list_display = ('name', 'educational_center', 'status', 'manager')
    list_filter = ('status', 'educational_center')

@admin.register(Subject)
class SubjectAdmin(admin.ModelAdmin):
    list_display = ('name', 'educational_center')

@admin.register(Group)
class GroupAdmin(admin.ModelAdmin):
    list_display = ('name', 'subject', 'teacher', 'status')
    list_filter = ('status',)

@admin.register(Student)
class StudentAdmin(admin.ModelAdmin):
    list_display = ('user', 'group', 'branch', 'status')
    list_filter = ('status',)

@admin.register(Teacher)
class TeacherAdmin(admin.ModelAdmin):
    list_display = ('user', 'branch', 'specialization', 'performance_rating')
    list_filter = ('status',)

@admin.register(Lesson)
class LessonAdmin(admin.ModelAdmin):
    list_display = ('group', 'teacher', 'date', 'is_cancelled')
    list_filter = ('is_cancelled', 'date')

@admin.register(Attendance)
class AttendanceAdmin(admin.ModelAdmin):
    list_display = ('student', 'lesson', 'status', 'marked_at')
    list_filter = ('status',)

@admin.register(Payment)
class PaymentAdmin(admin.ModelAdmin):
    list_display = ('student', 'amount', 'payment_date', 'payment_type')
    list_filter = ('payment_type', 'payment_date')

@admin.register(Assignment)
class AssignmentAdmin(admin.ModelAdmin):
    list_display = ('title', 'group', 'teacher', 'due_date')

@admin.register(AssignmentSubmission)
class AssignmentSubmissionAdmin(admin.ModelAdmin):
    list_display = ('assignment', 'student', 'submitted_at', 'grade')

@admin.register(Exam)
class ExamAdmin(admin.ModelAdmin):
    list_display = ('title', 'group', 'exam_date')

@admin.register(ExamResult)
class ExamResultAdmin(admin.ModelAdmin):
    list_display = ('exam', 'student', 'score', 'grade')

@admin.register(Room)
class RoomAdmin(admin.ModelAdmin):
    list_display = ('name', 'branch', 'capacity', 'is_available')

@admin.register(Payroll)
class PayrollAdmin(admin.ModelAdmin):
    list_display = ('teacher', 'month', 'total_salary', 'is_paid')

@admin.register(Notification)
class NotificationAdmin(admin.ModelAdmin):
    list_display = ('user', 'notification_type', 'is_read', 'created_at')

@admin.register(Contract)
class ContractAdmin(admin.ModelAdmin):
    list_display = ('student', 'contract_number', 'is_verified')

@admin.register(Lead)
class LeadAdmin(admin.ModelAdmin):
    list_display = ('name', 'phone', 'status', 'source')
    list_filter = ('status', 'source')
