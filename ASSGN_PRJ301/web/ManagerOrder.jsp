

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manager Order</title>

        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/ManagerProduct.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
        <script>
            function back() {
                window.location.href = "home";
            }
            function doDelete(id)
            {
                var c = confirm("Are you sure to delete?");
                if (c)
                {
                    window.location.href = "deleteOrder?OrdId=" + id;
                }
            }
        </script>

    <body>

        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Order</b></h2>
                        </div>

                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>

                            <th>ID</th>
                            <th>AccountId</th>
                            <th>TotalPrice</th>
                            <th>CreatedDate</th>
                            <th>ShippingId</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${orders}" var="p">
                            <tr>
                                <td> <a href="orderDetail?orderID=${p.getId()}">${p.getId()}</a></td>
                                <td>${p.getAccountId()}</td>
                                <td>${p.getTotalPrice()} $</td>
                                <td>${p.getCreatedDate()} </td>
                                <td>${p.getShippingId()} </td>
                                <td>${p.getStatus()}</td>
                                <td>
                                    <a href="loadOrder?OrdId=${p.getId()}"  class="edit" data-toggle="modal">Update</a>
                                </td>
                                <td><a href="deleteOrder?OrdId=${p.getId()}" class="delete" data-toggle="modal">Delete</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
<!--                <div>
                    <form action="view" method="post">
                        <select name="status">
                            <option value="wait">wait</option>
                            <option value="process">process</option>
                            <option vaue="done">done</option>
                        </select>
                        <td><input type="submit" class="btn btn-outline-danger" value="Submit"></td>
                    </form>
                </div>
            </div>-->
            <a href="#">
                <button type="button" class="btn btn-primary" onclick="back()">Back to home</button>

        </div>
        <!-- Edit Modal HTML -->
        <!--        <div id="addEmployeeModal" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="add" method="post">
                                <div class="modal-header">						
                                    <h4 class="modal-title">Add Product</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                </div>
                                <div class="modal-body">					
                                    <div class="form-group">
                                        <label>Name</label>
                                        <input name="name" type="text" class="form-control" required >
                                    </div>
                                    <div class="form-group">
                                        <label>Image</label>
                                        <input name="image" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Price</label>
                                        <input name="price" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Title</label>
                                        <textarea name="title" class="form-control" required></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>Description</label>
                                        <textarea name="description" class="form-control" required></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>Category</label>
                                        <select name="category" class="form-select" aria-label="Default select example">
        <c:forEach items="${listCategories}" var="o">
            <option value="${o.cid}">${o.cname}</option>
        </c:forEach>
    </select>
</div>

</div>
<div class="modal-footer">
<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
<input type="submit" class="btn btn-success" value="Add">
</div>
</form>
</div>
</div>
</div>-->





        <script src="js/ManagerProduct.js" type="text/javascript"></script>
    </body>
</html>



<script src="js/ManagerProduct.js" type="text/javascript"></script>
</body>
</html>


