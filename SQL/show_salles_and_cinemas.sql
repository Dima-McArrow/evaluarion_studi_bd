SELECT salles.ID, salles.name, salles.places, cinemas.ID, cinemas.name, cinemas.adress FROM cinema_app_db.salles JOIN cinemas ON salles.cinema_id = cinemas.id ORDER BY cinemas.id;
