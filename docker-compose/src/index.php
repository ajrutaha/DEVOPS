<?php
echo "<h1>Test de la Stack Docker Compose</h1>";
echo "<p>✅ PHP fonctionne (Version " . phpversion() . ")</p>";

$servername = "db";
$username = "root";
$password = "RootPassword123!";
$dbname = "company";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("<p style='color:red'>❌ Echec de la connexion MySQL : " . $conn->connect_error . "</p>");
}
echo "<p style='color:green'>✅ Succès ! PHP est connecté à MySQL.</p>";

$conn->close();
?>