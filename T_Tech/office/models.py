from django.db import models
from datetime import datetime
from django.db.models.signals import post_save
from PIL import Image
from django.apps import apps
from django.utils.html import mark_safe
from django.core.exceptions import ValidationError
from django.utils.translation import ugettext as _


class employee(models.Model):
    status_choice = [ ('P', 'PRESENT'), ('L', 'LATE'), ('A', 'ABSENT') ]
    rfid = models.IntegerField(unique=True)
    no = models.IntegerField()
    firstname = models.CharField(max_length=50)
    middlename = models.CharField(max_length=50)
    lastname = models.CharField(max_length=50)
    position = models.CharField(max_length=50)
    birthday = models.DateField(auto_now=False, null=True)
    name_sound = models.FileField( upload_to="wav_files", blank=True, null=True)
    picture = models.ImageField(default="no-avatar.png", upload_to="pic_files")
    status = models.CharField(max_length=5 , blank=True, null=True, choices=status_choice)

    class Meta:
        verbose_name_plural = "EMPLOYEES"
        
    def __str__(self):
        name = self.lastname + ", " + self.firstname + " " + self.middlename[0] + ". "
        return str(name)
    
    def save(self, *args, **kwargs):
        # capitalize name
        for field_name in ['firstname', 'middlename', 'lastname', 'position']:
            val = getattr(self, field_name, False)
            if val:
                setattr(self, field_name, val.upper())

        try: # delete old file when replacing by updating the file
            this = employee.objects.get(id=self.id)
            if this.picture != self.picture & this.picture.url != '/media/no-avatar.png':
                this.picture.delete(save=False)
            if this.name_sound != self.name_sound:
                this.name_sound.delete(save=False)
        except: # when new photo then we do nothing, normal case
            pass
        super(employee, self).save(*args, **kwargs)
        # resize image
        pic = Image.open(self.picture.path)
        output_size = (300,300)
        pic = pic.resize(output_size, Image.ANTIALIAS)
        pic.save(self.picture.path)
        # for reload
        pagestat.objects.all().update(stat='True')

    def thumbnail(self, *args, **kwargs):
        return mark_safe(f'<img src="{self.picture.url}" width="100" height="100" />')
        image_tag.short_description = 'Image'


class pagestat(models.Model):
    stat = models.CharField(max_length=5)

    def __str__(self):
        return self.stat



def create_on_month(sender, **kwargs):
    if kwargs['created']:
        january_create = january.objects.create(rfid=kwargs['instance'])
        february_create = february.objects.create(rfid=kwargs['instance'])
        march_create = march.objects.create(rfid=kwargs['instance'])
        april_create = april.objects.create(rfid=kwargs['instance'])
        may_create = may.objects.create(rfid=kwargs['instance'])
        june_create = june.objects.create(rfid=kwargs['instance'])
        july_create = july.objects.create(rfid=kwargs['instance'])
        august_create = august.objects.create(rfid=kwargs['instance'])
        september_create = september.objects.create(rfid=kwargs['instance'])
        october_create = october.objects.create(rfid=kwargs['instance'])
        november_create = november.objects.create(rfid=kwargs['instance'])
        december_create = december.objects.create(rfid=kwargs['instance'])

post_save.connect(create_on_month, sender=employee)


