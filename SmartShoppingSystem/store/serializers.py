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
    product = ProductSerializer()
    category = CategorySerializer()

    class Meta:
        model = Shopper
        fields = ('id', 'product', 'category', 'owner')


class CreateInterestSerializer(serializers.ModelSerializer):
    product = ProductSerializer()
    category = CategorySerializer()
    
    class Meta:
        model = Interest
        fields = ('id', 'product', 'category')



