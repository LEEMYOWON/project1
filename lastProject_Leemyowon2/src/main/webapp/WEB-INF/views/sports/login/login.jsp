<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
//Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
<style>
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content h1{
  height: 100px;
  width: 100%;
  font-size: 18px;
  background: #37c386;
  color: white;
  line-height: 150%;
  border-radius: 3px 3px 0 0;
  box-shadow: 0 2px 5px 1px rgba(0, 0, 0, 0.2);
}

.modal-content form {
  box-sizing: border-box;
  width: 260px;
  margin: 100px auto 0;
  box-shadow: 2px 2px 5px 1px rgba(0, 0, 0, 0.2);
  padding-bottom: 40px;
  border-radius: 3px;
}
.modal-content form h1 {
  box-sizing: border-box;
  padding: 20px;
}

.modal-content input {
  margin: 40px 25px;
  width: 200px;
  display: block;
  border: none;
  padding: 10px 0;
  border-bottom: solid 1px #1abc9c;
  -webkit-transition: all 0.3s cubic-bezier(0.64, 0.09, 0.08, 1);
          transition: all 0.3s cubic-bezier(0.64, 0.09, 0.08, 1);
  background: -webkit-linear-gradient(top, rgba(255, 255, 255, 0) 96%, #1abc9c 4%);
  background: linear-gradient(to bottom, rgba(255, 255, 255, 0) 96%, #1abc9c 4%);
  background-position: -200px 0;
  background-size: 200px 100%;
  background-repeat: no-repeat;
  color: #0e6252;
}
.modal-content input:focus, input:valid {
  box-shadow: none;
  outline: none;
  background-position: 0 0;
}
.modal-content input:focus::-webkit-input-placeholder, input:valid::-webkit-input-placeholder {
  color: #1abc9c;
  font-size: 11px;
  -webkit-transform: translateY(-70px);
          transform: translateY(-70px);
  visibility: visible !important;
}

.modal-content button {
  border: none;
  background: #37c386;
  cursor: pointer;
  border-radius: 3px;
  padding: 6px;
  width: 200px;
  color: white;
  margin-left: 25px;
  box-shadow: 0 3px 6px 0 rgba(0, 0, 0, 0.2);
}

.modal-content button:hover {
  -webkit-transform: translateY(-3px);
      -ms-transform: translateY(-3px);
          transform: translateY(-3px);
  box-shadow: 0 6px 6px 0 rgba(0, 0, 0, 0.2);
}
 
The magic happens in a few lines of code for the input:focus and input:valid. The CSS transform property plays a crucial role to achieve this little instant feedback effect.

.modal-content input:focus::-webkit-input-placeholder, input:valid::-webkit-input-placeholder {
  color: #37c386;
  font-size: 11px;
  -webkit-transform: translateY(-20px);
          transform: translateY(-20px);
  visibility: visible !important;

}

/* The Close Button */
.close {
    color: #fff;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

</style>
</head>
<body>
<form>
<!-- The Modal -->
<!-- <div id="myModal" class="modal"> -->
  <!-- Modal content -->
  <div class="modal-content">
<span class="close" style= "padding: 10px 10px 0 0; font-color:white;">x</span>
<h1>Material Design Login Form</h1>
<input placeholder="Username" type="text" required="">
<input placeholder="Password" type="password" required="">
<button>Submit</button>
</div>
</div>
</form>
</body>
</html>