# Generated by Django 3.0.8 on 2020-08-19 07:50

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('contractor', '0012_auto_20200818_1957'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='curweek',
            options={'verbose_name_plural': 'CURRENT WEEK DS __________(August 16 - August 22)'},
        ),
        migrations.AlterModelOptions(
            name='curweekns',
            options={'verbose_name_plural': 'CURRENT WEEK NS __________(August 16 - August 22)'},
        ),
        migrations.AlterModelOptions(
            name='lasweek',
            options={'verbose_name_plural': 'LAST WEEK DS_______________(August 09 - August 15)'},
        ),
        migrations.AlterModelOptions(
            name='lasweekns',
            options={'verbose_name_plural': 'LAST WEEK NS_______________(August 09 - August 15)'},
        ),
    ]
