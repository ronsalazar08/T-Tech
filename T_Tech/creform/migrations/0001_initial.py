# Generated by Django 3.0.8 on 2020-08-04 16:03

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='rfpg',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('ISSUED', models.IntegerField(default=0)),
                ('CLOSED', models.IntegerField(default=0)),
                ('CLOSED_WITH_IN_TARGET_DATE', models.IntegerField(default=0)),
            ],
            options={
                'verbose_name_plural': 'RFPGS',
            },
        ),
        migrations.CreateModel(
            name='sale',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(default='', max_length=50)),
                ('amount', models.IntegerField(default=0)),
            ],
            options={
                'verbose_name_plural': 'SALES',
            },
        ),
    ]
