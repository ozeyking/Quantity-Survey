from django.db import models
from datetime import datetime
from django.contrib.auth import get_user_model
from supervisor.models import Site

User = get_user_model()

# Create your models here.
class Profile(models.Model):
    bio = models.TextField()
    profile_user_id = models.BigIntegerField()
    image = models.ImageField(upload_to="profiles", blank=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(default=datetime.now)

    def __str__(self):
        return self.user.username


class Product(models.Model):
    name = models.CharField(max_length=250)
    quality = models.CharField(max_length=250, blank=True)
    price = models.FloatField(default=0)
    image = models.ImageField(upload_to="products", blank=True)
    description = models.TextField(blank=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(default=datetime.now)

    def __str__(self):
        return self.name


class StockActivity(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    price = models.FloatField(blank=True)
    quantity = models.FloatField(default=1)
    description = models.TextField(blank=True)
    site_id = models.BigIntegerField(default=0)
    transaction_type = models.CharField(max_length=250)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(default=datetime.now)

    def __str__(self):
        return f"{self.product.name} {self.quantity}"

    def site(self):
        return Site.objects.filter(pk=self.site_id).first()
