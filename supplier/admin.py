from django.contrib import admin
from .models import Supplier, SupplierProduct, SupplierStockActivity

# Register your models here.
admin.site.register(Supplier)
admin.site.register(SupplierProduct)
admin.site.register(SupplierStockActivity)
