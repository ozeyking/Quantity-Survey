from django.contrib import admin
from .models import Site, Employee, Payment

# Register your models here.
admin.site.register(Site)
admin.site.register(Employee)
admin.site.register(Payment)
