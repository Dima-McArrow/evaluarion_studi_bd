<?php

// params de connexion à la BD
$dsn = "mysql:host=localhost;dbname=cinema_app_db";
$username = "***";
$password = "***";

try {
  // PDO
  $cadb = new PDO($dsn, $username, $password);
  $cadb->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  echo '<i>La BD répond:</i><br/>';

  // data du formulaire HTML
  $seance = $_POST['seance'];
  $price = $_POST['price'];

  // la requête SQL
  $sql = "INSERT INTO cinema_app_db.tickets (seance_id, price_id) VALUES
  (
    :seance,
    :price
  )";
  $stmt = $cadb->prepare($sql);

  // affectation des paramètres
  $stmt->bindParam(':seance', $seance);
  $stmt->bindParam(':price', $price);

  // exécuter la requête
  if ($stmt->execute() !== false) {
    echo '<strong>🗸 Ticket crée</strong><br/>';
    echo '<a href="ticket_page.php">retour</a>';
  } else {
    echo '<strong>‼️ Total error ‼️</strong>';
  }
// capturer l'erreur
} catch (PDOException $e) {
  die("La connexion a échoué: " . $e->getMessage());
}
