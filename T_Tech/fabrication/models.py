from django.db import models


class sale(models.Model):
    name = models.CharField(default='', max_length=50)
    amount = models.IntegerField(default=0)

    class Meta:
        verbose_name = "month"
        verbose_name_plural = "SALES"

    def __str__(self):
        return self.name


class rfpg(models.Model):
    name = models.CharField(max_length=50)
    ISSUED = models.IntegerField(default=0)
    CLOSED = models.IntegerField(default=0)
    CLOSED_WITH_IN_TARGET_DATE = models.IntegerField(default=0)

    class Meta:
        verbose_name = "month"
        verbose_name_plural = "RFPGS"

    def __str__(self):
        return self.name

