from django.db import models
from datetime import datetime
from django.db.models.signals import post_save
from PIL import Image
from django.apps import apps
from django.utils.html import mark_safe
from django.core.exceptions import ValidationError
from django.utils.translation import ugettext as _
from django.db.models.query import QuerySet

class PollQuerySet(QuerySet):
    def update(self, *args, **kwargs):
        super().update(*args, **kwargs)
        # for reload
        pagestat.objects.all().update(stat='True')

class employee(models.Model):
    objects = PollQuerySet.as_manager() # override update for reload
    
    status_choice = [ ('P', 'PRESENT'), ('L', 'LATE'), ('A', 'ABSENT') ]
    shift_choice = [ ('DS', 'DAY SHIFT'), ('NS', 'NIGHT SHIFT') ]

    face_id = models.IntegerField(blank=True, unique=True)
    firstname = models.CharField(max_length=50)
    middlename = models.CharField(max_length=50)
    lastname = models.CharField(max_length=50)
    company = models.CharField(max_length=50)
    shift = models.CharField(max_length=2, choices=shift_choice)
    status = models.CharField(max_length=5, blank=True, null=True, choices=status_choice)
    picture = models.ImageField(default="no-avatar.png", upload_to="pic_files")

    class Meta:
        verbose_name_plural = "EMPLOYEES"
        
    def __str__(self):
        name = self.lastname + ", " + self.firstname + " " + self.middlename[0] + ". "
        return str(name)
    
    def save(self, *args, **kwargs):
        # capitalize name
        for field_name in ['firstname', 'middlename', 'lastname', 'company']:
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
        try:
            top = employee.objects.order_by('-id')[0]
            self.face_id = top.face_id + 1
        except:
            self.face_id = 1
        super(employee, self).save(*args, **kwargs)

        # resize image
        pic = Image.open(self.picture.path)
        output_size = (300,300)
        pic = pic.resize(output_size, Image.ANTIALIAS)
        pic.save(self.picture.path)

        # status to month
        mon = datetime.now().strftime("%B").lower()
        model = apps.get_model('contractor', mon)
        field_name = 'd' + str(datetime.now().day)
        field_name_icontains = field_name + '__icontains'
        model.objects.filter(id = self.id).update(**{field_name: self.status})

    def thumbnail(self, *args, **kwargs):
        return mark_safe(f'<img src="{self.picture.url}" width="100" height="100" />')
        image_tag.short_description = 'Image'

    def action(self,  *args, **kwargs):
        return mark_safe(f'''<input type="button" onclick="location.href='/contractor/record/{self.id}'" style="height:25px; padding: 5px 15px; font-weight: bolder;" value="Records" />''')


class logbox(models.Model):
    transact_choice = [('I', 'IN'), ('O', 'OUT')]
    employee = models.ForeignKey(
        employee, to_field="face_id", db_column="face_id", on_delete=models.CASCADE)
    date_time = models.DateTimeField(null=True, blank=True)
    transaction = models.CharField(max_length=1, choices=transact_choice)

    class Meta:
        verbose_name_plural = "LOGBOX"

    def __str__(self):
        employee = str(self.employee)
        return str(employee)


def create_on_month(sender, **kwargs):
    if kwargs['created']:
        january_create = january.objects.create(face_id=kwargs['instance'])
        february_create = february.objects.create(face_id=kwargs['instance'])
        march_create = march.objects.create(face_id=kwargs['instance'])
        april_create = april.objects.create(face_id=kwargs['instance'])
        may_create = may.objects.create(face_id=kwargs['instance'])
        june_create = june.objects.create(face_id=kwargs['instance'])
        july_create = july.objects.create(face_id=kwargs['instance'])
        august_create = august.objects.create(face_id=kwargs['instance'])
        september_create = september.objects.create(face_id=kwargs['instance'])
        october_create = october.objects.create(face_id=kwargs['instance'])
        november_create = november.objects.create(face_id=kwargs['instance'])
        december_create = december.objects.create(face_id=kwargs['instance'])

