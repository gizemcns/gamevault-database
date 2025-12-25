
/* =====================================================
   BÖLÜM 1: TABLO OLUŞTURMA (DDL)
   ===================================================== */


CREATE TABLE "developers"(
    "id" SERIAL NOT NULL,
    "company_name" VARCHAR(255) NOT NULL,
    "country" VARCHAR(255) NOT NULL,
    "founded_year" INTEGER NOT NULL
);
ALTER TABLE
    "developers" ADD PRIMARY KEY("id");

CREATE TABLE "games"(
    "id" SERIAL NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "price" DECIMAL(8, 2) NOT NULL,
    "release_date" DATE NOT NULL,
    "rating" DECIMAL(8, 2) NOT NULL,
    "developer_id" INTEGER NOT NULL
);
ALTER TABLE
    "games" ADD PRIMARY KEY("id");


CREATE TABLE "genres"(
    "idint" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL
);
ALTER TABLE
    "genres" ADD PRIMARY KEY("id");


CREATE TABLE "games_genres"(
    "id" SERIAL NOT NULL,
    "game_id" INTEGER NOT NULL,
    "genre_id" INTEGER NOT NULL
);

ALTER TABLE genres
RENAME COLUMN idint TO id;

ALTER TABLE genres
ADD PRIMARY KEY (id);

ALTER TABLE
    "games_genres" ADD PRIMARY KEY("id");
ALTER TABLE
    "games_genres" ADD CONSTRAINT "games_genres_genre_id_foreign" FOREIGN KEY("genre_id") REFERENCES "genres"("id");
ALTER TABLE
    "games_genres" ADD CONSTRAINT "games_genres_game_id_foreign" FOREIGN KEY("game_id") REFERENCES "games"("id");
ALTER TABLE
    "games" ADD CONSTRAINT "games_developer_id_foreign" FOREIGN KEY("developer_id") REFERENCES "developers"("id");







/* =====================================================
   BÖLÜM 2: VERİ EKLEME (DML - INSERT)
   ===================================================== */

INSERT INTO developers (company_name, country, founded_year) VALUES
('CD Projekt Red', 'Poland', 2002),
('Rockstar Games', 'USA', 1998),
('Bethesda', 'USA', 1986),
('Valve', 'USA', 1996),
('Ubisoft', 'France', 1986),
('Electronic Arts', 'USA', 1982),
('Activision', 'USA', 1979),
('Naughty Dog', 'USA', 1984),
('Square Enix', 'Japan', 1975),
('FromSoftware', 'Japan', 1986);

INSERT INTO genres (name, description) VALUES
('RPG', 'Role Playing Game'),
('Open World', 'Açık dünya keşif'),
('FPS', 'First Person Shooter'),
('Action', 'Aksiyon temalı oyunlar'),
('Adventure', 'Macera türü'),
('Horror', 'Korku oyunları'),
('Sports', 'Spor oyunları'),
('Strategy', 'Strateji oyunları'),
('Simulation', 'Simülasyon oyunları'),
('Soulslike', 'Zorlayıcı aksiyon RPG');


INSERT INTO games (title, price, release_date, rating, developer_id) VALUES
('The Witcher 3', 800.00, '2015-05-19', 9.5, 1),
('Cyberpunk 2077', 700.00, '2020-12-10', 8.5, 1),
('GTA V', 900.00, '2013-09-17', 9.7, 2),
('Red Dead Redemption 2', 1000.00, '2018-10-26', 9.8, 2),
('Skyrim', 600.00, '2011-11-11', 9.4, 3),
('DOOM Eternal', 500.00, '2020-03-20', 9.0, 3),
('Half-Life 2', 300.00, '2004-11-16', 9.6, 4),
('Assassin’s Creed Valhalla', 850.00, '2020-11-10', 8.5, 5),
('FIFA 23', 750.00, '2022-09-30', 8.2, 6),
('Elden Ring', 900.00, '2022-02-25', 9.9, 10),
('The Last of Us Part I', 950.00, '2022-09-02', 9.8, 8);



INSERT INTO games_genres (game_id, genre_id) VALUES
-- The Witcher 3
(1, 1), (1, 2), (1, 5),

-- Cyberpunk 2077
(2, 1), (2, 2), (2, 4),

-- GTA V
(3, 2), (3, 4),

-- Red Dead Redemption 2
(4, 2), (4, 5),

-- Skyrim
(5, 1), (5, 2),

-- DOOM Eternal
(6, 3), (6, 4),

-- Half-Life 2
(7, 3), (7, 5),

-- Assassin’s Creed Valhalla
(8, 1), (8, 2), (8, 4),

-- FIFA 23
(9, 7),

-- Elden Ring
(10, 1), (10, 4), (10, 10),

-- The Last of Us Part I
(11, 4), (11, 5);




SELECT COUNT(*) FROM developers;
SELECT COUNT(*) FROM genres;
SELECT COUNT(*) FROM games;
SELECT COUNT(*) FROM games_genres;







/* =====================================================
   BÖLÜM 3: GÜNCELLEME ve SİLME
   ===================================================== */

/* 1. İndirim Zamanı: Tüm oyunların fiyatını %10 düşür */
UPDATE games
SET price = price * 0.9;

/* 2. Hata Düzeltme: Cyberpunk 2077 puanını 9.0 yap */
UPDATE games
SET rating = 9.0
WHERE title = 'Cyberpunk 2077';

/* 3. Kaldırma: CS:GO oyununu sil */
DELETE FROM games
WHERE title = 'CS:GO';


select * from games;




/* =====================================================
   BÖLÜM 4: RAPORLAMA (SELECT & JOIN)
   ===================================================== */

/* 1. Tüm Oyunlar Listesi */
SELECT g.title AS oyun_adi, g.price AS fiyat, d.company_name AS gelistirici
FROM games g
JOIN developers d ON g.developer_id = d.id;

/* 2. Sadece RPG Türündeki Oyunlar */
SELECT g.title AS oyun_adi, g.rating AS puan
FROM games g
JOIN games_genres gg ON g.id = gg.game_id
JOIN genres ge ON gg.genre_id = ge.id
WHERE ge.name = 'RPG';

/* 3. Fiyatı 500 TL Üzeri Oyunlar */
SELECT title, price
FROM games
WHERE price > 500
ORDER BY price DESC;

/* 4. İçinde "War" Geçen Oyunlar */
SELECT title
FROM games
WHERE title LIKE '%war%';