class january(models.Model):
    rfid = models.OneToOneField('employee', on_delete=models.CASCADE)
    d1 = models.CharField(max_length=5, default="", blank=True)
    d2 = models.CharField(max_length=5, default="", blank=True)
    d3 = models.CharField(max_length=5, default="", blank=True)
    d4 = models.CharField(max_length=5, default="", blank=True)
    d5 = models.CharField(max_length=5, default="", blank=True)
    d6 = models.CharField(max_length=5, default="", blank=True)
    d7 = models.CharField(max_length=5, default="", blank=True)
    d8 = models.CharField(max_length=5, default="", blank=True)
    d9 = models.CharField(max_length=5, default="", blank=True)
    d10 = models.CharField(max_length=5, default="", blank=True)
    d11 = models.CharField(max_length=5, default="", blank=True)
    d12 = models.CharField(max_length=5, default="", blank=True)
    d13 = models.CharField(max_length=5, default="", blank=True)
    d14 = models.CharField(max_length=5, default="", blank=True)
    d15 = models.CharField(max_length=5, default="", blank=True)
    d16 = models.CharField(max_length=5, default="", blank=True)
    d17 = models.CharField(max_length=5, default="", blank=True)
    d18 = models.CharField(max_length=5, default="", blank=True)
    d19 = models.CharField(max_length=5, default="", blank=True)
    d20 = models.CharField(max_length=5, default="", blank=True)
    d21 = models.CharField(max_length=5, default="", blank=True)
    d22 = models.CharField(max_length=5, default="", blank=True)
    d23 = models.CharField(max_length=5, default="", blank=True)
    d24 = models.CharField(max_length=5, default="", blank=True)
    d25 = models.CharField(max_length=5, default="", blank=True)
    d26 = models.CharField(max_length=5, default="", blank=True)
    d27 = models.CharField(max_length=5, default="", blank=True)
    d28 = models.CharField(max_length=5, default="", blank=True)
    d29 = models.CharField(max_length=5, default="", blank=True)
    d30 = models.CharField(max_length=5, default="", blank=True)
    d31 = models.CharField(max_length=5, default="", blank=True)

    class Meta:
        verbose_name = ("january".upper())
        verbose_name_plural = ("january")

    def __str__(self):
        return str(self.rfid)


class february(models.Model):
    rfid = models.OneToOneField('employee', on_delete=models.CASCADE)
    d1 = models.CharField(max_length=5, default="", blank=True)
    d2 = models.CharField(max_length=5, default="", blank=True)
    d3 = models.CharField(max_length=5, default="", blank=True)
    d4 = models.CharField(max_length=5, default="", blank=True)
    d5 = models.CharField(max_length=5, default="", blank=True)
    d6 = models.CharField(max_length=5, default="", blank=True)
    d7 = models.CharField(max_length=5, default="", blank=True)
    d8 = models.CharField(max_length=5, default="", blank=True)
    d9 = models.CharField(max_length=5, default="", blank=True)
    d10 = models.CharField(max_length=5, default="", blank=True)
    d11 = models.CharField(max_length=5, default="", blank=True)
    d12 = models.CharField(max_length=5, default="", blank=True)
    d13 = models.CharField(max_length=5, default="", blank=True)
    d14 = models.CharField(max_length=5, default="", blank=True)
    d15 = models.CharField(max_length=5, default="", blank=True)
    d16 = models.CharField(max_length=5, default="", blank=True)
    d17 = models.CharField(max_length=5, default="", blank=True)
    d18 = models.CharField(max_length=5, default="", blank=True)
    d19 = models.CharField(max_length=5, default="", blank=True)
    d20 = models.CharField(max_length=5, default="", blank=True)
    d21 = models.CharField(max_length=5, default="", blank=True)
    d22 = models.CharField(max_length=5, default="", blank=True)
    d23 = models.CharField(max_length=5, default="", blank=True)
    d24 = models.CharField(max_length=5, default="", blank=True)
    d25 = models.CharField(max_length=5, default="", blank=True)
    d26 = models.CharField(max_length=5, default="", blank=True)
    d27 = models.CharField(max_length=5, default="", blank=True)
    d28 = models.CharField(max_length=5, default="", blank=True)
    d29 = models.CharField(max_length=5, default="", blank=True)

    class Meta:
        verbose_name = ("february".upper())
        verbose_name_plural = ("february")

    def __str__(self):
        return str(self.rfid)


