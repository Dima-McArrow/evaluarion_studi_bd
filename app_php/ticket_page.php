<!DOCTYPE html>
<html lang="fr">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Création de ticket</title>
  <link rel="stylesheet" href="Styles\bootstrap.css">
</head>

<body>
  <div class="container mt-5">
    <h1>Création de ticket</h1>
    <form action="ticket.php" method="post" class="m-5">
      <div class="mb-3">
        <label for="seance" class="form-label">Entrez l'id de la séance: </label>
        <input id="seance" type="number" name="seance" class="form-control" />
      </div>
      <div class="mb-3">
        <label for="price" class="form-label">Choisissez le prix: </label>
        <select class="form-select" aria-label="Default select example" id="price" type="number" name="price">
          <option value="1">Plein tarif</option>
          <option value="2">Étudiant</option>
          <option value="3">Moins de 14 ans</option>
        </select>
      </div>
      <input id="create" type="submit" value="Créer ticket" class="btn btn-primary" />
      <a href="index.html" class="btn btn-danger">Retour à la page principale</a>
    </form>
  </div>
  <div class="container">
    <div class="my_container">
      <h2>les séances:</h2>
      <?php
      include('display_seances.php');
      ?>
    </div>
    <div class="my_container">
      <h2>les prix:</h2>
      <?php
      include('display_prices.php');
      ?>
    </div>
  </div>
</body>

</html>