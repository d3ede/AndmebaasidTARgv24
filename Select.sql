CREATE DATABASE OrlovSelect
USE OrlovSelect

CREATE TABLE laps(
lapsID int primary key identity(1,1),
nimi varchar(10) not null,
pikkus smallint,
synniaasta smallint,
synnilinn varchar(20)
);
SELECT * FROM laps;

INSERT INTO laps(nimi, pikkus, synniaasta, synnilinn)
VALUES
('Kati', 156, 2001, 'Tallinn'),
('Nikita', 166, 2002, 'Tartu'),
('Mati', 172, 2005, 'Tallinn'),
('Pati', 184, 2002, 'Tallinn'),
('Sati', 181, 2007, 'Tallinn');
-- Сортировка
SELECT nimi, pikkus
FROM laps
ORDER by pikkus DESC, nimi;
-- Asc or Desc - По возрастанию и убыванию
SELECT nimi, synniaasta
FROM laps
WHERE synniaasta >=2005
ORDER by nimi;
-- Distinct - Вывести повторы единожды
SELECT DISTINCT synniaasta
FROM laps
WHERE synniaasta >2000;
-- Between
SELECT nimi, synniaasta
FROM laps
WHERE synniaasta >=2000 AND synniaasta <=2005

SELECT nimi, synniaasta
FROM laps
WHERE synniaasta BETWEEN 2000 AND 2005;
-- Like - Сравнение
SELECT nimi 
FROM laps
WHERE nimi LIKE '%K%';

SELECT nimi 
FROM laps
WHERE nimi LIKE '_a__';
-- % - Означает неограниченное количество символов; _ - Означает определённое количество символов

-- AND / OR
SELECT nimi, synnilinn
FROM laps
WHERE nimi LIKE 'K%'
OR synnilinn LIKE 'Tartu';

SELECT nimi, synnilinn
FROM laps
WHERE nimi LIKE 'K%'
AND synnilinn LIKE 'Tartu';
-- Agregaatfunktsioonid
SUM, AVG, MIN, MAX, COUNT
SELECT COUNT(nimi) AS 'lasteArv'
FROM laps;

SELECT AVG(pikkus) AS 'keskmine pikkus'
FROM laps
WHERE synnilinn='Tallinn';
-- GROUP by
SELECT AVG(pikkus) AS 'keskmine pikkus', synnilinn
FROM laps
GROUP by synnilinn;
-- Näita laste arv, mis on sündinud konkreetsel  synniaastal
SELECT synniaasta, COUNT(*) AS lasteArv
FROM laps
GROUP by synniaasta;
-- HAVING
SELECT synniaasta, AVG(pikkus) AS keskmine
FROM laps
GROUP by synniaasta
HAVING AVG(pikkus)>150;

SELECT synniaasta, AVG(pikkus) AS keskmine
FROM laps
WHERE NOT synniaasta=2001
GROUP by synniaasta;

CREATE TABLE loom(
loomID int PRIMARY KEY identity(1,1),
loomNimi varchar(50),
lapsID int,
FOREIGN KEY (lapsID) REFERENCES laps(lapsID)
);
INSERT INTO loom(loomNimi, lapsID)
VALUES
('kass Kott', 1),
('koer Bobik', 1),
('koer Tuzik', 2),
('kass Mura', 3),
('kass Kit', 3),
('klipkonn', 3);

SELECT * FROM loom, laps; -- Неправильно

SELECT * FROM loom
INNER JOIN laps
ON loom.lapsID=laps.lapsID; -- Правильно

SELECT * FROM loom, laps
WHERE loom.lapsID=laps.lapsID; -- Правильно, проще