class march(models.Model):
    rfid = models.OneToOneField('employee', on_delete=models.CASCADE)
    d1 = models.CharField(max_length=5, default="", blank=True)
    d2 = models.CharField(max_length=5, default="", blank=True)
    d3 = models.CharField(max_length=5, default="", blank=True)
    d4 = models.CharField(max_length=5, default="", blank=True)
    d5 = models.CharField(max_length=5, default="", blank=True)
    d6 = models.CharField(max_length=5, default="", blank=True)
    d7 = models.CharField(max_length=5, default="", blank=True)
    d8 = models.CharField(max_length=5, default="", blank=True)
    d9 = models.CharField(max_length=5, default="", blank=True)
    d10 = models.CharField(max_length=5, default="", blank=True)
    d11 = models.CharField(max_length=5, default="", blank=True)
    d12 = models.CharField(max_length=5, default="", blank=True)
    d13 = models.CharField(max_length=5, default="", blank=True)
    d14 = models.CharField(max_length=5, default="", blank=True)
    d15 = models.CharField(max_length=5, default="", blank=True)
    d16 = models.CharField(max_length=5, default="", blank=True)
    d17 = models.CharField(max_length=5, default="", blank=True)
    d18 = models.CharField(max_length=5, default="", blank=True)
    d19 = models.CharField(max_length=5, default="", blank=True)
    d20 = models.CharField(max_length=5, default="", blank=True)
    d21 = models.CharField(max_length=5, default="", blank=True)
    d22 = models.CharField(max_length=5, default="", blank=True)
    d23 = models.CharField(max_length=5, default="", blank=True)
    d24 = models.CharField(max_length=5, default="", blank=True)
    d25 = models.CharField(max_length=5, default="", blank=True)
    d26 = models.CharField(max_length=5, default="", blank=True)
    d27 = models.CharField(max_length=5, default="", blank=True)
    d28 = models.CharField(max_length=5, default="", blank=True)
    d29 = models.CharField(max_length=5, default="", blank=True)
    d30 = models.CharField(max_length=5, default="", blank=True)
    d31 = models.CharField(max_length=5, default="", blank=True)

    class Meta:
        verbose_name = ("march".upper())
        verbose_name_plural = ("march")

    def __str__(self):
        return str(self.rfid)


class april(models.Model):
    rfid = models.OneToOneField('employee', on_delete=models.CASCADE)
    d1 = models.CharField(max_length=5, default="", blank=True)
    d2 = models.CharField(max_length=5, default="", blank=True)
    d3 = models.CharField(max_length=5, default="", blank=True)
    d4 = models.CharField(max_length=5, default="", blank=True)
    d5 = models.CharField(max_length=5, default="", blank=True)
    d6 = models.CharField(max_length=5, default="", blank=True)
    d7 = models.CharField(max_length=5, default="", blank=True)
    d8 = models.CharField(max_length=5, default="", blank=True)
    d9 = models.CharField(max_length=5, default="", blank=True)
    d10 = models.CharField(max_length=5, default="", blank=True)
    d11 = models.CharField(max_length=5, default="", blank=True)
    d12 = models.CharField(max_length=5, default="", blank=True)
    d13 = models.CharField(max_length=5, default="", blank=True)
    d14 = models.CharField(max_length=5, default="", blank=True)
    d15 = models.CharField(max_length=5, default="", blank=True)
    d16 = models.CharField(max_length=5, default="", blank=True)
    d17 = models.CharField(max_length=5, default="", blank=True)
    d18 = models.CharField(max_length=5, default="", blank=True)
    d19 = models.CharField(max_length=5, default="", blank=True)
    d20 = models.CharField(max_length=5, default="", blank=True)
    d21 = models.CharField(max_length=5, default="", blank=True)
    d22 = models.CharField(max_length=5, default="", blank=True)
    d23 = models.CharField(max_length=5, default="", blank=True)
    d24 = models.CharField(max_length=5, default="", blank=True)
    d25 = models.CharField(max_length=5, default="", blank=True)
    d26 = models.CharField(max_length=5, default="", blank=True)
    d27 = models.CharField(max_length=5, default="", blank=True)
    d28 = models.CharField(max_length=5, default="", blank=True)
    d29 = models.CharField(max_length=5, default="", blank=True)
    d30 = models.CharField(max_length=5, default="", blank=True)

    class Meta:
        verbose_name = ("april".upper())
        verbose_name_plural = ("april")

    def __str__(self):
        return str(self.rfid)


