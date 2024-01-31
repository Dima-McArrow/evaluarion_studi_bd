<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Création d'admin cinéma</title>
  <link rel="stylesheet" href="Styles\bootstrap.css">
</head>
<body>
  <div class="container mt-5">
  <h1 class="h1">Création d'admin cinéma</h1>
    <form action="admin.php" method="post" class="m-5">
      <div class="mb-3">
        <label for="name" class="form-label">Entrez votre nom:</label>
        <input type="text" class="form-control" id="name" name="name" />
      </div>
      <div class="mb-3">
        <label for="email" class="form-label">Entrez votre email:</label>
        <input type="text" class="form-control" id="email" name="email" aria-describedby="emailHelp">
        <div id="emailHelp" class="form-text">Unique par utilisateur</div>
      </div>
      <div class="mb-3">
        <label for="password" class="form-label">Entrez le MDP:</label>
        <input type="text" class="form-control" id="password" name="password" />
      </div>
      <div class="mb-3">
        <label for="cin_id" class="form-label">Entrez l'ID de votre cinéma:</label>
        <input type="number" class="form-control" id="cin_id" name="cin_id" />
      </div>
      <input id="create" type="submit" value="Créer admin" class="btn btn-primary" />
      <a href="index.html" class="btn btn-danger">Retour à la page principale</a>
    </form>
  </div>
</body>
</html>
