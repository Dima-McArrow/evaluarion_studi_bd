<?php

// params de connexion à la BD
$dsn = "mysql:host=localhost;dbname=cinema_app_db";
$username = "***";
$password = "***";

try {
  // PDO
  $cadb = new PDO($dsn, $username, $password);
  $cadb->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  // data du formulaire HTML
  $name = $_POST['name'];
  $email = $_POST['email'];
  $password = $_POST['password'];
  $cin_id = $_POST['cin_id'];

  // la requête SQL
  $sql = "INSERT INTO cinema_app_db.cin_admins (name, email, password, cinema_id) VALUES
  (
    :name,
    :email,
    :password,
    :cinema_id
  )";
  $stmt = $cadb->prepare($sql);

  // affectation des paramètres
  $stmt->bindValue(':name', $name);
  $stmt->bindValue(':email', $email);
  $stmt->bindValue(':cinema_id', $cin_id);

  // hash du mot de passe en utilisant BCRYPT
  $stmt->bindValue(':password', password_hash($password, PASSWORD_BCRYPT));
  if ($stmt->execute()) {
    echo '🗸 L\'admin '. $name . ' a bien été créé<br/>';
    echo '<a href="index.html">retour</a>';
  } else {
    echo 'Impossible de créer l\'admin';
  }

  // capturer l'erreur
} catch (PDOException $e) {
  die("La connexion a échoué: " . $e->getMessage());
}