class may(models.Model):
    rfid = models.OneToOneField('employee', on_delete=models.CASCADE)
    d1 = models.CharField(max_length=5, default="", blank=True)
    d2 = models.CharField(max_length=5, default="", blank=True)
    d3 = models.CharField(max_length=5, default="", blank=True)
    d4 = models.CharField(max_length=5, default="", blank=True)
    d5 = models.CharField(max_length=5, default="", blank=True)
    d6 = models.CharField(max_length=5, default="", blank=True)
    d7 = models.CharField(max_length=5, default="", blank=True)
    d8 = models.CharField(max_length=5, default="", blank=True)
    d9 = models.CharField(max_length=5, default="", blank=True)
    d10 = models.CharField(max_length=5, default="", blank=True)
    d11 = models.CharField(max_length=5, default="", blank=True)
    d12 = models.CharField(max_length=5, default="", blank=True)
    d13 = models.CharField(max_length=5, default="", blank=True)
    d14 = models.CharField(max_length=5, default="", blank=True)
    d15 = models.CharField(max_length=5, default="", blank=True)
    d16 = models.CharField(max_length=5, default="", blank=True)
    d17 = models.CharField(max_length=5, default="", blank=True)
    d18 = models.CharField(max_length=5, default="", blank=True)
    d19 = models.CharField(max_length=5, default="", blank=True)
    d20 = models.CharField(max_length=5, default="", blank=True)
    d21 = models.CharField(max_length=5, default="", blank=True)
    d22 = models.CharField(max_length=5, default="", blank=True)
    d23 = models.CharField(max_length=5, default="", blank=True)
    d24 = models.CharField(max_length=5, default="", blank=True)
    d25 = models.CharField(max_length=5, default="", blank=True)
    d26 = models.CharField(max_length=5, default="", blank=True)
    d27 = models.CharField(max_length=5, default="", blank=True)
    d28 = models.CharField(max_length=5, default="", blank=True)
    d29 = models.CharField(max_length=5, default="", blank=True)
    d30 = models.CharField(max_length=5, default="", blank=True)
    d31 = models.CharField(max_length=5, default="", blank=True)

    class Meta:
        verbose_name = ("may".upper())
        verbose_name_plural = ("may")

    def __str__(self):
        return str(self.rfid)


class june(models.Model):
    rfid = models.OneToOneField('employee', on_delete=models.CASCADE)
    d1 = models.CharField(max_length=5, default="", blank=True)
    d2 = models.CharField(max_length=5, default="", blank=True)
    d3 = models.CharField(max_length=5, default="", blank=True)
    d4 = models.CharField(max_length=5, default="", blank=True)
    d5 = models.CharField(max_length=5, default="", blank=True)
    d6 = models.CharField(max_length=5, default="", blank=True)
    d7 = models.CharField(max_length=5, default="", blank=True)
    d8 = models.CharField(max_length=5, default="", blank=True)
    d9 = models.CharField(max_length=5, default="", blank=True)
    d10 = models.CharField(max_length=5, default="", blank=True)
    d11 = models.CharField(max_length=5, default="", blank=True)
    d12 = models.CharField(max_length=5, default="", blank=True)
    d13 = models.CharField(max_length=5, default="", blank=True)
    d14 = models.CharField(max_length=5, default="", blank=True)
    d15 = models.CharField(max_length=5, default="", blank=True)
    d16 = models.CharField(max_length=5, default="", blank=True)
    d17 = models.CharField(max_length=5, default="", blank=True)
    d18 = models.CharField(max_length=5, default="", blank=True)
    d19 = models.CharField(max_length=5, default="", blank=True)
    d20 = models.CharField(max_length=5, default="", blank=True)
    d21 = models.CharField(max_length=5, default="", blank=True)
    d22 = models.CharField(max_length=5, default="", blank=True)
    d23 = models.CharField(max_length=5, default="", blank=True)
    d24 = models.CharField(max_length=5, default="", blank=True)
    d25 = models.CharField(max_length=5, default="", blank=True)
    d26 = models.CharField(max_length=5, default="", blank=True)
    d27 = models.CharField(max_length=5, default="", blank=True)
    d28 = models.CharField(max_length=5, default="", blank=True)
    d29 = models.CharField(max_length=5, default="", blank=True)
    d30 = models.CharField(max_length=5, default="", blank=True)

    class Meta:
        verbose_name = ("june".upper())
        verbose_name_plural = ("june")

    def __str__(self):
        return str(self.rfid)


