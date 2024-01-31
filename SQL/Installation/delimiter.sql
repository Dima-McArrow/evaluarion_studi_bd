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
    SET MESSAGE_TEXT = 'Uniquement un admin attaché à un cinéma peut modifier ces céances!';
  END IF;
END //
DELIMITER;