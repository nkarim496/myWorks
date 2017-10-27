<?php

$frm_name  = "Эдельвейс";
$recepient = "dombay09@list.ru";
$sitename  = "edelveis-dombai.ru";
$subject   = "Новая заявка с сайта \"$sitename\"";
$email = "admin@elelveis.ru";

$name = trim($_POST["name"]);
$phone = trim($_POST["phone"]);
$callback = trim($_POST["callback"]);
$date = trim($_POST["date"]);
$title = trim($_POST["title"]);

$message = "
Что бронируют: $title
Имя: $name
Телефон: $phone
Дата: $date
Когда перезвонить: $callback
";

mail($recepient, $subject, $message, "From: $frm_name <$email>" . "\r\n" . "Reply-To: $email" . "\r\n" . "X-Mailer: PHP/" . phpversion() . "\r\n" . "Content-type: text/html; charset=\"utf-8\"");