post_save.connect(create_on_month, sender=employee)


class january(models.Model):
    face_id = models.OneToOneField('employee', on_delete=models.CASCADE)
    d1 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d2 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d3 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d4 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d5 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d6 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d7 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d8 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d9 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d10 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d11 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d12 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d13 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d14 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d15 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d16 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d17 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d18 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d19 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d20 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d21 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d22 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d23 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d24 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d25 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d26 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d27 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d28 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d29 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d30 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d31 = models.CharField(max_length=5, default="NULL", blank=True, null=True)

    class Meta:
        verbose_name = ("january".upper())
        verbose_name_plural = ("january".upper())

    def __str__(self):
        return str(self.face_id)


class february(models.Model):
    face_id = models.OneToOneField('employee', on_delete=models.CASCADE)
    d1 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d2 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d3 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d4 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d5 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d6 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d7 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d8 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d9 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d10 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d11 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d12 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d13 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d14 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d15 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d16 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d17 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d18 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d19 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d20 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d21 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d22 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d23 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d24 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d25 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d26 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d27 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d28 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d29 = models.CharField(max_length=5, default="NULL", blank=True, null=True)

    class Meta:
        verbose_name = ("february".upper())
        verbose_name_plural = ("february".upper())

    def __str__(self):
        return str(self.face_id)


class march(models.Model):
    face_id = models.OneToOneField('employee', on_delete=models.CASCADE)
    d1 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d2 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d3 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d4 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d5 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d6 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d7 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d8 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d9 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d10 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d11 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d12 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d13 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d14 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d15 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d16 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d17 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d18 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d19 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d20 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d21 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d22 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d23 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d24 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d25 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d26 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d27 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d28 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d29 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d30 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d31 = models.CharField(max_length=5, default="NULL", blank=True, null=True)

    class Meta:
        verbose_name = ("march".upper())
        verbose_name_plural = ("march".upper())

    def __str__(self):
        return str(self.face_id)


class april(models.Model):
    face_id = models.OneToOneField('employee', on_delete=models.CASCADE)
    d1 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d2 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d3 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d4 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d5 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d6 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d7 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d8 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d9 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d10 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d11 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d12 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d13 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d14 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d15 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d16 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d17 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d18 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d19 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d20 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d21 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d22 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d23 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d24 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d25 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d26 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d27 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d28 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d29 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d30 = models.CharField(max_length=5, default="NULL", blank=True, null=True)

    class Meta:
        verbose_name = ("april".upper())
        verbose_name_plural = ("april".upper())

    def __str__(self):
        return str(self.face_id)


class may(models.Model):
    face_id = models.OneToOneField('employee', on_delete=models.CASCADE)
    d1 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d2 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d3 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d4 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d5 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d6 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d7 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d8 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d9 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d10 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d11 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d12 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d13 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d14 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d15 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d16 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d17 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d18 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d19 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d20 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d21 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d22 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d23 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d24 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d25 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d26 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d27 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d28 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d29 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d30 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d31 = models.CharField(max_length=5, default="NULL", blank=True, null=True)

    class Meta:
        verbose_name = ("may".upper())
        verbose_name_plural = ("may".upper())

    def __str__(self):
        return str(self.face_id)


class june(models.Model):
    face_id = models.OneToOneField('employee', on_delete=models.CASCADE)
    d1 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d2 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d3 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d4 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d5 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d6 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d7 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d8 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d9 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d10 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d11 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d12 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d13 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d14 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d15 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d16 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d17 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d18 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d19 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d20 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d21 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d22 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d23 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d24 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d25 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d26 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d27 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d28 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d29 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d30 = models.CharField(max_length=5, default="NULL", blank=True, null=True)

    class Meta:
        verbose_name = ("june".upper())
        verbose_name_plural = ("june".upper())

    def __str__(self):
        return str(self.face_id)


