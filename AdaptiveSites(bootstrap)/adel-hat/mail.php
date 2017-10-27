<?php

$frm_name  = "Администратор";
$recepient = "adel.knitted.cap@gmail.com";
$sitename  = "adel-hat.ru";
$subject   = "Заявка на каталог \"$sitename\"";

$name = trim($_POST["name"]);
$email = trim($_POST["email"]);
$phone = trim($_POST["phone"]);
$city = trim($_POST["city"]);

$message = "
E-mail: $email <br>
Имя: $name <br>
Телефон: $phone <br>
Город: $city <br>
";

mail($recepient, $subject, $message, "From: $frm_name" . "\r\n" . "Reply-To: $email" . "\r\n" . "X-Mailer: PHP/" . phpversion() . "\r\n" . "Content-type: text/html; charset=\"utf-8\"");
