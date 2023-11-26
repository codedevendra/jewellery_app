<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--     <link rel="stylesheet" href="css/bootstrap.min.css" />
 -->    
 <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
    />
<!--     <link rel="stylesheet" href="css/dataTables.bootstrap5.min.css" />
 -->    
<!--       <link rel="stylesheet" href="css/style.css" />

 -->      
 <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">
      
      
      <style type="text/css">
      
      @import url("https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap");
body,
button {
  font-family: "Inter", sans-serif;
}
:root {
  --offcanvas-width: 200px;
  --topNavbarHeight: 56px;
}
.sidebar-nav {
  width: var(--offcanvas-width);
}
.sidebar-link {
  display: flex;
  align-items: center;
}
.sidebar-link .right-icon {
  display: inline-flex;
}
.sidebar-link[aria-expanded="true"] .right-icon {
  transform: rotate(180deg);
}
@media (min-width: 992px) {
  body {
    overflow: auto !important;
  }
  main {
    margin-left: var(--offcanvas-width);
  }
  /* this is to remove the backdrop */
  .offcanvas-backdrop::before {
    display: none;
  }
  .sidebar-nav {
    -webkit-transform: none;
    transform: none;
    visibility: visible !important;
    height: calc(100% - var(--topNavbarHeight));
    top: var(--topNavbarHeight);
  }
}


