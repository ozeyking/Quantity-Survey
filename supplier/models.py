from django.db import models
from datetime import datetime
from django.contrib.auth import get_user_model

User = get_user_model()

# Create your models here.
class Supplier(models.Model):
    name = models.CharField(max_length=250)
    description = models.TextField()
    image = models.ImageField(upload_to="supplier", blank=True)
    owner_id = models.BigIntegerField()
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(default=datetime.now)

    def __str__(self):
        return self.name

    def owner(self):
        return User.objects.filter(pk=self.owner_id).first()


class SupplierProduct(models.Model):
    name = models.CharField(max_length=250)
    quality = models.CharField(max_length=250, blank=True)
    price = models.FloatField(default=0)
    image = models.ImageField(upload_to="supplier/products", blank=True)
    supplier = models.ForeignKey(Supplier, on_delete=models.CASCADE)
    description = models.TextField(blank=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(default=datetime.now)

    def __str__(self):
        return self.name
