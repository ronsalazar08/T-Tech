# Generated by Django 3.0.8 on 2020-08-06 17:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('office', '0008_auto_20200806_0857'),
    ]

    operations = [
        migrations.AlterField(
            model_name='employee',
            name='rfid',
            field=models.CharField(max_length=10, unique=True),
        ),
    ]
