<?php include("config.php") ?>

<?php
	$sql = "insert into `newsfeed` (`userId`,`newsContent`,`newsVisibility`) values ('".$_GET["userid"]."','".$_GET["newscontent"]."','".$_GET["nv"]."')";
	
	if ($conn->query($sql) === TRUE) {
       echo json_encode(array(
		"result"=>1));
} else {
	echo json_encode(array(
		"result"=>0,
		"msg"=> "Error: " . $conn->error));
		}$conn->close();
?>
