import os
from PIL import Image
from django.db import models
from django.apps import apps
from datetime import datetime
from django.utils import timezone
from django.dispatch import receiver
from django.utils.html import mark_safe
from django.db.models.query import QuerySet
from django.db.models.signals import post_save
from django.utils.translation import ugettext as _
from django.core.exceptions import ValidationError


def content_file_name(instance, filename):
    try:
        old_file = employee.objects.get(pk=instance.pk).picture
        print(old_file.path)
        if old_file != 'no-avatar.png':
            os.remove(old_file.path)
    except:
        pass
    ext = filename.split('.')[-1]
    filename = f"{instance.id_number}.{ext}"
    return os.path.join('contractor_pic_files', filename)
    

class employee(models.Model):
    status_choice = [ ('P', 'PRESENT'), ('L', 'LATE'), ('A', 'ABSENT') ]
    shift_choice = [ ('DS', 'DAY SHIFT'), ('NS', 'NIGHT SHIFT') ]
    position_choice = [ ('R', 'REGULAR'), ('NR', 'NON-REGULAR') ]
    face_id = models.IntegerField(unique=True)
    id_number = models.IntegerField(unique=True, default=1)
    firstname = models.CharField(max_length=50)
    middlename = models.CharField(max_length=50)
    lastname = models.CharField(max_length=50)
    company = models.CharField(max_length=50)
    position = models.CharField(max_length=50, choices=position_choice, default='')
    shift = models.CharField(max_length=2, choices=shift_choice)
    status = models.CharField(max_length=5, blank=True, null=True, choices=status_choice)
    picture = models.ImageField(default="no-avatar.png", upload_to=content_file_name)

    class Meta:
        verbose_name_plural = "EMPLOYEES"
        
    def __str__(self):
        name = self.lastname + ", " + self.firstname + " " + self.middlename[0] + ". "
        return str(name)
    
    def save(self, *args, **kwargs):
        # capitalize name
        for field_name in ['firstname', 'middlename', 'lastname', 'company']:
            val = getattr(self, field_name, False)
            if val: setattr(self, field_name, val.upper())
        if self.face_id == None:
            try:
                top = employee.objects.order_by('-id')[0]
                self.face_id = top.face_id + 1
            except:
                self.face_id = 1
        
        super(employee, self).save(*args, **kwargs)

        # resize image
        try:
            size = (450,450)
            pic = Image.open(self.picture.path)
            pic = pic.resize(size, Image.ANTIALIAS)
            pic.save(self.picture.path)
        except:
            pass
        # status to month
        mon = datetime.now().strftime("%B").lower()
        model = apps.get_model('contractor', mon)
        field_name = 'd' + str(datetime.now().day)
        field_name_icontains = field_name + '__icontains'
        model.objects.filter(id = self.id).update(**{field_name: self.status})

        try:
            this = employee.objects.get(pk = self.pk)
            fil = str(this.picture)
            filename = (fil.split('/'))[1]
            filenumber = filename.split('.')[0]
            ext = filename.split('.')[1]
            final_filename = f"{self.id_number}.{ext}"
            if str(self.id_number) != str(filenumber):
                os.rename(str(this.picture.path), f"/home/linaro/Desktop/T-Tech/T_Tech/media/contractor_pic_files/{final_filename}")
                this.picture = f"contractor_pic_files/{final_filename}"
                this.save()
                print("id_number is different to picture number")
            os.system("sshpass -p 'ttech001' ssh pi@10.44.2.133 'rm -f /home/pi/Desktop/TEST/IMAGE/*'")
            print("UPDATING IMAGES")
            os.system("sshpass -p 'ttech001' scp /home/linaro/Desktop/T-Tech/T_Tech/media/contractor_pic_files/* pi@10.44.2.133:/home/pi/Desktop/TEST/IMAGE")
            print("IMAGES UPDATED")
        except Exception as ex:
            print(ex)


    def delete(self, *args, **kwargs):
        super(employee, self).delete(*args, **kwargs)
        try:
            print("DELETING IMAGE")
            os.remove(self.picture.path)

            os.system("sshpass -p 'ttech001' ssh pi@10.44.2.133 'rm -f /home/pi/Desktop/TEST/IMAGE/*'")
            print("UPDATING IMAGES")
            os.system("sshpass -p 'ttech001' scp /home/linaro/Desktop/T-Tech/T_Tech/media/contractor_pic_files/* pi@10.44.2.133:/home/pi/Desktop/TEST/IMAGE")
            print("IMAGES UPDATED")
        except Exception as ex:
            print(ex)

    def thumbnail(self, *args, **kwargs):
        return mark_safe(f'<img src="{self.picture.url}" width="100" height="100" />')
        image_tag.short_description = 'Image'

    def action(self,  *args, **kwargs):
        return mark_safe(f'''<input type="button" onclick="location.href='/contractor/record/{self.id}'" style="height:25px; padding: 5px 15px; font-weight: bolder;" value="Records" />''')


