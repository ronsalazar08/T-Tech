# Generated by Django 3.0.8 on 2020-08-18 19:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('contractor', '0011_auto_20200818_1943'),
    ]

    operations = [
        migrations.CreateModel(
            name='LasWeekNS',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
            options={
                'verbose_name_plural': 'AUGUST 09, 2020 - AUGUST 15, 2020 NIGHT SHIFT',
            },
        ),
        migrations.AlterModelOptions(
            name='lasweek',
            options={'verbose_name_plural': 'AUGUST 09, 2020 - AUGUST 15, 2020 DAY SHIFT'},
        ),
    ]