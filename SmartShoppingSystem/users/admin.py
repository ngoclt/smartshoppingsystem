from django.contrib import admin
from .models import User


class UserAdmin(admin.ModelAdmin):
    fieldsets = [
        (None, {'fields': ['username', 'email', 'password', 'first_name', 'last_name', 'gender', 'avatar', 'is_active']}),
        ('Permissions', {'fields': ['is_staff', 'is_superuser', 'groups', 'user_permissions']})
    ]


admin.site.register(User, UserAdmin)

