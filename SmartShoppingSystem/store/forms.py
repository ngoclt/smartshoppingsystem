from django import forms
from .models import Manager, Shopper, Product

from django.contrib.auth.forms import ReadOnlyPasswordHashField
from django.contrib.auth.models import Group

class ProductAdminForm(forms.ModelForm):
    """ ModelForm class to validate product instance data before saving from admin interface """

    class Meta:
        model = Product
        fields = '__all__'

    def clean_price(self):
        if self.cleaned_data['price'] <= 0:
            raise forms.ValidationError('Price supplied must be greater than zero.')
        return self.cleaned_data['price']


class ShopperForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput)

    class Meta:
        model = Shopper
        fields = ('first_name',
                  'last_name',
                  'email',
                  'password',
                  'address_line',
                  'telephone',
                  'zip_code',
                  'state',
                  'country')

    def save(self, commit=True):
        # Save the provided password in hashed format
        user = super(ShopperForm, self).save(commit=False)
        group, created = Group.objects.get_or_create(name='Shopper')
        user.groups.add(group)
        user.save()
        return user


class ManagerAdminCreationForm(forms.ModelForm):
    """A form for creating new users. Includes all the required
    fields, plus a repeated password."""
    password1 = forms.CharField(label='Password', widget=forms.PasswordInput)
    password2 = forms.CharField(label='Password confirmation', widget=forms.PasswordInput)

    class Meta:
        model = Manager
        fields = ('username', 'email', 'password', 'first_name', 'last_name', 'gender', 'avatar')

    def clean_password2(self):
        # Check that the two password entries match
        password1 = self.cleaned_data.get("password1")
        password2 = self.cleaned_data.get("password2")
        if password1 and password2 and password1 != password2:
            raise forms.ValidationError("Passwords don't match")
        return password2


class ManagerAdminChangeForm(forms.ModelForm):
    """A form for updating users. Includes all the fields on
    the user, but replaces the password field with admin's
    password hash display field.
    """
    password = ReadOnlyPasswordHashField(label="Password",
                                         help_text="Raw passwords are not stored, so there is no way to see "
                                                   "this user's password, but you can change the password "
                                                   "using <a href=\"../password/\">this form</a>.")

    class Meta:
        model = Manager
        fields = ('username', 'email', 'password', 'first_name', 'last_name', 'gender', 'avatar')

    def clean_password(self):
        # Regardless of what the user provides, return the initial value.
        # This is done here, rather than on the field, because the
        # field does not have access to the initial value
        return self.initial["password"]

    def save(self, commit=True):
        # Save the provided password in hashed format
        user = super(ManagerAdminChangeForm, self).save(commit=False)
        group, created = Group.objects.get_or_create(name='Store Manager')
        user.groups.add(group)
        if commit:
            user.save()
        return user
