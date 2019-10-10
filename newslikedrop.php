<?php include ("config.php") ?>

<?php  
   $sql = "delete FROM newslike where id=".$_GET["Id"];

if ($conn->query($sql)===TRUE) {
	 echo json_encode(array(
		"result"=>1));
}
else {
 echo json_encode(array(
		"result"=>0));
}
$conn->close();
?>