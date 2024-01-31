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
  $movie = $_POST['film'];
  $salle = $_POST['salle'];
  $start_at = $_POST['start_at'];

  // la requête SQL
  $sql = "INSERT INTO cinema_app_db.seances (movie_id, salle_id, start_at) VALUES
  (
    :movie,
    :salle,
    :start_at
  )";
  $stmt = $cadb->prepare($sql);

  // affectation des paramètres
  $stmt->bindParam(':movie', $movie);
  $stmt->bindParam(':salle', $salle);
  $stmt->bindParam(':start_at', $start_at);

  // exécuter la requête
  if ($stmt->execute() !== false) {
    echo '<strong>🗸 Seance crée</strong><br/>';
    echo '<a href="seance_page.php">retour</a>';
  } else {
    echo 'Total error';
  }

  // capturer l'erreur
} catch (PDOException $e) {
  die("La connexion a échoué: " . $e->getMessage());
}
