<?php
header('Access-Control-Allow-Origin: *'); // Allow requests from any origin
header('Access-Control-Allow-Methods: POST, GET, OPTIONS'); // Allow specific methods
header('Access-Control-Allow-Headers: Content-Type, Authorization'); // Allow specific headers

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    // Handle preflight request
    header('HTTP/1.1 200 OK');
    exit();
}

require_once '../connect.php';

header('Content-Type: application/json');

// Ensure the database connection is established
if (!isset($conn)) {
    error_log("Database connection not established.");
    echo json_encode(array("status" => "error", "message" => "Database connection error."));
    exit();
}

// Retrieve POST data
$username = $_POST['username'] ?? '';
$password = $_POST['password'] ?? '';

// Log the received data for debugging
error_log("Received username: " . $username);
error_log("Received password: " . $password);

// Prepare and execute SQL statement
$sql = "SELECT u.user_id, u.user_email, u.user_name, u.user_lastname, u.user_password, u.user_type, t.usertype_name, u.user_status 
        FROM tb_user AS u
        LEFT JOIN tb_usertype AS t ON u.user_type = t.usertype_id
        WHERE u.user_email = ?";
$stmt = $conn->prepare($sql);

if (!$stmt) {
    // Output error message if prepare() fails
    error_log("Prepare failed: " . $conn->error);
    echo json_encode(array("status" => "error", "message" => "Database query preparation failed: " . $conn->error));
    exit();
}

$stmt->bind_param("s", $username);
$stmt->execute();
$result = $stmt->get_result();

// Log SQL execution result for debugging
error_log("SQL executed, result count: " . $result->num_rows);

$response = array();

if ($result->num_rows > 0) {
    $user = $result->fetch_assoc();
    
    // Check if the user_status is 1
    if ($user['user_status'] != 1) {
        $response = array("status" => "failure", "message" => "Account is inactive. Please contact support.");
    } elseif ($password == $user['user_password']) { // Compare directly for testing purposes
        // Remove the password from the response
        unset($user['user_password']);
        $response = array("status" => "success", "user" => $user);
    } else {
        $response = array("status" => "failure", "message" => "Invalid email or password");
    }
} else {
    $response = array("status" => "failure", "message" => "Invalid email or password");
}

// Output JSON response
echo json_encode($response);

$stmt->close();
$conn->close();
?>