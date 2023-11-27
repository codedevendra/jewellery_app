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
    <div class="card-body p-5">
      <h3 class="mb-4 text-center">Verify OTP</h3>
      <form  id="otpFormm">
        <div class="form-group">
          <label for="otp">Enter OTP</label>
          <input type="text" class="form-control" id="otp" placeholder="Enter the OTP received" required>
        </div>
        <button type="submit" class="btn btn-custom btn-block">Verify</button>
        <p class="mt-3 text-center">Didn't receive OTP? <a href="#">Resend OTP</a></p>
      </form>
    </div>
  </div>

  <!-- Bootstrap JS and dependencies -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
  <script>
  $(document).ready(function() {
	    $('#otpFormm').submit(function(event) {
	    	verifyOtp(event); // Call the sendOtp function when the form is submitted
	    });
	  });
  
     function verifyOtp(event){
        event.preventDefault();
        var otp=$("#otp").val();

        $.ajax({
                url: "/admin/verify/otp",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify({otp:otp}),
                success: function (response) {
                	
                   localStorage.setItem("adminToken", response.token);
                   window.location.href = "/user/home";
                   
                },
                error: function (xhr, status, error) {
                   alert(xhr.responseJSON.error);
                }
            });

     }
     
      </script>
</body>
</html>
