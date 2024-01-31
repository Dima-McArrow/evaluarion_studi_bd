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
  $password = $_POST['password'];

  // la requête SQL
  $sql = "SELECT * FROM cin_admins WHERE name = :name";

  $stmt = $cadb->prepare($sql);

  // affectation des paramètres
  $stmt->bindValue(':name', $name);
  

  // exécuter la requête
  if ($stmt->execute()) {
    $user = $stmt->fetch(PDO::FETCH_ASSOC);
    if ($user === false) {
      // si aucun utilisateur ne correspond au login entré, on affiche une erreur
      echo 'Identifiants invalides';
    } else {
      // vérifier le hash du password
      if (password_verify($password, $user['password'])) {
        echo 'Bienvenue ' . $user['name'];
        header("Location: seance_page.php");
        exit();
      } else {
        echo 'Identifiants invalides';
      }
    }
  } else {
    echo 'Impossible de récupérer l\'utilisateur';
  }

  // capturer l'erreur
} catch (PDOException $e) {
  die("La connexion a échoué: " . $e->getMessage());
}
