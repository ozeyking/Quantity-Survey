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
        return User.objects.filter(pk=self.employee_id).first()


class Employee(models.Model):
    employee_id = models.BigIntegerField(default=0)
    position = models.CharField(max_length=250)
    site = models.ForeignKey(Site, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(default=datetime.now)

    def __str__(self):
        user = User.objects.filter(pk=self.employee_id).first()

        if user.id:
            return f"{user.first_name} {user.last_name} - {self.position}"
        else:
            return self.position

    def employee(self):
        return User.objects.filter(pk=self.employee_id).first()


class Attendance(models.Model):
    employee_id = models.BigIntegerField()
    site = models.ForeignKey(Site, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(default=datetime.now)

    def __str__(self):
        user = User.objects.filter(pk=self.employee_id).first()

        if user.id:
            return f"{user.first_name} {user.last_name} - {self.created_at}"
        else:
            return self.position

    def employee(self):
        return User.objects.filter(pk=self.employee_id).first()
