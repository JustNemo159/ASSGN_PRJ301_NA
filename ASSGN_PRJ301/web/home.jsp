<%-- 
    Document   : home
    Created on : Jun 23, 2023, 10:40:01 AM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Phone Shop</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
            rel="stylesheet"
            />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <%@include file="components/navBarComponent.jsp" %>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-w
                     hite">
                    <h1 class="display-4 fw-bolder" style="color: white">Phone Shop</h1>
                    <p class="lead fw-normal text-white-50 mb-0">
                    </p>
                </div>
            </div>
        </header>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row">
                    <div class="col-md-3 mb-5">
                        <h3>List Categories</h3>
                        <ul class="list-group category_block">
                            <c:forEach items="${listCategories}" var="C">
                                <li class="list-group-item text-white ${tag == C.cid? "active":""}"><a href="category?categoryId=${C.cid}">${C.cname}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                    <div class="col-md-9">
                        <h3>List Products</h3>
                        <div style="text-align:center">
                            <form action="sort" method="post" id="sx">
                                <label>Sort Price :</label>
                                <select name="sort" onchange="change()">
                                    <option></option>
                                    <option value="0">High to Low</option>
                                    <option value="1">Low to High</option>
                                </select>
                                <script>
                                    function  change() {
                                        document.getElementById("sx").submit();
                                    }
                                </script>
                            </form>
                        </div>
                        <div
                            class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 justify-content-center"
                            >
                            <c:forEach items="${listProducts}" var="P">
                                <div class="col mb-5">
                                    <div class="card h-100">
                                        <!-- Sale badge-->
                                        <!-- Product image-->
                                        <a href="detail?productId=${P.id}">
                                            <img
                                                class="card-img-top"
                                                src="${P.imageUrl}"
                                                alt="..."
                                                />
                                        </a>
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                                <h5 class="fw-bolder">${P.name}</h5>
                                                <!-- Product reviews-->
                                                <div
                                                    class="d-flex justify-content-center small text-warning mb-2"
                                                    >
                                                    <div class="bi-star-fill">${P.tiltle}</div>

                                                </div>
                                                <!-- Product price-->

                                                $${P.price}
                                            </div>
                                        </div>
                                        <!-- Product actions-->
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center">
                                                <a class="btn btn-outline-dark mt-auto" href="add-to-cart?productId=${P.id}"
                                                   >Add to cart</a
                                                >
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="components/footerComponent.jsp" %>
    </body>
</html>
