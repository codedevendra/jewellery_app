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

.custom-dropdown {
   overflow-y: scroll;
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
            <li class="nav-item dropdown">
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
            </li>
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
              <a href="/admin/home" class="nav-link px-3 active">
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
           <!--  <li>
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
              <a href="/admin/home"  class="nav-link px-3">
                <span class="me-2"><i class="bi bi-graph-up"></i></span>
                <span>Charts</span>
              </a>
            </li>
            <li>
              <a href="#" class="nav-link px-3">
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
          <div class="col-md-12 mb-3">
            <div class="card">
             <div style="display: flex; justify-content: space-between; align-items: center;" class="card-header">
               <span>ADD PRODUCT</span>
    <div style="display: flex; align-items: center;">
        <!-- Button to trigger the modal -->
        <button type="button" class="btn btn-primary" id="openAddCategoryModal">
            Add New Category
        </button>
    </div>
    </div>

              <div class="card-body">
                <div class="table-responsive1">
                
                <!-- Modal -->
 <div class="modal fade" id="addCategoryModal" tabindex="-1" aria-labelledby="addCategoryModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addCategoryModalLabel">Add New Category</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="newCategoryForm">
                    <div class="mb-3">
                        <label for="newCategoryName" class="form-label">Category Name</label>
                        <input type="text" class="form-control" id="newCategoryName" required>
                    </div>
                     <div class="mb-3">
                    <label for="categoryImage" class="form-label">Image</label>
                  <input type="file" class="form-control" name="image" id="categoryImage" accept="image/*">
               
                </div>
                    <button type="button" class="btn btn-primary" id="submitCategoryBtn">Add Category</button>
                </form>
            </div>
        </div>
    </div>
</div> 
                
                  <form id="productForm" onsubmit="addProduct(event)" >
          <div class="mb-3">
              <label for="productName" class="form-label">Product Name</label>
              <input type="text" class="form-control" id="productName" placeholder="Enter product name" required>
          </div>
  
          <div class="mb-3">
              <label for="description" class="form-label">Description</label>
              <textarea class="form-control" id="description" placeholder="Enter product description" rows="3"></textarea>
          </div>
  
          <div class="mb-3">
              <label for="price" class="form-label">Price</label>
              <div class="input-group">
                  <span class="input-group-text">Price (RS)</span>
                  <input type="number" class="form-control" id="price" placeholder="Enter price" step="0.01" required>
              </div>
          </div>
  
          <div class="mb-3">
              <label for="quantity" class="form-label">Quantity</label>
              <input type="number" class="form-control" id="quantity" placeholder="Enter quantity" required>
          </div>
          <div class="mb-3">
               <label for="categorySelect" class="form-label " >Select Category</label>
            <select class="form-control bg-light custom-dropdown" id="categorySelect"   >
               <option value="" selected disabled>Select a category</option>
           </select>
           
            
         </div>
         
        

  
  
          <div class="mb-3">
              <label for="productImage" class="form-label">Product Image</label>
              <input type="file" class="form-control" name="image" id="productImage" accept="image/*">
               
          </div>
									<div
										style="display: flex; justify-content: center; align-items: center;">
										<button type="submit" class="btn btn-primary">Add
											Product</button>
									</div>


								</form>
                
                 
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
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <!--  <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script> -->

    
    <!-- 
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script> -->
    
    
    
    
     
 
 <script type="text/javascript">
 
 
 
 // Function to get URL parameters by name
 function getUrlParameter(name) {
     name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
     var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
     var results = regex.exec(location.search);
     return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
 }
 
 
  function addProduct(event) {
 	 event.preventDefault();
 	 

 	    const file = document.getElementById('productImage').files[0];
 	    var productImage;

         var reader = new FileReader();

         reader.onload = function(event) {
             productImage = event.target.result; // Data URI with base64 encoding
             console.log("productImage  ",productImage);

             callAPI(productImage);

             // Append the image element to a container in the HTML
             
         };

         reader.readAsDataURL(file);

         console.log("productImage 123 ",productImage);
         

 	   
   }
  
  function callAPI(image)
  {
	  const categoryId = document.getElementById('categorySelect').value;
 	 const productName = document.getElementById('productName').value;
	    const description = document.getElementById('description').value;
	    const price = document.getElementById('price').value;
	    const quantity = document.getElementById('quantity').value;
 	 const formData = new FormData();
	    formData.append('image', image); // Use 'image' instead of 'file'
	    formData.append('productName', productName);
	    formData.append('description', description);
	    formData.append('price', price);
	    formData.append('quantityInStock', quantity);
	    formData.append('category', categoryId);

	    $.ajax({
	        url: '/admin/products/add',
	        type: 'POST',
	        data: formData,
	        contentType: false,
	        processData: false,
	        success: function(response) {
	            console.log('API Response:', response);
	            alert(response); 
	            window.location.href="/admin/home";
	        },
	        error: function(xhr, status, error) {
	            console.log('Error:', error);
	            if(xhr.status == 404) {
	                alert('404 - Endpoint not found');
	            } else {
	                alert('Error adding product: ' + xhr.responseText);
	            }
	        }
	    });
 	 
  }
 
 

 
 
 
 
 
 
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

    $(document).ready(function () {
    	
    	  fetch('/all/category')
          .then(response => response.json())
          .then(data => {
              const categorySelect = document.getElementById('categorySelect');
              data.forEach(category => {
                  const option = document.createElement('option');
                  option.value = category.categoryId; // Assuming categoryId is the ID
                  option.textContent = category.categoryName; // Assuming categoryName is the name
                  categorySelect.appendChild(option);
              });
          })
          .catch(error => {
              console.error('Error fetching categories:', error);
          });
    	
    	
    	
    	
    	
    });
    
     function logout(){
    localStorage.removeItem("adminToken");
    window.location.href = "/admin/login";
    }
     
     document.addEventListener('DOMContentLoaded', function () {
    	    const openModalButton = document.getElementById('openAddCategoryModal');
    	    const addCategoryModal = new bootstrap.Modal(document.getElementById('addCategoryModal'));

    	    if (openModalButton && addCategoryModal) {
    	        openModalButton.addEventListener('click', function () {
    	            const modal = new bootstrap.Modal(document.getElementById('addCategoryModal'));
    	            modal.show();
    	        });
    	    }

    	    const submitCategoryBtn = document.getElementById('submitCategoryBtn');
    	    if (submitCategoryBtn) {
    	        submitCategoryBtn.addEventListener('click', function () {
    	           
    	        	 const file = document.getElementById('categoryImage').files[0];
    	       	    var categoryImage;

    	               var reader = new FileReader();

    	               reader.onload = function(event) {
    	            	   categoryImage = event.target.result; // Data URI with base64 encoding
    	                   console.log("categoryImage  ",categoryImage);

    	                   AddCategory(categoryImage,addCategoryModal);

    	                   // Append the image element to a container in the HTML
    	                   
    	               };

    	               reader.readAsDataURL(file);
    	         
    	        });
    	    }
    	});
     
     function AddCategory(image,addCategoryModal)
     {
    	 
    	 const categoryName = document.getElementById('newCategoryName').value;
         
    	 
    	 const formData = new FormData();
 	    formData.append('image', image); // Use 'image' instead of 'file'
 	    formData.append('categoryName', categoryName);
 	    
 	    
 	   $.ajax({
	        url: '/add/category',
	        type: 'POST',
	        data: formData,
	        contentType: false,
	        processData: false,
	        success: function(response) {
	            console.log('API Response:', response);
	            addCategoryModal.hide();
                location.reload();
	            alert(response); 
	            //window.location.href="/admin/home";
	        },
	        error: function(xhr, status, error) {
	            console.log('Error:', error);
	            if(xhr.status == 404) {
	                alert('404 - Endpoint not found');
	            } else {
	                alert('Error adding category: ' + xhr.responseText);
	            }
	        }
	    });
 	  
     }
     
    </script>
  </body>
</html>
