<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Fill Details</title>
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
<body>
  <div class="container py-4">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <h1 class="text-center mb-3">Welcome</h1>
        <h4 class="text-center mb-4">Fill the details & complete your profile</h4>
        <form>
          <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" id="name" placeholder="Enter your name" required>
          </div>
          <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" placeholder="Enter your email" required>
          </div>
          <div class="form-group">
            <label for="referenceCode">Reference code</label>
            <input type="text" class="form-control" id="referenceCode" placeholder="Enter reference code">
          </div>
          <div class="text-center">
            <button type="submit" class="btn btn-custom mr-2">Ok</button>
            <button type="button" class="btn btn-secondary ml-2">Skip</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <!-- Bootstrap JS and dependencies -->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</body>
</html>
