from django.shortcuts import render, redirect, get_list_or_404, get_object_or_404
from django.views.decorators.http import require_http_methods
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from django.http import HttpResponse, JsonResponse
from django.contrib.auth.models import User, auth
from django.forms.models import model_to_dict
from django.contrib import messages
from .models import Site, Employee, Attendance

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
    pass


@login_required(login_url="signin")
def site_delete(request, id):
    pass
