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
