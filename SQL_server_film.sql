CREATE DATABASE TARgv24Orlov;
USE TARgv24Orlov;
CREATE TABLE film(
filmID int PRIMARY KEY identity (1,1),
filmNimetus varchar(30) not null,
aasta int,
eelarveHind decimal(7,1));
SELECT * FROM film

INSERT INTO film(filmNimetus, aasta, eelarveHind)
VALUES('Babygirl', 2024, 55555.5),

CREATE TABLE zanr(
zanrID int PRIMARY KEY identity (1,1),
zanrNimetus varchar(20) UNIQUE
)

INSERT INTO zanr(zanrNimetus)
VALUES('Draama'), ('Detektiiv');
SELECT * FROM zanr;

ALTER TABLE film ADD zanrID int;
SELECT * FROM film;
-- Добавляем столбцу zanrID фиксированные значения из таблицы zanr
ALTER TABLE film ADD CONSTRAINT fk_zanr
FOREIGN KEY (zanrID) REFERENCES zanr(zanrID);

SELECT * FROM film;
SELECT * FROM zanr;
UPDATE film SET zanrID=2 WHERE filmID=2

CREATE TABLE rezisoor(
rezID int PRIMARY KEY identity (1,1),
rezNimi varchar(25) not null,
rezSunniaeg int,
rezRiik varchar(30));

SELECT * FROM rezisoor;

INSERT INTO rezisoor(rezNimi, rezSunniaeg, rezRiik)
VALUES('Nolan', 1976, 'USA'), ('RidleyScott', 1842, 'Cambogua')

ALTER TABLE film ADD rezID int;
ALTER TABLE film ADD CONSTRAINT fk_rez
FOREIGN KEY (rezID) REFERENCES rezisoor(rezID);
UPDATE film SET rezID=1 WHERE filmID=2

CREATE TABLE kinokava(
kinokavID int PRIMARY KEY identity (1,1),
kinokavTime int);

ALTER TABLE kinokava ADD filmID int;
ALTER TABLE kinokava ADD CONSTRAINT fk_film
FOREIGN KEY (filmID) REFERENCES film(filmID);
INSERT INTO kinokava(kinokavTime)
VALUES(2), (3), (1), (2)
UPDATE kinokava SET filmID=3 WHERE kinokavID=3

SELECT * FROM kinokava;
SELECT * FROM film;