class july(models.Model):
    rfid = models.OneToOneField('employee', on_delete=models.CASCADE)
    d1 = models.CharField(max_length=5, default="", blank=True)
    d2 = models.CharField(max_length=5, default="", blank=True)
    d3 = models.CharField(max_length=5, default="", blank=True)
    d4 = models.CharField(max_length=5, default="", blank=True)
    d5 = models.CharField(max_length=5, default="", blank=True)
    d6 = models.CharField(max_length=5, default="", blank=True)
    d7 = models.CharField(max_length=5, default="", blank=True)
    d8 = models.CharField(max_length=5, default="", blank=True)
    d9 = models.CharField(max_length=5, default="", blank=True)
    d10 = models.CharField(max_length=5, default="", blank=True)
    d11 = models.CharField(max_length=5, default="", blank=True)
    d12 = models.CharField(max_length=5, default="", blank=True)
    d13 = models.CharField(max_length=5, default="", blank=True)
    d14 = models.CharField(max_length=5, default="", blank=True)
    d15 = models.CharField(max_length=5, default="", blank=True)
    d16 = models.CharField(max_length=5, default="", blank=True)
    d17 = models.CharField(max_length=5, default="", blank=True)
    d18 = models.CharField(max_length=5, default="", blank=True)
    d19 = models.CharField(max_length=5, default="", blank=True)
    d20 = models.CharField(max_length=5, default="", blank=True)
    d21 = models.CharField(max_length=5, default="", blank=True)
    d22 = models.CharField(max_length=5, default="", blank=True)
    d23 = models.CharField(max_length=5, default="", blank=True)
    d24 = models.CharField(max_length=5, default="", blank=True)
    d25 = models.CharField(max_length=5, default="", blank=True)
    d26 = models.CharField(max_length=5, default="", blank=True)
    d27 = models.CharField(max_length=5, default="", blank=True)
    d28 = models.CharField(max_length=5, default="", blank=True)
    d29 = models.CharField(max_length=5, default="", blank=True)
    d30 = models.CharField(max_length=5, default="", blank=True)
    d31 = models.CharField(max_length=5, default="", blank=True)

    class Meta:
        verbose_name = ("july".upper())
        verbose_name_plural = ("july")

    def __str__(self):
        return str(self.rfid)


class august(models.Model):
    rfid = models.OneToOneField('employee', on_delete=models.CASCADE)
    d1 = models.CharField(max_length=5, default="", blank=True)
    d2 = models.CharField(max_length=5, default="", blank=True)
    d3 = models.CharField(max_length=5, default="", blank=True)
    d4 = models.CharField(max_length=5, default="", blank=True)
    d5 = models.CharField(max_length=5, default="", blank=True)
    d6 = models.CharField(max_length=5, default="", blank=True)
    d7 = models.CharField(max_length=5, default="", blank=True)
    d8 = models.CharField(max_length=5, default="", blank=True)
    d9 = models.CharField(max_length=5, default="", blank=True)
    d10 = models.CharField(max_length=5, default="", blank=True)
    d11 = models.CharField(max_length=5, default="", blank=True)
    d12 = models.CharField(max_length=5, default="", blank=True)
    d13 = models.CharField(max_length=5, default="", blank=True)
    d14 = models.CharField(max_length=5, default="", blank=True)
    d15 = models.CharField(max_length=5, default="", blank=True)
    d16 = models.CharField(max_length=5, default="", blank=True)
    d17 = models.CharField(max_length=5, default="", blank=True)
    d18 = models.CharField(max_length=5, default="", blank=True)
    d19 = models.CharField(max_length=5, default="", blank=True)
    d20 = models.CharField(max_length=5, default="", blank=True)
    d21 = models.CharField(max_length=5, default="", blank=True)
    d22 = models.CharField(max_length=5, default="", blank=True)
    d23 = models.CharField(max_length=5, default="", blank=True)
    d24 = models.CharField(max_length=5, default="", blank=True)
    d25 = models.CharField(max_length=5, default="", blank=True)
    d26 = models.CharField(max_length=5, default="", blank=True)
    d27 = models.CharField(max_length=5, default="", blank=True)
    d28 = models.CharField(max_length=5, default="", blank=True)
    d29 = models.CharField(max_length=5, default="", blank=True)
    d30 = models.CharField(max_length=5, default="", blank=True)
    d31 = models.CharField(max_length=5, default="", blank=True)

    class Meta:
        verbose_name = ("august".upper())
        verbose_name_plural = ("august")

    def __str__(self):
        return str(self.rfid)


