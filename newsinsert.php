<?php include ("config.php") ?>

<?php  
   $sql = "update newsfeed set newsLike=".$_GET["newsLike"]." where newsId=".$_GET["newsId"];

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
		echo json_encode(array(
		"result"=>1,));	
    }
} else {
	echo json_encode(array(
		"result"=>0));
}
$conn->close();
?>