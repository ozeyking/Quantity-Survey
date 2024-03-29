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
    paginator = Paginator(suppliers, 20)
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
    supplier = get_object_or_404(Supplier, pk=id)

    if request.method == "GET":
        owners = User.objects.filter(is_superuser=False)
        return render(
            request, "supplier/edit.html", {"owners": owners, "supplier": supplier}
        )

    elif request.method == "POST":
        supplier.name = request.POST["name"]
        supplier.owner_id = request.POST["owner_id"]
        supplier.description = request.POST["description"]

        if request.FILES.get("image") != None:
            supplier.image = request.FILES.get("image")

        if request.user.id == supplier.user_id:
            supplier.save()
            messages.info(request, "Supplier saved")

        return redirect("supplier:supplier.index")


@login_required(login_url="signin")
def supplier_delete(request, id):
    Supplier.objects.filter(pk=id).delete()
    return redirect("supplier:supplier.index")


@login_required(login_url="signin")
def supplier_show(request, id):
    supplier = get_object_or_404(Supplier, pk=id)
    products = SupplierProduct.objects.filter(supplier_id=id).all()

    return render(
        request, "supplier/show.html", {"supplier": supplier, "products": products}
    )


@login_required(login_url="signin")
def supplier_product_index(request):
    products = SupplierProduct.objects.filter(user_id=request.user.id).order_by("-id")
    paginator = Paginator(products, 10)
    page_number = request.GET.get("page")
    page_object = paginator.get_page(page_number)

    return render(request, "product/index.html", {"page_object": page_object})


@login_required(login_url="signin")
def supplier_product_create(request):
    suppliers = Supplier.objects.filter(owner_id=request.user.id).all()
    if request.method == "GET":
        return render(request, "product/create.html", {"suppliers": suppliers})

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
                    request, "Some rows in the excel file contain invalid data"
                )
                pass
        else:
            name = request.POST["name"]
            quality = request.POST["quality"]
            price = request.POST["price"]
            supplier_id = request.POST["supplier"]
            description = request.POST["description"]
            product = SupplierProduct(
                name=name,
                price=price,
                quality=quality,
                description=description,
                user_id=request.user.id,
                supplier_id=supplier_id,
            )

            if request.FILES.get("image") != None:
                product.image = request.FILES.get("image")

            product.save()
            messages.info(request, "Product saved")
        return redirect("supplier:product.index")


@login_required(login_url="signin")
def supplier_product_edit(request, id):
    product = get_object_or_404(SupplierProduct, pk=id)
    suppliers = Supplier.objects.filter(owner_id=request.user.id).all()
    if request.method == "GET":
        return render(
            request, "product/edit.html", {"product": product, "suppliers": suppliers}
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
