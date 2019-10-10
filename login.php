<?php include ("config.php") ?>

<?php  
   $sql = "SELECT * FROM user where Username='".$_GET["username"]."' and Password='".$_GET["password"]."'";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo json_encode(array(
		"result"=>1,
		"id"=>$row["Id"],
		"name"=> $row["FirstName"]));
    }
} else {
	echo json_encode(array(
		"result"=>0,
		"msg"=> "Invalid details"));
}
$conn->close();

  


?>