<?php

require_once "../cors.php";
session_start();

if (!isset($_SESSION['role_name']) || $_SESSION['role_name'] !== 'Superadmin') {
    http_response_code(403);
    exit();
}

require_once "../config/database.php";

$data = json_decode(file_get_contents("php://input"), true);

$user_id = $data['user_id'];
$permissions = $data['permissions'];

foreach ($permissions as $perm) {

    $permission_id = $perm['permission_id'];
    $allowed = $perm['allowed'];

    $stmt = $conn->prepare("
        INSERT INTO user_permissions (user_id, permission_id, is_allowed)
        VALUES (?, ?, ?)
        ON DUPLICATE KEY UPDATE is_allowed = ?
    ");

    $stmt->bind_param("iiii", $user_id, $permission_id, $allowed, $allowed);
    $stmt->execute();

}

echo json_encode([
    "success" => true
]);