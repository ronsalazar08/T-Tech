# Generated by Django 3.0.8 on 2020-08-05 12:00

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('creform', '0005_auto_20200805_1159'),
    ]

    operations = [
        migrations.AlterField(
            model_name='sale',
            name='amount',
            field=models.IntegerField(blank=True, default=0, null=True),
        ),
    ]
