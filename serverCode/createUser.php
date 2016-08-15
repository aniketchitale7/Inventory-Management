<?php
require_once '../includes/db.php'; // The mysql database connection script
require '../PHPMailer-master/PHPMailerAutoload.php';
//require './vendor/autoload.php';
echo"Hello World";
print("Hello World");
if(isset($_GET['user_name']) && isset($_GET['password']))
{
    $user_name = $_GET['user_name'];
    $password = $_GET['password'];
    $name = $_GET['name'];
    $dob = $_GET['dob'];
    $gender = $_GET['gender'];
    $designation = $_GET['designation'];
    $designationID = $_GET['designationID'];

    echo(""+$dob);

    $query="INSERT INTO login(email,password,name,dateofbirth,gender,designation,designationId)  VALUES ('$user_name', '$password', '$name' ,'$dob', '$gender' , '$designation','$designationID')";
    $result = $mysqli->query($query) or die($mysqli->error.__LINE__);
    $result = $mysqli->affected_rows;

     // send email for account verification
       // $to = $user_name;
       /* $subject = " Account Verification";
        $message = "Thanks for signing up ".$user_name."! Please click on the link below to verify your account.\r\nhttp://localhost:8888/login/verify.php?id=".$user_name;
        $headers = "From: aniketchitale7@gmail.com" . "\r\n" .
        "Reply-To: aniketchitale7@gmail.com" . "\r\n" .
        "X-Mailer: PHP/" . phpversion();

        $retval = mail($to, $subject, $message, $headers);
        if($retval !== true) {
            echo 'Opps! There was an error sending your account verification email, please contact our support staff at aniketchitale7@gmail.com.';
            echo 'Mailer Error: ' . $mail->ErrorInfo;
            echo "<script>alert('Email not sent an error occured.')</script>";

        } else {
            echo "<script>alert('Email sent! Please check your email and activate your account.')</script>";
            echo "<script>window.location = 'http://localhost:8888/login/login.html'</script>";
        }*/


$mail = new PHPMailer();

$mail->isSMTP();                                      // Set mailer to use SMTP
$mail->SMTPAuth = true;                               // Enable SMTP authentication
$mail->SMTPSecure = 'ssl'; // secure transfer enabled REQUIRED for Gmail
$mail->Host = "smtp.gmail.com"; // Specify main and backup SMTP servers
$mail->Port = 465;                                    // TCP port to connect to
$mail->Username = 'acbegr.solutions@gmail.com';                 // SMTP username
$mail->Password = 'FUNdamentals';                           // SMTP password

$mail->SMTPDebug = 2;
$mail->setFrom('acbegr.solutions@gmail.com', 'team 06');
$mail->addAddress($user_name);     // Add a recipient
$mail->isHTML(true);                                  // Set email format to HTML

$mail->Subject = 'Thank you for signing up for our inventory management system';
$mail->Body    = 'Click this link to verify your account http://127.0.0.1/Fundamentals_Project/serverCode/AuthorizeManager.php?username='.$user_name.'&authorized=true';

if(!$mail->send()) {
    echo 'Message could not be sent.';
    echo 'Mailer Error: ' . $mail->ErrorInfo;
} else {
    echo 'Message has been sent';
}


}
?>