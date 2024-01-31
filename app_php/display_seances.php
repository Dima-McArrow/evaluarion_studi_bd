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
  $stmt = $pdo->prepare("SELECT
  seances.id AS ID,
  movies.title AS titre_du_film,
  salles.name AS salle,
  salles.places AS places,
  seances.start_at
  FROM
    seances
  JOIN
    movies ON seances.movie_id = movies.id
  JOIN
    salles ON seances.salle_id = salles.id
  ORDER BY salle;");
  
  $stmt->execute();
  $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

  // capturer l'erreur
} catch (PDOException $e) {
  die("La connexion a échoué: " . $e->getMessage());
}

?>

<table class="table">
  <caption>
    Séances
  </caption>
  <thead>
    <tr>
      <th>ID</th>
      <th>Film</th>
      <th>Salle</th>
      <th>Début</th>
      <th>Places</th>
    </tr>
  </thead>
  <tbody>
    <?php foreach ($result as $row): ?>
      <tr>
        <td><?php echo $row['ID']; ?></td>
        <td><?php echo $row['titre_du_film']; ?></td>
        <td><?php echo $row['salle']; ?></td>
        <td><?php echo $row['start_at']; ?></td>
        <td><?php echo $row['places']; ?></td>
      </tr>
    <?php endforeach; ?>
  </tbody>
</table>