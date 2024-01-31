CREATE TABLE cinema_app_db.cinemas (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  adress VARCHAR(255) NOT NULL
);
CREATE TABLE cinema_app_db.movies (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  length_min INT(3) NOT NULL,
  director VARCHAR(100),
  casting VARCHAR(255)
);
CREATE TABLE cinema_app_db.salles (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(10) NOT NULL UNIQUE,
  places INT NOT NULL,
  cinema_id INT NOT NULL REFERENCES cinemas(id)
);
CREATE TABLE cinema_app_db.seances (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  movie_id INT NOT NULL REFERENCES movies(id),
  salle_id INT NOT NULL REFERENCES salles(id),
  start_at TIMESTAMP NOT NULL
);
CREATE TABLE cinema_app_db.prices (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  value DECIMAL(5, 2) NOT NULL
);
CREATE TABLE cinema_app_db.tickets (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  seance_id INT NOT NULL REFERENCES seances(id),
  price_id INT NOT NULL REFERENCES prices(id),
  is_paid BOOLEAN
);
CREATE TABLE cinema_app_db.cin_admins (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  cinema_id INT NOT NULL REFERENCES cinemas(id)
);