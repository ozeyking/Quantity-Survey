# Generated by Django 4.0.6 on 2022-11-22 12:39

import datetime
from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('supervisor', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Payment',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('employee_id', models.BigIntegerField()),
                ('amount', models.FloatField()),
                ('created_at', models.DateTimeField(default=datetime.datetime.now)),
                ('site', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='supervisor.site')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
