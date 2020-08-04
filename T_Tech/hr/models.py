from django.db import models


class THC(models.Model):
    name = models.CharField(max_length=50)
    probationary = models.IntegerField(default=0)
    regular = models.IntegerField(default=0)
    male = models.IntegerField(default=0)
    female = models.IntegerField(default=0)
    married = models.IntegerField(default=0)
    single = models.IntegerField(default=0)
    g1 = models.IntegerField(default=0)
    g2 = models.IntegerField(default=0)
    g3 = models.IntegerField(default=0)
    g4 = models.IntegerField(default=0)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = "THC"


class TTECH(models.Model):
    name = models.CharField(max_length=50)
    probationary = models.IntegerField(default=0)
    regular = models.IntegerField(default=0)
    male = models.IntegerField(default=0)
    female = models.IntegerField(default=0)
    married = models.IntegerField(default=0)
    single = models.IntegerField(default=0)
    g1 = models.IntegerField(default=0)
    g2 = models.IntegerField(default=0)
    g3 = models.IntegerField(default=0)
    g4 = models.IntegerField(default=0)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = "T-TECH"


class YTMI(models.Model):
    name = models.CharField(max_length=50)
    reg_a = models.IntegerField(default=0)
    khmpc_a = models.IntegerField(default=0)
    reg_b = models.IntegerField(default=0)
    khmpc_b = models.IntegerField(default=0)
    reg_rt = models.IntegerField(default=0)
    khmpc_rt = models.IntegerField(default=0)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = "YTMI Borrowed"


class AS_OF(models.Model):
    name = models.CharField(max_length=50)
    date_modified = models.DateField(auto_now=False, null=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = "Date Modified"
