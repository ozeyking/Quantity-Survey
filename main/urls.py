from django.urls import path
from django.views.generic import RedirectView
from . import views

urlpatterns = [
    path("", views.home, name="home"),
    path("dashboard", views.dashboard, name="dashboard"),
    path("signup", views.signup, name="signup"),
    path("signin", views.signin, name="signin"),
    path("logout", views.logout, name="logout"),
    path("product", views.product_index, name="product.index"),
    path("product/create", views.product_create, name="product.create"),
    path("product/<int:id>/edit", views.product_edit, name="product.edit"),
    path("product/<int:id>/delete", views.product_delete, name="product.delete"),
    path("product/<int:id>", views.product_show, name="product.show"),
]
