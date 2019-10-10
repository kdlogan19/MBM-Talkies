<?php include ("config.php") ?>

<?php  
   $newsid=$_GET["newsId"];
   $userid=$_GET["userId"];
   $sql = "SELECT * FROM newslike where newsId=".$newsid." and userId=".$userid;

$result = $conn->query($sql);

if ($result->num_rows > 0) {
	$sql1 = "delete FROM newslike where newsId=".$newsid." and userId=".$userid;
	
   if ($conn->query($sql1)===TRUE) {
	 echo json_encode(array(
		"result"=>1,
		"action"=>"drop"));
}
else {
 echo json_encode(array(
		"result"=>0));
}
    
} 

else {

	$sql2 = "Insert into newslike (`newsId`,`userId`) values(".$newsid.",".$userid.")";
	
if ($conn->query($sql2)===TRUE) {
    // output data of each row
		echo json_encode(array(
		"result"=>1,
		"action"=>"insert"));	
} else {
	echo json_encode(array(
		"result"=>0));
}

}
$conn->close();
?>