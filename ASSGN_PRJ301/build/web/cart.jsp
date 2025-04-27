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
        <title>Shopping Cart</title>
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

        <!-- Product section-->
        <section class="py-5">
            <div class="container" style="min-height: 1000px">
                <c:choose>
                    <c:when test="${sessionScope.carts==null||sessionScope.carts.size()==0}">
                        <h1>List Cart is Empty</h1>
                    </c:when>
                    <c:otherwise>
                        <h3>List Products</h3>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">ProductID</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Total Price</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                               
                                <c:forEach items="${carts}" var="c">
                                <form action="update-quantity">
                                    <tr>
                                    <input type="hidden" name="productId" value="${c.value.product.id}"/>
                                    <th scope="row">${c.value.product.id}</th>
                                    <td>${c.value.product.name}</td>
                                    <td><img src="${c.value.product.imageUrl}" width="50"/></td>
                                    <td>${c.value.product.price}</td>
                                    <td><input onchange="this.form.submit()" type="number" name="quantity" value="${c.value.quantity}"/></td>
                                    <td>${c.value.product.price*c.value.quantity}</td>
                                    <td><a href="delete-cart?productId=${c.value.product.id}" class="btn btn-outline-danger">Remove</a></td>
                                    </tr>
                                </form>
                                    
                            </c:forEach>
                            </tbody>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><form action="removeAllFromCart" method="post">
                                    <input type="submit" value="Remove All" class="btn btn-outline-danger">
                                 
                                </form></td>
                        </table>
<!--                        <form action="deleteitems" method="get">
                            <td><input type="number" name="quantity_to_delete"><input type="submit" class="btn btn-outline-danger" value="Remove"></td>
                        </form>-->
                        <h3>Grand Total: ${totalMoney}$</h3>
                        <a href="checkout" class="btn btn-success w-25">Check out</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </section>
        <%@include file="components/footerComponent.jsp" %>
    </body>
</html>
