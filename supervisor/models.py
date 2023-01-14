from django.db import models
from datetime import datetime
from django.contrib.auth import get_user_model

User = get_user_model()

# Create your models here.
class Site(models.Model):
    name = models.CharField(max_length=250)
    address = models.CharField(max_length=250)
    description = models.TextField()
    supervisor_id = models.BigIntegerField()
    image = models.ImageField(upload_to="site", blank=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(default=datetime.now)

    def __str__(self):
        return self.name

    def supervisor(self):
        return User.objects.filter(pk=self.supervisor_id).first()

    def employee_count(self):
        return Employee.objects.filter(site_id=self.id).count()


class Employee(models.Model):
    names = models.CharField(max_length=250)
    email = models.CharField(max_length=250, blank=True)
    phone = models.CharField(max_length=250, blank=True)
    position = models.CharField(max_length=250)
    site = models.ForeignKey(Site, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(default=datetime.now)

    def __str__(self):
        return self.names


class Attendance(models.Model):
    site = models.ForeignKey(Site, on_delete=models.CASCADE)
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(default=datetime.now)

    def __str__(self):
        return self.employee.names
