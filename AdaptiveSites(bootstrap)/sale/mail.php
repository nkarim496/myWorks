<?php

$frm_name  = "Администратор";
$recepient = "info@nezee.ru";
$sitename  = "akcia.nezee.ru";
$subject   = "Новая заявка с сайта \"$sitename\"";
$email = "admin@nezee.ru";

$name = trim($_POST["name"]);
$telefon = trim($_POST["telefon"]);

$message = "
Имя: $name <br>
Телефон: $telefon <br>
";

mail($recepient, $subject, $message, "From: $frm_name <$email>" . "\r\n" . "Reply-To: $email" . "\r\n" . "X-Mailer: PHP/" . phpversion() . "\r\n" . "Content-type: text/html; charset=\"utf-8\"");
