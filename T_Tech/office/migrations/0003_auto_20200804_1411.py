# Generated by Django 3.0.8 on 2020-08-04 14:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('office', '0002_auto_20200804_1340'),
    ]

    operations = [
        migrations.AlterField(
            model_name='employee',
            name='status',
            field=models.CharField(blank=True, choices=[('P', 'PRESENT'), ('L', 'LATE'), ('A', 'ABSENT')], max_length=5, null=True),
        ),
    ]