.offcanvas-start {
 
    left: 0;
    border-right: 1px solid rgba(0,0,0,.2);
}
      
      
      </style>
      
      
    <title>Kusum Jewellers Admin Dashboard Template</title>
  </head>
  <body>
    <!-- top navigation bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container-fluid">
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="offcanvas"
          data-bs-target="#sidebar"
          aria-controls="offcanvasExample"
        >
          <span class="navbar-toggler-icon" data-bs-target="#sidebar"></span>
        </button>
        <a
          class="navbar-brand me-auto ms-lg-0 ms-3 text-uppercase fw-bold"
          href="#"
          >Kusum Jewellers</a
        >
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#topNavBar"
          aria-controls="topNavBar"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="topNavBar">
          <form class="d-flex ms-auto my-3 my-lg-0">
            <div class="input-group">
              <input
                class="form-control"
                type="search"
                placeholder="Search"
                aria-label="Search"
              />
              <button class="btn btn-primary" type="submit">
                <i class="bi bi-search"></i>
              </button>
            </div>
          </form>
          
          <ul class="navbar-nav">
           <!--  <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle ms-2"
                href="#"
                role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                <i class="bi bi-person-fill"></i>
              </a>
              <ul class="dropdown-menu dropdown-menu-end">
                <li><a class="dropdown-item" href="#">Action</a></li>
                <li><a class="dropdown-item" href="#">Another action</a></li>
                <li>
                  <a class="dropdown-item" href="#">Something else here</a>
                </li>
              </ul>
            </li> -->
					<div class="dropdown">
						
							
							 <a
                class="nav-link dropdown-toggle ms-2"
                href="#"
                id="dropdownMenuButton" 
                role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                <i class="bi bi-person-fill"></i>
              </a>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<a class="dropdown-item" href="#">Action</a> <a
								class="dropdown-item" href="#">Another action</a> <a
								class="dropdown-item" href="#">Something else here</a>
						</div>
					</div>
				</ul>
        </div>
      </div>
    </nav>
    <!-- top navigation bar -->
    <!-- offcanvas -->
    <div
      class="offcanvas offcanvas-start sidebar-nav bg-dark"
      tabindex="-1"
      id="sidebar"
      
      
    >
      <div class="offcanvas-body p-0">
        <nav class="navbar-dark">
          <ul class="navbar-nav">
            <li>
              <div class="text-muted small fw-bold text-uppercase px-3">
                CORE
              </div>
            </li>
            <li>
              <a  href="/admin/home"class="nav-link px-3 active">
                <span class="me-2"><i class="bi bi-speedometer2"></i></span>
                <span>Dashboard</span>
              </a>
            </li>
            <li class="my-4"><hr class="dropdown-divider bg-light" /></li>
            <li>
              <div class="text-muted small fw-bold text-uppercase px-3 mb-3">
               Services
              </div>
            </li>
           
            <li>
              <a href="/admin/add-product" class="nav-link px-3">
                <span class="me-2"><i class="bi bi-calendar-plus"></i></span>
                <span>Add Product</span>
              </a>
            </li>
         <!--    <li>
              <a href="#" class="nav-link px-3">
                <span class="me-2"><i class="bi bi-book-fill"></i></span>
                <span>Edit Product</span>
              </a>
            </li> -->
            <li>
              <a href="#" class="nav-link px-3">
                <span class="me-2"><i class="bi bi-patch-plus-fill"></i></span>
                <span>Settings</span>
              </a>
            </li>
            <li class="my-4"><hr class="dropdown-divider bg-light" /></li>
            <li>
              <div class="text-muted small fw-bold text-uppercase px-3 mb-3">
                Addons
              </div>
            </li>
            <li>
              <a href="/admin/home" class="nav-link px-3">
                <span class="me-2"><i class="bi bi-graph-up"></i></span>
                <span>Charts</span>
              </a>
            </li>
            <li>
              <a href="#productTable" class="nav-link px-3">
                <span class="me-2"><i class="bi bi-table"></i></span>
                <span>Prodcut List</span>
              </a>
            </li>
            
            <li>
              <a onclick="logout();" class="nav-link px-3">
                <span class="me-2"><i class="bi bi-box-arrow-right"></i></span>
                
                
                <span>Logout</span>
              </a>
            </li>
            
          </ul>
        </nav>
      </div>
    </div>
    <!-- offcanvas -->
    <main class="mt-5 pt-3">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <h4>Dashboard</h4>
          </div>
        </div>
        <div class="row">
          <div class="col-md-3 mb-3">
            <div class="card bg-primary text-white h-100">
              <div class="card-body py-5">100</div>
              <div class="card-footer d-flex">
                No of Orders
                <span class="ms-auto">
                  <i class="bi bi-chevron-right"></i>
                </span>
              </div>
            </div>
          </div>
          <div class="col-md-3 mb-3">
            <div class="card bg-warning text-dark h-100">
              <div class="card-body py-5">500</div>
              <div class="card-footer d-flex">
                No of. Users
                <span class="ms-auto">
                  <i class="bi bi-chevron-right"></i>
                </span>
              </div>
            </div>
          </div>
          <div class="col-md-3 mb-3">
            <div class="card bg-success text-white h-100">
              <div class="card-body py-5">67</div>
              <div class="card-footer d-flex">
                Order Pending
                <span class="ms-auto">
                  <i class="bi bi-chevron-right"></i>
                </span>
              </div>
            </div>
          </div>
          <div class="col-md-3 mb-3">
            <div class="card bg-danger text-white h-100">
              <div class="card-body py-5">45</div>
              <div class="card-footer d-flex">
                Today Orders
                <span class="ms-auto">
                  <i class="bi bi-chevron-right"></i>
                </span>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 mb-3">
            <div class="card h-100">
              <div class="card-header">
                <span class="me-2"><i class="bi bi-bar-chart-fill"></i></span>
                Area Chart Example
              </div>
              <div class="card-body">
                <canvas class="chart" width="400" height="200"></canvas>
              </div>
            </div>
          </div>
          <div class="col-md-6 mb-3">
            <div class="card h-100">
              <div class="card-header">
                <span class="me-2"><i class="bi bi-bar-chart-fill"></i></span>
                Area Chart Example
              </div>
              <div class="card-body">
                <canvas class="chart" width="400" height="200"></canvas>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 mb-3">
            <div class="card">
              <div class="card-header">
                <span><i class="bi bi-table me-2"></i></span> Data Table
              </div>
              <div class="card-body">
                <div class="table-responsive1">
                
                
                  <table
                    id="productTable"
                    class="table table-striped data-table"
                    style="width: 100%"
                  >
                    <thead>
            <tr>
                <th >#</th>
                <th >Product Name</th>
                <th >Price</th>
                <th >Image</th>
                <th>Description</th>
                               <th scope="col" style="margin-left: 30px;">Actions</th>
             </tr>
        </thead>
        <tbody></tbody>
                    
                    
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
<!--     <script src="./js/bootstrap.bundle.min.js"></script>
 -->    
     <script src="https://cdn.jsdelivr.net/npm/chart.js@3.0.2/dist/chart.min.js"></script>
     
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
     
   <!--  <script src="./js/jquery-3.5.1.js"></script> -->
   
   <!--  <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script> -->
   
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



    
    <!-- 
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script> -->
    
    
    
    
     
 
 <script type="text/javascript">
 
 
 $(document).ready(function() {
     const adminToken = localStorage.getItem("adminToken");

     /* if (adminToken==null) {
       window.location.href = "/admin/login";
     } else { */
   	
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
                     //'<button type="button" style="margin-left: 15px;" class="btn btn-primary edit-button" data-product-id="' + product.productId + '">Edit</button>' +
                        '<a class="edit edit-button" style="margin-left: 15px;" title="Edit" data-toggle="tooltip" data-product-id="' + product.productId + '"><i class="material-icons">&#xE254;</i></a>' +
                         '<a class="delete delete-button" style="margin-left: 45px;" title="Delete" data-toggle="tooltip" data-product-id="' + product.productId + '"><i class="material-icons">&#xE872;</i></a>'

                     //'<button type="button" style="margin-left: 45px;" class="btn btn-danger delete-button" data-product-id="' + product.productId + '">Delete</button>' +
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
     //}
    
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
 
 
 
 
 
 
 
    const charts = document.querySelectorAll(".chart");

    charts.forEach(function (chart) {
      var ctx = chart.getContext("2d");
      var myChart = new Chart(ctx, {
        type: "bar",
        data: {
          labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
          datasets: [
            {
              label: "# of Votes",
              data: [12, 19, 3, 5, 2, 3],
              backgroundColor: [
                "rgba(255, 99, 132, 0.2)",
                "rgba(54, 162, 235, 0.2)",
                "rgba(255, 206, 86, 0.2)",
                "rgba(75, 192, 192, 0.2)",
                "rgba(153, 102, 255, 0.2)",
                "rgba(255, 159, 64, 0.2)",
              ],
              borderColor: [
                "rgba(255, 99, 132, 1)",
                "rgba(54, 162, 235, 1)",
                "rgba(255, 206, 86, 1)",
                "rgba(75, 192, 192, 1)",
                "rgba(153, 102, 255, 1)",
                "rgba(255, 159, 64, 1)",
              ],
              borderWidth: 1,
            },
          ],
        },
        options: {
          scales: {
            y: {
              beginAtZero: true,
            },
          },
        },
      });
    });


   
    function logout() {
        fetch('/admin/logout', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                // Add any other necessary headers here
            },
            // You can include a body if needed
            // body: JSON.stringify({ /* Your data here */ })
        })
        .then(response => {
            if (response.ok) {
                // Success message or redirect to a login page, etc.
                console.log('Logged out successfully');
                window.location.href = "/admin/login";
            } else {
                // Handle error cases
                console.error('Failed to logout');
            }
        })
        .catch(error => { 
            console.error('Error:', error);
        });
    }


    
    </script>
  </body>
</html>
