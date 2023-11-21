<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Admin Home</title>
      <style>
        /* Add custom styles here */
        body {
            background-color: #f8f9fa;
            color: #333;
        }

        .navbar {
            background-color: #fff;
            border-bottom: 1px solid #ddd;
        }

        .navbar-brand {
            font-weight: bold;
            color: #333;
        }

        .navbar-toggler-icon {
            background-color: #333;
        }

        .nav-link {
            color: #333;
        }

        .nav-link:hover {
            color: #666;
        }

        .table th,
        .table td {
            vertical-align: middle;
        }

        .table th {
            background-color: #343a40;
            color: #fff;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f8f9fa;
        }

        .edit-button {
            margin-right: 5px;
            background-color: #007bff;
            color: #fff;
            border: 1px solid #007bff;
        }

        .edit-button:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        .delete-button {
            background-color: #dc3545;
            color: #fff;
            border: 1px solid #dc3545;
        }

        .delete-button:hover {
            background-color: #bb2d3b;
            border-color: #bb2d3b;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" ></script>
  </head>
  <body>
  
  <div class="container mt-4">
  <h1 style="text-align: center;">Welcome to the Admin Panel</h1>
<!--   <p>Manage users, settings, and products.</p>
 -->
  <!-- Users Table (Previous content) -->

  <!-- Product Table -->
 <!--  <h2>Products</h2> -->
  <!-- Existing Products Table (Previous content) -->

 
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Admin Panel</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
      <!--   <li class="nav-item">
          <a class="nav-link" href="#">Dashboard</a>
        </li> -->
        <li class="nav-item">
          <a class="nav-link" href="/admin/add-product">Add Product</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Settings</a>
        </li>
        <!-- Add more navigation links as needed -->
      </ul>
    </div>
    <div class="navbar-nav ms-auto">
      <a class="nav-link" href="/admin/logout">Logout</a>
    </div>
  </div>
</nav>
 <!-- Gold Products Table -->
  <h2>Gold Products</h2>
  
    <table id="productTable" class="table table-striped">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Product Name</th>
                <th scope="col">Price</th>
                <th scope="col">Image</th>
                <th scope="col">Description</th>
                <th scope="col" style="margin-left: 15px;">Actions</th>
            </tr>
        </thead>
        <tbody></tbody>
    </table>

  <!-- Add Gold Product Form with Image Upload -->
</div>
  
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<script>
    $(document).ready(function() {
      const adminToken = localStorage.getItem("adminToken");

      if (adminToken==null) {
        window.location.href = "/admin/login";
      } else {
    	
              $.ajax({
                  url: '/admin/gold-products', // Replace with your API endpoint URL
                  type: 'GET',
                  success: function(data) {
                      bindProductsToTable(data);
                  },
                  error: function(error) {
                      console.error('Error:', error);
                  }
              });
          

          // Function to bind products to table
          function bindProductsToTable(products) {
              var tableBody = $('#productTable tbody');
              tableBody.empty(); // Clear existing table rows

              $.each(products, function(index, product) {
                  var row = '<tr>' +
                      '<th scope="row">' + (index + 1) + '</th>' +
                      '<td>' + product.productName + '</td>' +
                      '<td>' + product.price + '</td>' +
                      '<td><img src="' + product.image + '" alt="Product Image" style="max-width: 100px;"></td>' +
                      '<td>' + product.description + '</td>' +
                      '<td>' +
                      '<button type="button" style="margin-left: 15px;" class="btn btn-primary edit-button" data-product-id="' + product.productId + '">Edit</button>' +

                      '<button type="button" style="margin-left: 45px;" class="btn btn-danger delete-button" data-product-id="' + product.productId + '">Delete</button>' +
                      '</td>' +
                      '</tr>';
                  tableBody.append(row);
              });
              
              
           // Add click event listener to the "Edit" button
              $('.edit-button').click(function() {
                  var productId = $(this).data('product-id');
                  getProductById(productId);
              });
          }
      
          // Add click event listener to the "Delete" button
          $('.delete-button').click(function() {
              var productId = $(this).data('product-id');
              console.log("productId",productId);
              deleteProductById(productId);
          });
      }
     
      $(document).on('click', '.delete-button', function() {
	        var productId = $(this).data('product-id');
	        console.log("productId", productId);
	        deleteProductById(productId);
	    });
      
     
          function getProductById(productId) {
        	    window.location.href="/admin/product/"+productId;
        	}
          
          
          function deleteProductById(productId)
          {
        	  var confirmDelete = confirm('Are you sure you want to delete this product?');
              if (!confirmDelete) {
                  return; // Cancel deletion if not confirmed
              }
              
              // Make DELETE request to the API endpoint
              $.ajax({
                  url: '/admin/delete/' + productId,
                  type: 'DELETE',
                  success: function(response) {
                      console.log('Product deleted:', response);
                      alert("Product deleted: SuccessFully!!");
                      // Optionally, update the UI or perform any additional actions
                      location.reload();
                  },
                  error: function(error) {
                      console.error('Error deleting product:', error);
                      // Handle error or display a message to the user
                  }
              });
        
          }
          
    });
  </script>

  </body>