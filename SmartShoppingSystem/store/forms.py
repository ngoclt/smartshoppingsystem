from django import forms
from .models import Shopper, Product


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

