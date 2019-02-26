<?php 
header("access-control-allow-origin: *");

$department2=$_POST["department2"];
$job2=$_POST["job2"];

$con = mysqli_connect("localhost","root","") or die(mysqli_error());
mysqli_select_db($con,"ajax") or die(mysqli_error());
$query = "SELECT * FROM person WHERE Job IN (SELECT Title FROM job WHERE Title LIKE '$job2')";
$result = mysqli_query($con,$query);

$rawdata = array();
    $i=0;
    while($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
    {
        $rawdata[$i] = $row;
        $i++;
    }

    $myJSON = json_encode($rawdata);
    echo $myJSON;
    file_put_contents('view.json', json_encode($myJSON));
    
?>