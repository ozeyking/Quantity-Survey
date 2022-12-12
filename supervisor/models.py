from django.db import models
from datetime import datetime
from django.contrib.auth import get_user_model
from django.shortcuts import get_object_or_404

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
        user = get_object_or_404(User, pk=self.supervisor_id)
        return f"{self.name} - {user.first_name} {user.last_name}"


class Employee(models.Model):
    employee_id = models.BigIntegerField()
    position = models.CharField(max_length=250)
    site = models.ForeignKey(Site, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(default=datetime.now)

    def __str__(self):
        user = get_object_or_404(User, pk=self.employee_id)
        return f"{user.first_name} {user.last_name} - {self.position}"


class Attendance(models.Model):
    employee_id = models.BigIntegerField()
    site = models.ForeignKey(Site, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(default=datetime.now)

    def __str__(self):
        user = get_object_or_404(User, pk=self.employee_id)
        return f"{user.first_name} {user.last_name} - {self.created_at}"
