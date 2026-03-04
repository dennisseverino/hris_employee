<?php

require_once "../cors.php";
session_start();

require_once "../config/database.php";

require_once "../utils/logger.php";

logAction(
    $conn,
    $_SESSION['user_id'],
    "Deleted Employee Permanently",
    $employee_id
);

$data = json_decode(file_get_contents("php://input"), true);

$employee_id = $data['employee_id'];

$stmt = $conn->prepare("
DELETE FROM employees
WHERE employee_id = ?
");

$stmt->bind_param("i", $employee_id);
$stmt->execute();

echo json_encode([
    "success" => true
]);