class logbox(models.Model):
    transact_choice = [('I', 'IN'), ('O', 'OUT')]
    shift_choice = [ ('DS', 'DAY SHIFT'), ('NS', 'NIGHT SHIFT') ]
    employee = models.ForeignKey(employee, to_field="face_id", db_column="face_id", on_delete=models.CASCADE)
    date_time = models.DateTimeField(null=True, blank=True)
    transaction = models.CharField(max_length=1, choices=transact_choice)
    shift = models.CharField(max_length=2, choices=shift_choice, default='DS')

    class Meta:
        verbose_name_plural = "LOGBOX"

    def __str__(self):
        return str(self.employee)

    def save(self, *args, **kwargs):
        oras = self.date_time
        mon = (self.date_time).strftime("%B").lower()
        model = apps.get_model('contractor', mon)
        field_name = 'd' + str(self.date_time.strftime("%d").lstrip('0'))
        today7o1am = oras.replace(hour=7, minute=1, second=0, microsecond=0)
        today7o1pm = oras.replace(hour=19, minute=1, second=0, microsecond=0)
        if self.transaction == 'I':
            if oras < today7o1am and self.shift == 'DS':
                s = 'P'
            elif oras >= today7o1am and self.shift == 'DS':
                s = 'L'
            elif oras < today7o1pm and self.shift == 'NS':
                s = 'P'
            elif oras >= today7o1pm and self.shift == 'NS':
                s = 'L'
            emp = employee.objects.get(face_id = self.employee.face_id)
            emp.status = s
            emp.save()
            d = model.objects.get(id = emp.id)
            setattr(d, field_name, s)
            d.save()
        super(logbox, self).save(*args, **kwargs)

    def delete(self, *args, **kwargs):
        oras = self.date_time.strftime("%H:%M:%S")
        mon = (self.date_time).strftime("%B").lower()
        model = apps.get_model('contractor', mon)
        field_name = 'd' + str(self.date_time.strftime("%d").lstrip('0'))
        emp = employee.objects.get(face_id = self.employee.face_id)
        d = model.objects.get(id = emp.id)
        setattr(d, field_name, '')
        d.save()
        super(logbox, self).delete(*args, **kwargs)

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



global current_week, last_week, last2_week, last3_week
t = timezone.now().weekday()
ts = timezone.now() + timezone.timedelta(days=-t)
currentweekf = ts + timezone.timedelta(days=-1)
currentweekl = ts + timezone.timedelta(days=+5)
lastweekf = ts + timezone.timedelta(days=-8)
lastweekl = ts + timezone.timedelta(days=-2)


current_week = currentweekf.strftime(
    "%B %d") + ' - ' + currentweekl.strftime("%B %d")
last_week = lastweekf.strftime(
    "%B %d") + ' - ' + lastweekl.strftime("%B %d")




class CurWeek(models.Model):
    class Meta:
        verbose_name_plural = 'CURRENT WEEK DS __________(' + str(current_week) + ')'
        app_label = 'contractor'


class CurWeekNS(models.Model):
    class Meta:
        verbose_name_plural = 'CURRENT WEEK NS __________(' + str(current_week) + ')'
        app_label = 'contractor'
        

class LasWeek(models.Model):
    class Meta:
        verbose_name_plural = 'LAST WEEK DS_______________(' + str(last_week) + ')'
        app_label = 'contractor'
        

class LasWeekNS(models.Model):
    class Meta:
        verbose_name_plural = 'LAST WEEK NS_______________(' + str(last_week) + ')'
        app_label = 'contractor'


class ComputationTemplateRegular(models.Model):
    class Meta:
        verbose_name_plural = 'PAYROLL FORM_______________(REGULAR)'
        app_label = 'contractor'
        

class ComputationTemplateNonRegular(models.Model):
    class Meta:
        verbose_name_plural = 'PAYROLL FORM_______________(NON-REGULAR)'
        app_label = 'contractor'