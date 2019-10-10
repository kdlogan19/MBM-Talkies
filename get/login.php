<?php
include '../config.php';

if (isset ( $_POST ['username'] ) && ! empty ( $_POST ['username'] ) && isset ( $_POST ['password'] ) && ! empty ( $_POST ['password'] )) {
	$username = urldecode ( $_POST ["username"] );
	$PASSWORD = urldecode ( $_POST ["password"] );
	
	$Query = "SELECT * FROM `user` where username='$username' AND password='$PASSWORD' ";
	$result = mysql_query ( $Query );
	
	if (mysql_affected_rows () == 1) {
		$row = mysql_fetch_object ( $result );
		
		if ($row->authorized == 1) {
			$Query = "SELECT name FROM `user` where id=$row->id";
			$result = mysql_query ( $Query );
			$clg = mysql_fetch_object ( $result );
			
			echo json_encode ( array (
					"result" => "1",
					"msg" => array (
							"user_id" => $row->id,
							"name" => $row->name,
							"username" => $row->username,
					) 
			) );
		} else
			echo json_encode ( array (
					"result" => "0",
					"msg" => "Anxious? Please verify your username first." 
			) );
	} else
		echo json_encode ( array (
				"result" => "0",
				"msg" => "Login details provided are invalid." 
		) );
} else {
	echo json_encode ( array (
			"result" => "0",
			"msg" => "Required Feild Missing" 
	) );
}
?>