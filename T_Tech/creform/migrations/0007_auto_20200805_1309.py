# Generated by Django 3.0.8 on 2020-08-05 13:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('creform', '0006_auto_20200805_1200'),
    ]

    operations = [
        migrations.AlterField(
            model_name='sale',
            name='amount',
            field=models.IntegerField(default=0),
        ),
    ]