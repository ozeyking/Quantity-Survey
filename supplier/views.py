from django.shortcuts import render, redirect, get_object_or_404
from django.views.decorators.http import require_http_methods
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from django.http import HttpResponse, JsonResponse
from django.contrib.auth.models import User, auth
from django.forms.models import model_to_dict
from django.contrib import messages
from .models import Supplier, SupplierProduct
import pandas as pd

# Create your views here.
@login_required(login_url="signin")
def supplier_index(request):
    suppliers = Supplier.objects.order_by("-id")
    paginator = Paginator(suppliers, 10)
    page_number = request.GET.get("page")
    page_object = paginator.get_page(page_number)

    return render(request, "supplier/index.html", {"page_object": page_object})


@login_required(login_url="signin")
def supplier_create(request):
    if request.method == "GET":
        owners = User.objects.filter(is_superuser=False)
        return render(request, "supplier/create.html", {"owners": owners})

    elif request.method == "POST":
        name = request.POST["name"]
        owner_id = request.POST["owner_id"]
        description = request.POST["description"]
        supplier = Supplier(
            name=name,
            owner_id=owner_id,
            description=description,
            user_id=request.user.id,
        )

        if request.FILES.get("image") != None:
            supplier.image = request.FILES.get("image")

        supplier.save()
        messages.info(request, "Supplier saved")
        return redirect("supplier:supplier.index")


@login_required(login_url="signin")
def supplier_edit(request, id):
    return render(request, "supplier/edit.html")


@login_required(login_url="signin")
def supplier_delete(request, id):
    return HttpResponse("delete supplier")


def supplier_show(request, id):
    return HttpResponse("show supplier")


@login_required(login_url="signin")
def supplier_product_index(request):
    products = SupplierProduct.objects.filter(user_id=request.user.id).order_by("-id")
    paginator = Paginator(products, 10)
    page_number = request.GET.get("page")
    page_object = paginator.get_page(page_number)

    return render(request, "product/index.html", {"page_object": page_object})


@login_required(login_url="signin")
def supplier_product_create(request):
    if request.method == "GET":
        owners = User.objects.filter(is_superuser=False)
        return render(request, "product/create.html", {"owners": owners})

    elif request.method == "POST":
        supplier = Supplier.objects.filter(owner_id=request.user.id).get()
        if request.FILES.get("excel") != None:
            df = pd.read_excel(request.FILES.get("excel"))

            try:
                for index, row in df.iterrows():
                    product = SupplierProduct(
                        name=row["name"],
                        price=row["price"],
                        quality=row["quality"],
                        description=row["description"],
                        user_id=request.user.id,
                        supplier_id=supplier.id,
                    )
                    product.save()
                messages.info(request, "Product saved")
            except:
                messages.info(
                    request, "Some rows in the excel files contained invalid data"
                )
                pass
        else:
            name = request.POST["name"]
            quality = request.POST["quality"]
            price = request.POST["price"]
            description = request.POST["description"]
            product = SupplierProduct(
                name=name,
                price=price,
                quality=quality,
                description=description,
                user_id=request.user.id,
                supplier_id=supplier.id,
            )

            if request.FILES.get("image") != None:
                product.image = request.FILES.get("image")

            product.save()
            messages.info(request, "Product saved")
        return redirect("supplier:product.index")


@login_required(login_url="signin")
def supplier_product_edit(request, id):
    product = get_object_or_404(SupplierProduct, pk=id)
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

        return redirect("supplier:product.index")


@login_required(login_url="signin")
def supplier_product_delete(request, id):
    SupplierProduct.objects.filter(pk=id).delete()
    return redirect("supplier:product.index")


def supplier_product_show(request, id):
    return HttpResponse("show product")
