<?php include ("config.php") ?>

<?php  
   $sql = "SELECT * FROM newsfeed  order by  createdDate desc limit ".$_GET["offset"].",10";

$result = $conn->query($sql);
$poorva=array();

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
		$sqlname = "SELECT FirstName, LastName FROM user where Id=".$row["userId"];
		$resultname = $conn->query($sqlname);
		$rowname = $resultname->fetch_assoc();
		$name=$rowname["FirstName"]." ".$rowname["LastName"];
		
		$newsfeed=array(
		"result"=>1,
		"newsid"=>$row["newsId"],
		"userid"=>$row["userId"],
		"username"=>$name,
		"newscontent"=> $row["newsContent"],
		"newsdate"=> $row["createdDate"],
		"newslike"=> $row["newsLike"]);
		
		array_push($poorva,$newsfeed);
    }
	 echo json_encode(array("newsfeed"=>$poorva));
} else {
	echo json_encode(array(
		"result"=>0,
		"msg"=> "Invalid details"));
}
$conn->close();

  


?>