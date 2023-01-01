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
    path("employee", views.employee_index, name="employee.index"),
    path("employee/create", views.employee_create, name="employee.create"),
    path("employee/<int:id>/edit", views.employee_edit, name="employee.edit"),
    path("employee/<int:id>/delete", views.employee_delete, name="employee.delete"),
    path("employee/<int:id>", views.employee_show, name="employee.show"),
    path("attendance", views.attendance_index, name="attendance.index"),
    path("attendance/create", views.attendance_create, name="attendance.create"),
    path(
        "attendance/<int:id>/delete", views.attendance_delete, name="attendance.delete"
    ),
    path("attendance/<int:id>", views.attendance_show, name="attendance.show"),
]
