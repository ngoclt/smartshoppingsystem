from .models import *

from rest_framework import serializers
from .models import Shopper


class UserSerializer(serializers.ModelSerializer):

    class Meta:
        model = Shopper
        fields = ('id', 'username', 'first_name', 'last_name', 'email')
        read_only_fields = ('username', 'email')


class CreateUserSerializer(serializers.ModelSerializer):

    class Meta:
        model = Shopper
        fields = ('id', 'username', 'password', 'first_name', 'last_name', 'email', 'auth_token',)
        read_only_fields = ('auth_token',)
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        # call create_user on user object. Without this
        # the password will be stored in plain text.
        user = Shopper.objects.create_user(**validated_data)
        return user


class StoreSerializer(serializers.ModelSerializer):

    class Meta:
        model = Store
        fields = ('id', 'name', 'address', 'cover')


class CategorySerializer(serializers.ModelSerializer):

    class Meta:
        model = Category
        fields = ('id', 'name', 'description', 'thumbnail')


class ProductSerializer(serializers.ModelSerializer):
    is_liked = serializers.SerializerMethodField('check_like_status')

    def check_like_status(self, instance):
        request = self.context['request']
        if request.user:
            queryset = Interest.objects.filter(owner=request.user, product=instance)
            return queryset.count() > 0

        return False


    class Meta:
        model = Product
        fields = ('id', 'name', 'description', 'brand', 'price', 'quantity', 'image', 'thumbnail', 'is_liked')


class NotificationSerializer(serializers.ModelSerializer):

    class Meta:
        model = Notification
        fields = ('id', 'title', 'message', 'beacons', 'product', 'category', 'store')


class InterestSerializer(serializers.ModelSerializer):

    class Meta:
        model = Shopper
        fields = ('id', 'product', 'category', 'owner')


class CreateInterestSerializer(serializers.ModelSerializer):

    class Meta:
        model = Shopper
        fields = ('product', 'category')

    def validate_product(self, value):
        if not value:
            product = Product.objects.get(pk=value)
            if not product:
                raise serializers.ValidationError("Product ID is invalid.")

        return product

    def validate_category(self, value):
        if not value:
            self.category = Category.objects.get(pk=category)
            if not category:
                raise serializers.ValidationError("Category ID is invalid.")

    def validate(self, data):
        if not category and not product:
            raise serializers.ValidationError("Product ID or Category ID is required.")
        return data

    def create(self, validated_data):
        interest_data = {
            'product': self.product,
            'category': self.category,
            'owner': self.request.user

        }
        interest_serializer = CreateInterestSerializer(data=interest_data)
        return Interest.objects.create(**interest)


