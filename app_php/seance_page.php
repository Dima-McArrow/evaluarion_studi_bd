<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Création de séance</title>
  <link rel="stylesheet" href="Styles\bootstrap.css">
</head>
<body>
  <div class="container mt-5">
    <h1 class="h1">Création de séance</h1>
    <form action="seance.php" method="post" class="m-5">
      <div class="mb-3">
        <label for="film" class="form-label">Entrez l'id du film:</label>
        <input type="number" class="form-control" id="film" name="film" />
      </div>
      <div class="mb-3">
        <label for="salle" class="form-label">Entrez l'id de la salle:</label>
        <input type="number" class="form-control" id="salle" name="salle" />
      </div>
      <div class="mb-3">
        <label for="start_at" class="form-label">Entrez le timestamp du début de la séance:</label>
        <input type="text" class="form-control" id="start_at" name="start_at" />
      </div>
      <input id="create" type="submit" value="Créer séance" class="btn btn-primary" />
      <a href="index.html" class="btn btn-danger">Retour à la page principale</a>
    </form>
  </div>
  <div class="container">
    <div class="my_container">
      <h2>les films:</h2>
      <?php
      include('display_movies.php');
      ?>
    </div>
    <div class="my_container">
      <h2>les salles:</h2>
      <?php
      include('display_salles.php');
      ?>
    </div>
    <div class="my_container">
      <h2>les séances:</h2>
      <?php
      include('display_seances.php');
      ?>
    </div>
  </div>
</body>
</html>
