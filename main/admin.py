from django.contrib import admin
from .models import Profile, Product, StockActivity

# Register your models here.
admin.site.register(Profile)
admin.site.register(Product)
admin.site.register(StockActivity)
