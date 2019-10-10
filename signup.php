<?php include ("config.php") ?>

<?php
 $sql = "insert into user (Username, Password, FirstName, LastName, Dob, MobileNo ,Branch, Gender, JobDetails, FacultyNo, Type) values ('".$_GET["username"]."','".$_GET["password"]."','".$_GET["firstname"]."','".$_GET["lastname"]."','".$_GET["dob"]."','".$_GET["mobileno"]."','".$_GET["branch"]."','".$_GET["gender"]."','".$_GET["jobdetails"]."','".$_GET["facultyno"]."','".$_GET["type"]."')";


if ($conn->query($sql) === TRUE) {
       echo json_encode(array(
		"result"=>1));
} else {
	echo json_encode(array(
		"result"=>0,
		"msg"=> "Error: " . $conn->error));
		}$conn->close();
?>