from django.urls import path
from django.views.generic import RedirectView
from . import views

app_name = "supplier"
urlpatterns = [
    path("supplier", views.supplier_index, name="supplier.index"),
    path("supplier/create", views.supplier_create, name="supplier.create"),
    path("supplier/<int:id>/edit", views.supplier_edit, name="supplier.edit"),
    path("supplier/<int:id>/delete", views.supplier_delete, name="supplier.delete"),
    path("supplier/<int:id>", views.supplier_show, name="supplier.show"),
    path("product", views.supplier_product_index, name="product.index"),
    path("product/create", views.supplier_product_create, name="product.create"),
    path("product/<int:id>/edit", views.supplier_product_edit, name="product.edit"),
    path(
        "product/<int:id>/delete", views.supplier_product_delete, name="product.delete"
    ),
    path("product/<int:id>", views.supplier_product_show, name="product.show"),
    path("activity", views.supplier_activity_index, name="activity.index"),
    path("activity/create", views.supplier_activity_create, name="activity.create"),
    path("activity/<int:id>/edit", views.supplier_activity_edit, name="activity.edit"),
    path(
        "activity/<int:id>/delete",
        views.supplier_activity_delete,
        name="activity.delete",
    ),
    path("activity/<int:id>", views.supplier_activity_show, name="activity.show"),
]