class september(models.Model):
    rfid = models.OneToOneField('employee', on_delete=models.CASCADE)
    d1 = models.CharField(max_length=5, default="", blank=True)
    d2 = models.CharField(max_length=5, default="", blank=True)
    d3 = models.CharField(max_length=5, default="", blank=True)
    d4 = models.CharField(max_length=5, default="", blank=True)
    d5 = models.CharField(max_length=5, default="", blank=True)
    d6 = models.CharField(max_length=5, default="", blank=True)
    d7 = models.CharField(max_length=5, default="", blank=True)
    d8 = models.CharField(max_length=5, default="", blank=True)
    d9 = models.CharField(max_length=5, default="", blank=True)
    d10 = models.CharField(max_length=5, default="", blank=True)
    d11 = models.CharField(max_length=5, default="", blank=True)
    d12 = models.CharField(max_length=5, default="", blank=True)
    d13 = models.CharField(max_length=5, default="", blank=True)
    d14 = models.CharField(max_length=5, default="", blank=True)
    d15 = models.CharField(max_length=5, default="", blank=True)
    d16 = models.CharField(max_length=5, default="", blank=True)
    d17 = models.CharField(max_length=5, default="", blank=True)
    d18 = models.CharField(max_length=5, default="", blank=True)
    d19 = models.CharField(max_length=5, default="", blank=True)
    d20 = models.CharField(max_length=5, default="", blank=True)
    d21 = models.CharField(max_length=5, default="", blank=True)
    d22 = models.CharField(max_length=5, default="", blank=True)
    d23 = models.CharField(max_length=5, default="", blank=True)
    d24 = models.CharField(max_length=5, default="", blank=True)
    d25 = models.CharField(max_length=5, default="", blank=True)
    d26 = models.CharField(max_length=5, default="", blank=True)
    d27 = models.CharField(max_length=5, default="", blank=True)
    d28 = models.CharField(max_length=5, default="", blank=True)
    d29 = models.CharField(max_length=5, default="", blank=True)
    d30 = models.CharField(max_length=5, default="", blank=True)

    class Meta:
        verbose_name = ("september".upper())
        verbose_name_plural = ("september")

    def __str__(self):
        return str(self.rfid)


class october(models.Model):
    rfid = models.OneToOneField('employee', on_delete=models.CASCADE)
    d1 = models.CharField(max_length=5, default="", blank=True)
    d2 = models.CharField(max_length=5, default="", blank=True)
    d3 = models.CharField(max_length=5, default="", blank=True)
    d4 = models.CharField(max_length=5, default="", blank=True)
    d5 = models.CharField(max_length=5, default="", blank=True)
    d6 = models.CharField(max_length=5, default="", blank=True)
    d7 = models.CharField(max_length=5, default="", blank=True)
    d8 = models.CharField(max_length=5, default="", blank=True)
    d9 = models.CharField(max_length=5, default="", blank=True)
    d10 = models.CharField(max_length=5, default="", blank=True)
    d11 = models.CharField(max_length=5, default="", blank=True)
    d12 = models.CharField(max_length=5, default="", blank=True)
    d13 = models.CharField(max_length=5, default="", blank=True)
    d14 = models.CharField(max_length=5, default="", blank=True)
    d15 = models.CharField(max_length=5, default="", blank=True)
    d16 = models.CharField(max_length=5, default="", blank=True)
    d17 = models.CharField(max_length=5, default="", blank=True)
    d18 = models.CharField(max_length=5, default="", blank=True)
    d19 = models.CharField(max_length=5, default="", blank=True)
    d20 = models.CharField(max_length=5, default="", blank=True)
    d21 = models.CharField(max_length=5, default="", blank=True)
    d22 = models.CharField(max_length=5, default="", blank=True)
    d23 = models.CharField(max_length=5, default="", blank=True)
    d24 = models.CharField(max_length=5, default="", blank=True)
    d25 = models.CharField(max_length=5, default="", blank=True)
    d26 = models.CharField(max_length=5, default="", blank=True)
    d27 = models.CharField(max_length=5, default="", blank=True)
    d28 = models.CharField(max_length=5, default="", blank=True)
    d29 = models.CharField(max_length=5, default="", blank=True)
    d30 = models.CharField(max_length=5, default="", blank=True)
    d31 = models.CharField(max_length=5, default="", blank=True)

    class Meta:
        verbose_name = ("october".upper())
        verbose_name_plural = ("october")

    def __str__(self):
        return str(self.rfid)


