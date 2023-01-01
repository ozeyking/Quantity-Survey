# Generated by Django 4.1.3 on 2023-01-01 13:37

import datetime
from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name="Site",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("name", models.CharField(max_length=250)),
                ("address", models.CharField(max_length=250)),
                ("description", models.TextField()),
                ("supervisor_id", models.BigIntegerField()),
                ("image", models.ImageField(blank=True, upload_to="site")),
                ("created_at", models.DateTimeField(default=datetime.datetime.now)),
                (
                    "user",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to=settings.AUTH_USER_MODEL,
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="Employee",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("names", models.CharField(max_length=250)),
                ("email", models.CharField(blank=True, max_length=250)),
                ("phone", models.CharField(blank=True, max_length=250)),
                ("position", models.CharField(max_length=250)),
                ("created_at", models.DateTimeField(default=datetime.datetime.now)),
                (
                    "site",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to="supervisor.site",
                    ),
                ),
                (
                    "user",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to=settings.AUTH_USER_MODEL,
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="Attendance",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("created_at", models.DateTimeField(default=datetime.datetime.now)),
                (
                    "employee",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to="supervisor.employee",
                    ),
                ),
                (
                    "site",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to="supervisor.site",
                    ),
                ),
                (
                    "user",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to=settings.AUTH_USER_MODEL,
                    ),
                ),
            ],
        ),
    ]
