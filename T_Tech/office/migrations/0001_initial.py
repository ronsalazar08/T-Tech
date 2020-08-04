# Generated by Django 3.0.8 on 2020-08-04 13:19

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='employee',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('rfid', models.IntegerField(unique=True)),
                ('no', models.IntegerField()),
                ('firstname', models.CharField(max_length=50)),
                ('middlename', models.CharField(max_length=50)),
                ('lastname', models.CharField(max_length=50)),
                ('position', models.CharField(max_length=50)),
                ('birthday', models.DateField(null=True)),
                ('name_sound', models.FileField(blank=True, null=True, upload_to='wav_files')),
                ('picture', models.ImageField(default='no-avatar.png', upload_to='pic_files')),
                ('status', models.CharField(blank=True, choices=[('P', 'P'), ('L', 'L'), ('A', 'A')], max_length=5)),
            ],
            options={
                'verbose_name': 'Employee',
                'verbose_name_plural': 'Employees',
            },
        ),
        migrations.CreateModel(
            name='pagestat',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('stat', models.CharField(max_length=5)),
            ],
        ),
    ]
