<?php

header("access-control-allow-origin: *");

$con = mysqli_connect("localhost","root","") or die(mysqli_error());
mysqli_select_db($con,"ajax") or die(mysqli_error());

$depart = $_GET["department"];


$query = "SELECT Title FROM job WHERE department LIKE '$depart'";

$result = mysqli_query($con,$query);
$numReg = mysqli_num_rows($result);
$strHTML = "";

for ($i=0; $i<$numReg; $i++) {
	$row = mysqli_fetch_array($result);
	$strHTML .="<option>".$row["Title"]."</option>";
}
echo $strHTML;

?>