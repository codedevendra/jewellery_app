
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Edit Product</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" ></script>
  </head>
  <body>
    
    <div class="container mt-5">
      <h2 class="mb-4">Edit Product</h2>
      <form id="productForm" onsubmit="addProduct(event)" >
          <div class="mb-3">
              <label for="productName" class="form-label">Product Name</label>
              <input type="text" class="form-control" id="productName" value=${produuct.productName} placeholder="Enter product name" required>
          </div>
  
          <div class="mb-3">
              <label for="description" class="form-label">Description</label>
               <textarea class="form-control" id="description" placeholder="Enter product description">${produuct.description}</textarea>
          </div>
  
          <div class="mb-3">
              <label for="price" class="form-label">Price</label>
              <div class="input-group">
                  <span class="input-group-text">Price (RS)</span>
                  <input type="number" class="form-control" id="price"  value=${produuct.price}  placeholder="Enter price" step="0.01" required>
              </div>
          </div>
  
          <div class="mb-3">
              <label for="quantity" class="form-label">Quantity</label>
              <input type="number" class="form-control" id="quantity"  value=${produuct.quantityInStock} placeholder="Enter quantity" required>
          </div>
  
          <div class="mb-3">
          <img src=${produuct.image} width=200  >
              <label for="productImage" class="form-label">Product Image</label>
              <input type="file" class="form-control" name="image" id="productImage" accept="image/*">
               
          </div>
  
          <button type="submit" class="btn btn-primary">Edit Product</button>
      </form>
  </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    
    <script>
    
   /*  $(document).ready(function() {
        var productId = getUrlParameter('id');
        console.log("called");
        if (productId) {
            // Editing an existing product
            $.ajax({
                url: '/admin/' + productId' + productId, // Replace with your API endpoint URL
                type: 'GET',
                success: function(product) {
                    // Populate form fields with retrieved product details
                    $('#productName').val(product.productName);
                    $('#productPrice').val(product.price);
                    // Populate other fields similarly...
                },
                error: function(error) {
                    console.error('Error:', error);
                }
            });
        }
    });
 */
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
  </script>
  
  </body>
</html>