<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Admin Home</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" ></script>
  </head>
  <body>
  
  <div class="container mt-4">
  <h1>Welcome to the Admin Panel</h1>
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
  <table class="table table-striped">
    <thead>
      <tr>
        <th scope="col">#</th>
        <th scope="col">Product Name</th>
        <th scope="col">Price</th>
        <th scope="col">Image</th>
         <th scope="col">Description</th>
        <th scope="col">Actions</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th scope="row">1</th>
        <td>Gold Necklace</td>
        <td>$499.99</td>
        <td><img src="https://www.digigold.com/media/original/public/product/V9dZUzCdqOaWstRcuqAsk7EsdDqHuRg6ITlFPU9v.png" alt="Gold Necklace" style="max-width: 100px;"></td>
        <td>DG 2 Gram Gold Coin 24k (99.9%)</td>
        <td>
          <button type="button" class="btn btn-primary">Edit</button>
          <button type="button" class="btn btn-danger">Delete</button>
        </td>
      </tr>
      <!-- Add more rows for other gold products -->
    </tbody>
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
      }
    });
  </script>

  </body>