<?php

// params de connexion à la BD
$dsn = "mysql:host=localhost;dbname=cinema_app_db";
$username = "***";
$password = "***";

try {
  // PDO
  $pdo = new PDO($dsn, $username, $password);
  $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  
  // la requête SQL
  $stmt = $pdo->prepare("SELECT * FROM cinema_app_db.movies ORDER BY ID");
  $stmt->execute();
  $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

  // capturer l'erreur
} catch (PDOException $e) {
  die("La connexion a échoué: " . $e->getMessage());
}

?>

<table class="table table-striped">
  <caption>
    Films
  </caption>
  <thead>
    <tr>
      <th>ID</th>
      <th>Titre</th>
      <th>Min</th>
    </tr>
  </thead>
  <tbody>
    <?php foreach ($result as $row): ?>
      <tr>
        <td><?php echo $row['ID']; ?></td>
        <td><?php echo $row['title']; ?></td>
        <td><?php echo $row['length_min']; ?></td>
      </tr>
    <?php endforeach; ?>
  </tbody>
</table>
