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


class SupplierProduct(models.Model):
    name = models.CharField(max_length=250)
    price = models.FloatField()
    image = models.ImageField(upload_to="supplier/products", blank=True)
    supplier = models.ForeignKey(Supplier, on_delete=models.CASCADE)
    description = models.TextField(blank=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(default=datetime.now)

    def __str__(self):
        return self.name


class SupplierStockActivity(models.Model):
    product = models.ForeignKey(SupplierProduct, on_delete=models.CASCADE)
    price = models.FloatField()
    quantity = models.FloatField()
    description = models.TextField()
    transaction_type = models.CharField(max_length=250)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(default=datetime.now)

    def __str__(self):
        return f"{self.product.name} {self.quantity}"
