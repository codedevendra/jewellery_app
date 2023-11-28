<!DOCTYPE html>
<html>
<head>
  <title>Registration Form</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    .container {
        width: 75%;
        margin: auto;
    }
    .rounded-btn {
        border-radius: 20px;
        background-color: darkgoldenrod;
        color: white;
    }
    .back-btn {
        position: absolute;
        top: 20px;
        left: 20px;
        font-size: 1.5em;
        text-decoration: none;
        color: #000; /* Adjust color if needed */
    }
  </style>
</head>
<body>
  <div class="container mt-4">
  
    <div class="card">
      <div class="card-body">
        <div class="card-header">
           <a href="/user/home" class="back-btn text-dark"><i class="bi bi-arrow-left"></i></a>
        
          <h5 class="card-title text-center">Fill the details and complete your profile</h5>
        </div>

        <form id="registrationForm" onsubmit="return validateForm()">
          <div class="form-group">
            <label for="inputName">Name</label>
            <input type="text" class="form-control" id="inputName" placeholder="Your Name" required>
          </div>
          <div class="form-group">
            <label for="inputEmail">Email</label>
            <input type="email" class="form-control" id="inputEmail" placeholder="Your Email" required>
          </div>
          <div class="form-group">
            <label for="inputMobile">Mobile Number</label>
            <input type="tel" class="form-control" id="inputMobile" placeholder="Your Mobile Number" required>
          </div>
          <div class="form-group">
            <label for="inputAddress">Address</label>
            <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St" required>
          </div>
          <div class="form-row">
            <div class="form-group col-md-6">
              <label for="inputCity">City</label>
              <input type="text" class="form-control" id="inputCity" required>
            </div>
            <div class="form-group col-md-6">
              <label for="inputPincode">Pincode</label>
              <input type="text" class="form-control" id="inputPincode" placeholder="Pincode" required>
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-6">
              <label for="inputPAN">Enter PAN number</label>
              <input type="text" class="form-control" id="inputPAN" placeholder="Your PAN number" required>
            </div>
            <div class="form-group col-md-6">
              <label for="pancardUpload">Click to upload Pancard</label>
              <input type="file" class="form-control-file" id="pancardUpload">
            </div>
          </div>
          <div class="text-center"> <!-- Centering the buttons -->
            <button type="submit" class="btn btn-primary rounded-btn mr-2">Update</button>
          </div>
        </form>

      </div>
    </div>
  </div>

  <!-- Bootstrap JS (jQuery and Popper.js are required for Bootstrap) -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

  <script>
    function validateForm() {
      var name = document.getElementById('inputName').value;
      var email = document.getElementById('inputEmail').value;
      var mobile = document.getElementById('inputMobile').value;
      var address = document.getElementById('inputAddress').value;
      var city = document.getElementById('inputCity').value;
      var pincode = document.getElementById('inputPincode').value;
      var pan = document.getElementById('inputPAN').value;

      if (!name || !email || !mobile || !address || !city || !pincode || !pan) {
        alert('Please fill out all required fields');
        return false;
      }

      // Add more specific validation logic if needed for fields like email, mobile number, PAN, etc.

      return true;
    }

   
  </script>
</body>
</html>
