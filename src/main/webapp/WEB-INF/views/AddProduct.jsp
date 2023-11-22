<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Add Product</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" ></script>
  </head>
  <body>

    <div class="container mt-5">
      <h2 class="mb-4">Add Product</h2>
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
              <label for="productImage" class="form-label">Product Image</label>
              <input type="file" class="form-control" id="productImage" accept="image/*">
          </div>

          <button type="submit" class="btn btn-primary">Add Product</button>
      </form>
  </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

    <script>
     function addProduct(event) {
        event.preventDefault();
          // Collect form data
          const productName = document.getElementById('productName').value;
          const description = document.getElementById('description').value;
          const price = document.getElementById('price').value;
          const quantity = document.getElementById('quantity').value;
          const productImage = document.getElementById('productImage').files[0]; // For file input
  
          // Prepare form data
          const formData = new FormData();
          formData.append('file', productImage);
          formData.append('product', JSON.stringify({
            productName: productName,
            description: description,
            price: price,
            quantityInStock: quantity
          }));
  
          // Make API call using fetch
          $.ajax({
            url: '/admin/add/product',
            type: 'POST',
            data: formData,
            contentType: false, // Important: prevent jQuery from setting the Content-Type
            processData: false, // Important: prevent jQuery from processing the data
            success: function (data) {
                // Handle the API response
                console.log('API Response:', data);
            },
            error: function (error) {
                // Handle errors
                console.error('Error:', error);
            }
        });
      }
  </script>

  </body>
</html>