class november(models.Model):
    rfid = models.OneToOneField('employee', on_delete=models.CASCADE)
    d1 = models.CharField(max_length=5, default="", blank=True)
    d2 = models.CharField(max_length=5, default="", blank=True)
    d3 = models.CharField(max_length=5, default="", blank=True)
    d4 = models.CharField(max_length=5, default="", blank=True)
    d5 = models.CharField(max_length=5, default="", blank=True)
    d6 = models.CharField(max_length=5, default="", blank=True)
    d7 = models.CharField(max_length=5, default="", blank=True)
    d8 = models.CharField(max_length=5, default="", blank=True)
    d9 = models.CharField(max_length=5, default="", blank=True)
    d10 = models.CharField(max_length=5, default="", blank=True)
    d11 = models.CharField(max_length=5, default="", blank=True)
    d12 = models.CharField(max_length=5, default="", blank=True)
    d13 = models.CharField(max_length=5, default="", blank=True)
    d14 = models.CharField(max_length=5, default="", blank=True)
    d15 = models.CharField(max_length=5, default="", blank=True)
    d16 = models.CharField(max_length=5, default="", blank=True)
    d17 = models.CharField(max_length=5, default="", blank=True)
    d18 = models.CharField(max_length=5, default="", blank=True)
    d19 = models.CharField(max_length=5, default="", blank=True)
    d20 = models.CharField(max_length=5, default="", blank=True)
    d21 = models.CharField(max_length=5, default="", blank=True)
    d22 = models.CharField(max_length=5, default="", blank=True)
    d23 = models.CharField(max_length=5, default="", blank=True)
    d24 = models.CharField(max_length=5, default="", blank=True)
    d25 = models.CharField(max_length=5, default="", blank=True)
    d26 = models.CharField(max_length=5, default="", blank=True)
    d27 = models.CharField(max_length=5, default="", blank=True)
    d28 = models.CharField(max_length=5, default="", blank=True)
    d29 = models.CharField(max_length=5, default="", blank=True)
    d30 = models.CharField(max_length=5, default="", blank=True)

    class Meta:
        verbose_name = ("november".upper())
        verbose_name_plural = ("november")

    def __str__(self):
        return str(self.rfid)


class december(models.Model):
    rfid = models.OneToOneField('employee', on_delete=models.CASCADE)
    d1 = models.CharField(max_length=5, default="", blank=True)
    d2 = models.CharField(max_length=5, default="", blank=True)
    d3 = models.CharField(max_length=5, default="", blank=True)
    d4 = models.CharField(max_length=5, default="", blank=True)
    d5 = models.CharField(max_length=5, default="", blank=True)
    d6 = models.CharField(max_length=5, default="", blank=True)
    d7 = models.CharField(max_length=5, default="", blank=True)
    d8 = models.CharField(max_length=5, default="", blank=True)
    d9 = models.CharField(max_length=5, default="", blank=True)
    d10 = models.CharField(max_length=5, default="", blank=True)
    d11 = models.CharField(max_length=5, default="", blank=True)
    d12 = models.CharField(max_length=5, default="", blank=True)
    d13 = models.CharField(max_length=5, default="", blank=True)
    d14 = models.CharField(max_length=5, default="", blank=True)
    d15 = models.CharField(max_length=5, default="", blank=True)
    d16 = models.CharField(max_length=5, default="", blank=True)
    d17 = models.CharField(max_length=5, default="", blank=True)
    d18 = models.CharField(max_length=5, default="", blank=True)
    d19 = models.CharField(max_length=5, default="", blank=True)
    d20 = models.CharField(max_length=5, default="", blank=True)
    d21 = models.CharField(max_length=5, default="", blank=True)
    d22 = models.CharField(max_length=5, default="", blank=True)
    d23 = models.CharField(max_length=5, default="", blank=True)
    d24 = models.CharField(max_length=5, default="", blank=True)
    d25 = models.CharField(max_length=5, default="", blank=True)
    d26 = models.CharField(max_length=5, default="", blank=True)
    d27 = models.CharField(max_length=5, default="", blank=True)
    d28 = models.CharField(max_length=5, default="", blank=True)
    d29 = models.CharField(max_length=5, default="", blank=True)
    d30 = models.CharField(max_length=5, default="", blank=True)
    d31 = models.CharField(max_length=5, default="", blank=True)

    class Meta:
        verbose_name = ("december".upper())
        verbose_name_plural = ("december")

    def __str__(self):
        return str(self.rfid)