class july(models.Model):
    face_id = models.OneToOneField('employee', on_delete=models.CASCADE)
    d1 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d2 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d3 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d4 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d5 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d6 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d7 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d8 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d9 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d10 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d11 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d12 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d13 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d14 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d15 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d16 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d17 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d18 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d19 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d20 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d21 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d22 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d23 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d24 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d25 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d26 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d27 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d28 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d29 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d30 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d31 = models.CharField(max_length=5, default="NULL", blank=True, null=True)

    class Meta:
        verbose_name = ("july".upper())
        verbose_name_plural = ("july".upper())

    def __str__(self):
        return str(self.face_id)


class august(models.Model):
    face_id = models.OneToOneField('employee', on_delete=models.CASCADE)
    d1 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d2 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d3 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d4 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d5 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d6 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d7 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d8 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d9 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d10 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d11 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d12 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d13 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d14 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d15 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d16 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d17 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d18 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d19 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d20 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d21 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d22 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d23 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d24 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d25 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d26 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d27 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d28 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d29 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d30 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d31 = models.CharField(max_length=5, default="NULL", blank=True, null=True)

    class Meta:
        verbose_name = ("august".upper())
        verbose_name_plural = ("august".upper())

    def __str__(self):
        return str(self.face_id)


class september(models.Model):
    face_id = models.OneToOneField('employee', on_delete=models.CASCADE)
    d1 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d2 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d3 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d4 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d5 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d6 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d7 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d8 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d9 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d10 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d11 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d12 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d13 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d14 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d15 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d16 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d17 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d18 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d19 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d20 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d21 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d22 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d23 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d24 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d25 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d26 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d27 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d28 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d29 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d30 = models.CharField(max_length=5, default="NULL", blank=True, null=True)

    class Meta:
        verbose_name = ("september".upper())
        verbose_name_plural = ("september".upper())

    def __str__(self):
        return str(self.face_id)


class october(models.Model):
    face_id = models.OneToOneField('employee', on_delete=models.CASCADE)
    d1 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d2 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d3 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d4 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d5 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d6 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d7 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d8 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d9 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d10 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d11 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d12 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d13 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d14 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d15 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d16 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d17 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d18 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d19 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d20 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d21 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d22 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d23 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d24 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d25 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d26 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d27 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d28 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d29 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d30 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d31 = models.CharField(max_length=5, default="NULL", blank=True, null=True)

    class Meta:
        verbose_name = ("october".upper())
        verbose_name_plural = ("october".upper())

    def __str__(self):
        return str(self.face_id)


class november(models.Model):
    face_id = models.OneToOneField('employee', on_delete=models.CASCADE)
    d1 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d2 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d3 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d4 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d5 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d6 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d7 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d8 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d9 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d10 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d11 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d12 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d13 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d14 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d15 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d16 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d17 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d18 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d19 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d20 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d21 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d22 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d23 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d24 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d25 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d26 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d27 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d28 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d29 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d30 = models.CharField(max_length=5, default="NULL", blank=True, null=True)

    class Meta:
        verbose_name = ("november".upper())
        verbose_name_plural = ("november".upper())

    def __str__(self):
        return str(self.face_id)


class december(models.Model):
    face_id = models.OneToOneField('employee', on_delete=models.CASCADE)
    d1 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d2 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d3 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d4 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d5 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d6 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d7 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d8 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d9 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d10 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d11 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d12 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d13 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d14 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d15 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d16 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d17 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d18 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d19 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d20 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d21 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d22 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d23 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d24 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d25 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d26 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d27 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d28 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d29 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d30 = models.CharField(max_length=5, default="NULL", blank=True, null=True)
    d31 = models.CharField(max_length=5, default="NULL", blank=True, null=True)

    class Meta:
        verbose_name = ("december".upper())
        verbose_name_plural = ("december".upper())

    def __str__(self):
        return str(self.face_id)