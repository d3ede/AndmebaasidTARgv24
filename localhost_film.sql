CREATE TABLE film(
filmID int PRIMARY KEY AUTO_INCREMENT,
filmNimetus varchar(30) not null,
aasta int,
eelarveHind decimal(7,1));

INSERT INTO film(filmNimetus, aasta, eelarveHind)
VALUES('Babygirl', 2024, 55555.5),
('Titanic', 1998, 55555.5),
('Barby', 2023, 55555.5),

CREATE TABLE zanr(
zanrID int PRIMARY KEY AUTO_INCREMENT,
zanrNimetus varchar(20) UNIQUE
);
INSERT INTO zanr(zanrNimetus)
VALUES('Draama'), ('Detektiiv');
SELECT * FROM zanr;

ALTER TABLE film ADD zanrID int;

ALTER TABLE film ADD CONSTRAINT fk_zanr
FOREIGN KEY (zanrID) REFERENCES zanr(zanrID);

UPDATE film SET zanrID=2 WHERE filmID=2
