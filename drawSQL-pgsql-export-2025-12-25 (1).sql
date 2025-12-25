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
    "genres" ADD PRIMARY KEY("idint");
CREATE TABLE "games_genres"(
    "id" SERIAL NOT NULL,
    "game_id" INTEGER NOT NULL,
    "genre_id" INTEGER NOT NULL
);
ALTER TABLE
    "games_genres" ADD PRIMARY KEY("id");
ALTER TABLE
    "games_genres" ADD CONSTRAINT "games_genres_genre_id_foreign" FOREIGN KEY("genre_id") REFERENCES "genres"("idint");
ALTER TABLE
    "games_genres" ADD CONSTRAINT "games_genres_game_id_foreign" FOREIGN KEY("game_id") REFERENCES "games"("id");
ALTER TABLE
    "games" ADD CONSTRAINT "games_developer_id_foreign" FOREIGN KEY("developer_id") REFERENCES "developers"("id");