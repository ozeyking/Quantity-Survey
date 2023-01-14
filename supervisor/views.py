from django.shortcuts import render, redirect, get_list_or_404, get_object_or_404
from django.views.decorators.http import require_http_methods
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from django.http import HttpResponse, JsonResponse
from django.contrib.auth.models import User, auth
from django.forms.models import model_to_dict
from django.contrib import messages
from .models import Site, Employee, Attendance
import pandas as pd

# Create your views here.
@login_required(login_url="signin")
def site_index(request):
    sites = Site.objects.order_by("-id")
    paginator = Paginator(sites, 10)
    page_number = request.GET.get("page")
    page_object = paginator.get_page(page_number)

    return render(request, "site/index.html", {"page_object": page_object})


@login_required(login_url="signin")
def site_show(request, id):
    site = get_object_or_404(Site, pk=id)
    return JsonResponse(model_to_dict(site))


@login_required(login_url="signin")
def site_create(request):
    if request.method == "GET":
        users = User.objects.filter(is_superuser=False)
        return render(request, "site/create.html", {"users": users})

    elif request.method == "POST":
        name = request.POST["name"]
        address = request.POST["address"]
        description = request.POST["description"]
        supervisor_id = request.POST["supervisor"]
        site = Site(
            name=name,
            address=address,
            description=description,
            supervisor_id=supervisor_id,
            user_id=request.user.id,
        )

        if request.FILES.get("image") != None:
            site.image = request.FILES.get("image")

        site.save()
        messages.info(request, "Site saved")
        return redirect("supervisor:site.index")


@login_required(login_url="signin")
def site_edit(request, id):
    site = get_object_or_404(Site, pk=id)

    if request.method == "GET":
        users = User.objects.filter(is_superuser=False)
        return render(request, "site/edit.html", {"users": users, "site": site})

    elif request.method == "POST":
        site.name = request.POST["name"]
        site.address = request.POST["address"]
        site.description = request.POST["description"]
        site.supervisor_id = request.POST["supervisor"]

        if request.FILES.get("image") != None:
            site.image = request.FILES.get("image")

        if request.user.id == site.user_id:
            site.save()
            messages.info(request, "Site updated")

        return redirect("supervisor:site.index")


@login_required(login_url="signin")
def site_delete(request, id):
    Site.objects.filter(pk=id).delete()
    return redirect("supervisor:site.index")


# employee
@login_required(login_url="signin")
def employee_index(request):
    employees = Employee.objects.order_by("-id")
    paginator = Paginator(employees, 10)
    page_number = request.GET.get("page")
    page_object = paginator.get_page(page_number)

    return render(request, "employee/index.html", {"page_object": page_object})


@login_required(login_url="signin")
def employee_create(request):
    if request.method == "GET":
        sites = Site.objects.all()
        return render(request, "employee/create.html", {"sites": sites})

    elif request.method == "POST":
        name = request.POST["name"]
        phone = request.POST["phone"]
        email = request.POST["email"]
        site = request.POST["site"]
        position = request.POST["position"]
        employee = Employee(
            names=name,
            phone=phone,
            email=email,
            position=position,
            site_id=site,
            user_id=request.user.id,
        )

        employee.save()
        messages.info(request, "New employee")
        return redirect("supervisor:employee.index")


@login_required(login_url="signin")
def employee_edit(request, id):
    employee = get_object_or_404(Employee, pk=id)

    if request.method == "GET":
        sites = Site.objects.all()
        return render(
            request, "employee/edit.html", {"sites": sites, "employee": employee}
        )

    elif request.method == "POST":
        employee.names = request.POST["name"]
        employee.phone = request.POST["phone"]
        employee.email = request.POST["email"]
        employee.site_id = request.POST["site"]
        employee.position = request.POST["position"]

        if request.user.id == employee.user_id:
            employee.save()
            messages.info(request, "Employee updated")

        return redirect("supervisor:employee.index")


@login_required(login_url="signin")
def employee_delete(request, id):
    Employee.objects.filter(pk=id).delete()
    return redirect("supervisor:employee.index")


@login_required(login_url="signin")
def employee_show(request, id):
    pass


# attendance
@login_required(login_url="signin")
def attendance_index(request):
    attendances = Attendance.objects.order_by("-id")
    paginator = Paginator(attendances, 10)
    page_number = request.GET.get("page")
    page_object = paginator.get_page(page_number)

    return render(request, "attendance/index.html", {"page_object": page_object})


@login_required(login_url="signin")
def attendance_create(request):
    if request.method == "GET":
        sites = Site.objects.filter(supervisor_id=request.user.id).all()
        employees = Employee.objects.all()
        return render(
            request, "attendance/create.html", {"sites": sites, "employees": employees}
        )

    elif request.method == "POST":
        user_id = request.POST["employee"]
        site = request.POST["site"]
        attendance = Attendance(
            employee_id=user_id,
            site_id=site,
            user_id=request.user.id,
        )

        attendance.save()
        messages.info(request, "New attendance")
        return redirect("supervisor:attendance.index")


@login_required(login_url="signin")
def attendance_delete(request, id):
    Attendance.objects.filter(pk=id).delete()
    return redirect("supervisor:attendance.index")


@login_required(login_url="signin")
def attendance_show(request, id):
    pass
