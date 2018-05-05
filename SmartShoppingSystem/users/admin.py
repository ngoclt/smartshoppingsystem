from django.contrib import admin
from .models import User
from .forms import UserAdminCreationForm, UserAdminChangeForm
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin


class UserAdmin(BaseUserAdmin):

    form = UserAdminChangeForm
    add_form = UserAdminCreationForm

    fieldsets = [
        (None, {'fields': ['username', 'email', 'password', 'first_name', 'last_name', 'gender', 'avatar', 'is_active']}),
        ('Permissions', {'fields': ['is_staff', 'is_superuser', 'groups', 'user_permissions']})
    ]


admin.site.register(User, UserAdmin)

