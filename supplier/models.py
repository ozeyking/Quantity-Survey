from django.db import models
from datetime import datetime
from django.contrib.auth import get_user_model

User = get_user_model()

# Create your models here.
class SupplierProduct(models.Model):
    name = models.CharField(max_length=250)
    price = models.FloatField()
    image = models.ImageField(upload_to="products", blank=True)
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
