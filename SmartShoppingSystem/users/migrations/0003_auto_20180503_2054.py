# Generated by Django 2.0.5 on 2018-05-03 20:54

import SmartShoppingSystem.storage
import SmartShoppingSystem.users.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0002_auto_20171227_2246'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='avatar',
            field=models.ImageField(blank=True, null=True, storage=SmartShoppingSystem.storage.OverwriteStorage(), upload_to=SmartShoppingSystem.users.models.upload_to),
        ),
        migrations.AddField(
            model_name='user',
            name='gender',
            field=models.CharField(choices=[('-', 'unspecified'), ('m', 'male'), ('f', 'female')], default='-', max_length=1, verbose_name='gender'),
        ),
    ]
