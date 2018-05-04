import uuid
from django.db import models
from django.conf import settings
from django.dispatch import receiver
from django.contrib.auth.models import AbstractUser
from django.utils.encoding import python_2_unicode_compatible
from django.db.models.signals import post_save
from rest_framework.authtoken.models import Token

from SmartShoppingSystem.storage import OverwriteStorage

def upload_to(instance, filename):
    return 'upload/images/avatars/%s' % (filename)

@python_2_unicode_compatible
class User(AbstractUser):

    GENDER_UNSPECIFIED = '-'
    GENDER_MALE = 'm'
    GENDER_FEMALE = 'f'

    GENDER_CHOICES = (
        (GENDER_UNSPECIFIED, 'unspecified'),
        (GENDER_MALE, 'male'),
        (GENDER_FEMALE, 'female'),
    )

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    avatar = models.ImageField(storage=OverwriteStorage(), upload_to=upload_to, null=True, blank=True)
    gender = models.CharField(verbose_name='gender', max_length=1, choices=GENDER_CHOICES, default=GENDER_UNSPECIFIED)

    def __unicode__(self):
        return self.last_name + ' ' + self.first_name

    def __str__(self):
        return self.username


@receiver(post_save, sender=settings.AUTH_USER_MODEL)
def create_auth_token(sender, instance=None, created=False, **kwargs):
    if created:
        Token.objects.create(user=instance)
