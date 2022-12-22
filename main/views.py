from django.shortcuts import render, redirect, get_object_or_404
from django.views.decorators.http import require_http_methods
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from django.http import JsonResponse, HttpResponse
from django.contrib.auth.models import User, auth
from django.forms.models import model_to_dict
from django.contrib import messages
from .models import Profile, StockActivity, Product
from supervisor.models import Site, Employee
from supplier.models import Supplier, SupplierProduct, SupplierStockActivity

# Create your views here.
@require_http_methods(["GET"])
def home(request):
    return render(request, "home.html")


@require_http_methods(["GET"])
def profile(request, id):
    user = get_object_or_404(User, pk=id)

    if not Profile.objects.filter(profile_user_id=id).exists():
        profile = Profile.objects.create(user=user, profile_user_id=user.id)
        profile.save()
    else:
        profile = Profile.objects.filter(profile_user_id=id).get()

    return render(request, "profile.html", {"profile": profile, "user": user})


@login_required(login_url="signin")
@require_http_methods(["GET", "POST"])
def settings(request):

    if request.method == "GET":
        profile = Profile.objects.filter(profile_user_id=request.user.id).first()

        return render(
            request,
            "settings.html",
            {"profile": profile},
        )


@require_http_methods(["POST"])
@login_required(login_url="signin")
def profile_update(request, id):
    user = get_object_or_404(User, pk=request.user.id)

    if not Profile.objects.filter(profile_user_id=id).exists():
        profile = Profile.objects.create(user=user, profile_user_id=user.id)
        profile.save()
    else:
        profile = Profile.objects.filter(profile_user_id=id).get()

    user.last_name = request.POST["last_name"]
    user.first_name = request.POST["first_name"]
    user.username = request.POST["username"]
    user.email = request.POST["email"]
    profile.bio = request.POST["bio"]

    if request.FILES.get("image") != None:
        profile.image = request.FILES.get("image")

    user.save()
    profile.save()
    messages.info(request, "Settings updated")

    return redirect(request.META.get("HTTP_REFERER"))


@require_http_methods(["GET"])
@login_required(login_url="signin")
def dashboard(request):
    site_count = Site.objects.count()
    product_count = Product.objects.count()
    supplier_count = Supplier.objects.count()
    employee_count = Employee.objects.count()
    profile = Profile.objects.filter(profile_user_id=request.user.id).first()

    return render(
        request,
        "dashboard.html",
        {
            "profile": profile,
            "supplier_count": supplier_count,
            "product_count": product_count,
            "employee_count": employee_count,
            "site_count": site_count,
        },
    )


@require_http_methods(["GET", "POST"])
def signup(request):
    if request.method == "GET":
        return render(request, "signup.html")

    elif request.method == "POST":
        username = request.POST["username"]
        email = request.POST["email"]
        password = request.POST["password"]
        confirm_password = request.POST["confirm_password"]

        if password == "" or password != confirm_password:
            messages.info(request, "Password do not match")
            return redirect("signup")

        if email == "" or User.objects.filter(email=email).exists():
            messages.info(request, "Email already taken")
            return redirect("signup")

        if username == "" or User.objects.filter(username=username).exists():
            messages.info(request, "Username already taken")
            return redirect("signup")

        new_user = User.objects.create_user(
            username=username, email=email, password=password
        )
        new_user.save()

        user_login = auth.authenticate(username=username, password=password)
        auth.login(request, user_login)

        user_model = User.objects.get(email=email)
        new_profile = Profile.objects.create(
            user=user_model, profile_user_id=user_model.id
        )
        new_profile.save()
        return redirect("dashboard")


@require_http_methods(["GET", "POST"])
def signin(request):
    if request.method == "GET":
        return render(request, "signin.html")

    if request.method == "POST":
        username = request.POST["username"]
        password = request.POST["password"]
        user = auth.authenticate(username=username, password=password)

        if user is None:
            messages.info(request, "Invalid credentials")
            return redirect("signin")

        auth.login(request, user)
        return redirect("dashboard")


@login_required(login_url="signin")
def logout(request):
    auth.logout(request)
    return redirect("home")


@login_required(login_url="signin")
def product_index(request):
    products = Product.objects.order_by("-id")
    paginator = Paginator(products, 10)
    page_number = request.GET.get("page")
    page_object = paginator.get_page(page_number)

    return render(request, "product/index.html", {"page_object": page_object})


@login_required(login_url="signin")
def product_create(request):
    if request.method == "GET":
        owners = User.objects.filter(is_superuser=False)
        return render(request, "product/create.html", {"owners": owners})

    elif request.method == "POST":
        name = request.POST["name"]
        quality = request.POST["quality"]
        price = request.POST["price"]
        description = request.POST["description"]
        product = Product(
            name=name,
            price=price,
            description=description,
            user_id=request.user.id,
        )

        if request.FILES.get("image") != None:
            product.image = request.FILES.get("image")

        product.save()
        messages.info(request, "Product saved")
        return redirect("product.index")


@login_required(login_url="signin")
def product_edit(request, id):
    product = get_object_or_404(Product, pk=id)
    if request.method == "GET":
        owners = User.objects.filter(is_superuser=False)
        return render(
            request, "product/edit.html", {"owners": owners, "product": product}
        )

    elif request.method == "POST":
        product.name = request.POST["name"]
        product.quality = request.POST["quality"]
        product.price = request.POST["price"]
        product.description = request.POST["description"]

        if request.FILES.get("image") != None:
            product.image = request.FILES.get("image")

        if request.user.id == product.user_id:
            product.save()
            messages.info(request, "Product saved")

        return redirect("product.index")


def product_delete(request, id):
    Product.objects.filter(pk=id).delete()
    return redirect("product.index")


def product_show(request, id):
    return HttpResponse("show product")
