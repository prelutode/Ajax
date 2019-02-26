<?php 
header("access-control-allow-origin: *");

$Firstname=$_POST["name"];
$Email=$_POST["email"];
$Phone=$_POST["phone"];
$Job=$_POST["job"];

$con = mysqli_connect("localhost","root","") or die(mysqli_error());
mysqli_select_db($con,"ajax") or die(mysqli_error());
$query = "INSERT INTO person VALUES ('$Firstname', '$Email', $Phone, '$Job')";
mysqli_query($con,$query);
?>