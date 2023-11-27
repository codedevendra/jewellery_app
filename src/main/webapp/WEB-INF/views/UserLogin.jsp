<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login Page</title>
  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    /* Optional styling */
    /* Custom button color */
    .btn-custom {
      background-color: #B58B00;
      border-color: #B58B00;
      border-radius: 25px; /* Making the button round */
    }
    .btn-custom:hover {
      background-color: #A17800; /* Adjust hover color if needed */
      border-color: #A17800;
    }
  </style>
</head>
<body class="d-flex justify-content-center align-items-center" style="height: 100vh;">
  <div class="card shadow-2-strong" style="border-radius: 1rem; width: 400px;">
    <div class="card-body p-5 text-center">
      <h1 class="mb-4">Kusum</h1>
      <form id="otpForm">
         <div class="form-group text-left"> <!-- Set text alignment to left -->
          <label for="mobileNumber">Enter Mobile Number</label>
          <input type="tel" class="form-control" id="mobileNumber" placeholder="Enter your mobile number" required>
        </div>
        <button type="submit" class="btn btn-custom btn-block">Send OTP</button>
      </form>
    </div>
  </div>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  <!-- Bootstrap JS and dependencies -->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
  <script>
  
  $(document).ready(function() {
	    $('#otpForm').submit(function(event) {
	      sendOtp(event); // Call the sendOtp function when the form is submitted
	    });
	  });
     function sendOtp(event){
    	 
        event.preventDefault();
        var mobile=$("#mobileNumber").val();
        $.ajax({
                url: "/user/sendOTP",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify({mobile:mobile}),
                success: function (response) {
                    // Handle success
                   window.location.href="/user/verifyOtp"
                    
                },
                error: function (xhr, status, error) {
                    // Handle error
                    window.location.href="/user/login?error="+xhr.responseJSON.message;
                }
            });
     }
    </script>
</body>
</html>
