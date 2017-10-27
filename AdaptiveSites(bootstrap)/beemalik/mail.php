<?php

$frm_name  = "Бималик";
$recepient = "beemalik@mail.ru";
$sitename  = "beemalik.ru";
$subject   = "Новая заявка с сайта \"$sitename\"";
$email = "admin@beemalik.ru";

$name = trim($_POST["name"]);
$phone = trim($_POST["phone"]);
$callback = trim($_POST["callback"]);

$message = "
Имя: $name <br>
Телефон: $phone <br>
Когда перезвонить: $callback
";

mail($recepient, $subject, $message, "From: $frm_name <$email>" . "\r\n" . "Reply-To: $email" . "\r\n" . "X-Mailer: PHP/" . phpversion() . "\r\n" . "Content-type: text/html; charset=\"utf-8\"");
