# Generated by Django 4.1.3 on 2022-12-22 10:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("supplier", "0002_supplierproduct_description"),
    ]

    operations = [
        migrations.AddField(
            model_name="supplierproduct",
            name="quality",
            field=models.CharField(blank=True, max_length=250),
        ),
        migrations.AlterField(
            model_name="supplierproduct",
            name="price",
            field=models.FloatField(default=0),
        ),
    ]
