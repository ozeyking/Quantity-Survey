from django.urls import path
from django.views.generic import RedirectView
from . import views

app_name = "supervisor"
urlpatterns = [
    path("site", views.site_index, name="site.index"),
    path("site/create", views.site_create, name="site.create"),
    path("site/<int:id>/edit", views.site_edit, name="site.edit"),
    path("site/<int:id>/delete", views.site_delete, name="site.delete"),
    path("site/<int:id>", views.site_show, name="site.show"),
]
