SELECT * FROM cinemas;

-- modifie la valeure de la colone movie_id
ALTER TABLE cinema_app_db.seances MODIFY `movie_id` DECIMAL(5, 2);

SELECT * FROM cinema_app_db.salles;

SELECT * FROM cinema_app_db.movies;


USE cinema_app_db;
DESCRIBE cinema_app_db.movies;

DESCRIBE cinema_app_db.seances;

-- tickets et leurs prix
SELECT * FROM cinema_app_db.tickets JOIN prices ON tickets.price_id = prices.id;

-- séances et les ID des salles corréspondantes
SELECT * FROM cinema_app_db.seances JOIN cinema_app_db.salles ON seances.salle_id = salles.id;

CREATE TABLE cinema_app_db.seances (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  movie_id INT NOT NULL REFERENCES movies(id),
  salle_id INT NOT NULL REFERENCES salles(id),
  start_at TIMESTAMP NOT NULL
);

DESCRIBE seances_test;

DROP TABLE cinema_app_db.seances_test;


SELECT * FROM cinema_app_db.seances;

SELECT
  seances.id,
  movies.title AS titre_du_film,
  salles.name AS salle,
  salles.places AS places,
  seances.start_at
FROM
  seances
JOIN
  movies ON seances.movie_id = movies.id
JOIN
  salles ON seances.salle_id = salles.id;

SELECT * FROM cinema_app_db.cinemas;

-- reinitializer la table tickets
TRUNCATE TABLE cinema_app_db.tickets;


CREATE TABLE cinema_app_db.cin_admins (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  cinema_id INT NOT NULL REFERENCES cinemas(id)
);

DESCRIBE cinema_app_db.cin_admins;

DROP TABLE cinema_app_db.cin_admins;

INSERT INTO cinema_app_db.cin_admins (name, email, password, cinema_id) VALUES
(
  'Steven Rogers',
  'first@avenger.com',
  'cpt',
  5
);

SELECT * FROM cinema_app_db.cin_admins;

SHOW TABLES;


-- la condition que uniquement l'admin qui travail dans un cinéma peut modifier les séances de ce cinéma
DELIMITER //
CREATE TRIGGER before_seances_update
BEFORE UPDATE
ON cinema_app_db.seances FOR EACH ROW

BEGIN
  DECLARE admin_cinema_id INT;
  SELECT cinema_id INTO admin_cinema_id
  FROM cinema_app_db.cin_admins
  WHERE cinema_app_db.cin_admins.ID = (SELECT cinema_app_db.cin_admins.ID FROM cinema_app_db.cinemas WHERE ID = NEW.salle_id);
  IF admin_cinema_id IS NULL OR admin_cinema_id != NEW.salle_id THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Que les admins attachés à un cinéma peut modifier ces céances!';
  END IF;
END //
DELIMITER;


-- créer les utilisateurs qui ont access que à la table seances
CREATE USER 'user_name'@'localhost' IDENTIFIED BY 'p4$$w0rd';
GRANT SELECT, INSERT, UPDATE, DELETE ON cinema_app_db.seances TO 'user_name'@'localhost';



INSERT INTO cinema_app_db.seances (movie_id, salle_id, start_at) VALUES 
(
  movie_id,
  salle_id,
  start_at
);

INSERT INTO cinema_app_db.tickets (seance_id, price_id) VALUES 
(
  seance_id,
  price_id,
);



