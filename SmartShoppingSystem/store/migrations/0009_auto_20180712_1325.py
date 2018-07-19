# Generated by Django 2.0.5 on 2018-07-12 13:25

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0008_interest'),
    ]

    operations = [
        migrations.AddField(
            model_name='beacon',
            name='created_at',
            field=models.DateTimeField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='interest',
            name='created_at',
            field=models.DateTimeField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='notification',
            name='expired_at',
            field=models.DateTimeField(auto_now=True),
        ),
        migrations.AddField(
            model_name='notification',
            name='started_at',
            field=models.DateTimeField(auto_now=True),
        ),
    ]