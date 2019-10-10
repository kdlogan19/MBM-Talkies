<?php
include '../config.php';

if (isset ( $_POST ['email'] ) && ! empty ( $_POST ['email'] )) {
	$EMAIL = urldecode ( $_POST ["email"] );
	
	$Query = "select * from `user` where email='$EMAIL'";
	$result = mysql_query ( $Query );
	
	if (mysql_affected_rows () == 1) {
		$row = mysql_fetch_object ( $result );
		
		$to = $EMAIL;
		$subject = "Espectro 2k16: Password Recovery";
		$message = "Dear $row->name. Thanks for participating in Espectro 2k16.\r\n\nYour login details as per your request are as below: \r\nEmail ID : $EMAIL\r\nPassword : " . $row->password . "\r\n\nNote : \n1. Kindly click on NOT SPAM if you find this mail in your spam folder.\r\n\nWe will reach out to you soon with more updates.\r\nHope to see you at Espectro 2k16, 25th-27th April 2016.\r\n\nLike us : https://web.facebook.com/Espectro-1455747224717031\r\nFollow us : https://www.instagram.com/mbm.espectro.2k16\r\n\nThanks,\r\nTeam Espectro 2k16";
		$message = wordwrap ( $message, 70, "\r\n" );
		$headers = 'From: espectro@espectro2016.in' . "\r\n" . 'Reply-To: espectro@espectro2016.in' . "\r\n" . 'X-Mailer: PHP/' . phpversion ();
		
		mail ( $to, $subject, $message, $headers );
		echo json_encode ( array (
				"result" => "1",
				"msg" => "Have a break; Go! Check your emails, we have sent you details as per your request." 
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