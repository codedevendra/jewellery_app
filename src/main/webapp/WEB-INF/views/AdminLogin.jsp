<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Admin Login</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" ></script>
  </head>
  <body>
    <div class="row">
   <div class="col-sm-3" >

   </div>
   <div class="col-sm-6" >

    <h1 class="text-center text-primary mt-4" >Admin Login</h1>

    <c:if test="${param.error ne null}">
        <p style="color:red">${param.error}</p>
    </c:if>

   <form method="post" action="/admin/sendOTP" modelAttribute="login">
    <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">Enter Mobile No.</label>
        <input type="number" id="mobileNumber" name="mobile" class="form-control"  placeholder="Enter Mobile Number">
      </div>
      <button class="btn btn-primary" type="submit">Submit</button>
   </form>

   </div>
   <div class="col-sm-3" >

   </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

    <script>
     function sendOtp(event){
        event.preventDefault();
        var mobile=$("#mobileNumber").val();
        $.ajax({
                url: "/admin/sendOTP",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify({mobile:mobile}),
                success: function (response) {
                    // Handle success
                    //window.location.href="/admin/verifyOtp"
                    
                },
                error: function (xhr, status, error) {
                    // Handle error
                    //window.location.href="/admin/login?error="+xhr.responseJSON.message;
                }
            });
     }
    </script>
  </body>
</html>