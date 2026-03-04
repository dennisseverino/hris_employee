<?php

require_once "../cors.php";
session_start();

require_once "../config/database.php";

require_once "../utils/logger.php";

logAction(
    $conn,
    $_SESSION['user_id'],
    "Restored Employee",
    $employee_id
);

$data = json_decode(file_get_contents("php://input"), true);

$employee_id = $data['employee_id'];

$stmt = $conn->prepare("
UPDATE employees
SET archived = 0
WHERE employee_id = ?
");

$stmt->bind_param("i", $employee_id);
$stmt->execute();

echo json_encode([
    "success" => true
]);