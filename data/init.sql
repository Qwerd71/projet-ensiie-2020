CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,
    username VARCHAR NOT NULL,
    email VARCHAR NOT NULL,
    password VARCHAR NOT NULL,
    rights INTEGER,
    created_at TIMESTAMP WITH TIME ZONE
);

INSERT INTO "user" (username, email, created_at, rights)  VALUES ('unex', 'patati@patata.com', NOW(), 1);
INSERT INTO "user" (username, email, created_at, rights)  VALUES ('caillou', 'caillou@rocher.com', NOW(), 0);
INSERT INTO "user" (username, email, created_at, rights)  VALUES ('viteira', 'vivi@taira.com', NOW(), 0);
INSERT INTO "user" (username, email, created_at, rights)  VALUES ('césar', 'jule@cesar.com', NOW(), 0);
INSERT INTO "user" (username, email, created_at, rights)  VALUES ('gengis', 'gengis@khan.com', NOW(), 1);

CREATE TABLE IF NOT EXISTS "karas" (
    id INTEGER PRIMARY KEY,
    song_name   TEXT    NOT NULL,
    source_name TEXT    NOT NULL,
    category    TEXT NOT NULL,
    song_type   TEXT NOT NULL,
    song_number INTEGER NOT NULL CHECK(song_number > 0),
    language    TEXT,
    is_new      INTEGER NOT NULL,
    author_name TEXT
);


INSERT INTO "karas" (id, song_name, source_name, category, song_type, song_number, language, is_new, author_name) VALUES (1,'GUNDAM WING italian','Gundam Wing','OP','va',1,'it',0,'Viieux');
INSERT INTO "karas" (id, song_name, source_name, category, song_type, song_number, language, is_new, author_name) VALUES (2,'Something','Nadia il Mistero della Pietra Azzura','MV','va',1,'it',0,'Viieux');
INSERT INTO "karas" (id, song_name, source_name, category, song_type, song_number, language, is_new, author_name) VALUES (3,'version italienne','Maple Town Un Nido di Simpatia','OP','va',1,'it',0,'Viieux');
INSERT INTO "karas" (id, song_name, source_name, category, song_type, song_number, language, is_new, author_name) VALUES (4,'God Knows (russian)','Suzumiya Haruhi no Yuuutsu','IS','va',1,'ru',0,'Colgate');
INSERT INTO "karas" (id, song_name, source_name, category, song_type, song_number, language, is_new, author_name) VALUES (5,'Wu Ya','Hitori no Shita The Outcast S2','OP','va',1,'ch',0,'Sting');
INSERT INTO "karas" (id, song_name, source_name, category, song_type, song_number, language, is_new, author_name) VALUES (6,'Xin Yang','Quan Zhi Gao Shou','OP','va',1,'ch',0,'Sting');
INSERT INTO "karas" (id, song_name, source_name, category, song_type, song_number, language, is_new, author_name) VALUES (7,'Franklin','Franklin','OP','va',1,'fr',0,'Phoko');
INSERT INTO "karas" (id, song_name, source_name, category, song_type, song_number, language, is_new, author_name) VALUES (8,'Pegasus Fantasy (VF)','Saint Seiya','OP','va',1,'fr',0,'Viieux');
INSERT INTO "karas" (id, song_name, source_name, category, song_type, song_number, language, is_new, author_name) VALUES (9,'Opening','Sailor Moon','OP','va',1,'fr',0,'Viieux');

CREATE TABLE IF NOT EXISTS "queue" (
    position INTEGER PRIMARY KEY,
    id INTEGER NOT NULL REFERENCES karas
);

CREATE TABLE IF NOT EXISTS "playlist" (
    id INTEGER PRIMARY KEY,
    nom TEXT NOT NULL,
    createur SERIAL REFERENCES "user",
    content id[] REFERENCES karas
);


CREATE TABLE IF NOT EXISTS "userCosmetics"(
	id SERIAL PRIMARY KEY,
	IDimage INTEGER,
        IDtitle INTEGER
);

CREATE TABLE IF NOT EXISTS "image"(
	IDimage SERIAL PRIMARY KEY,
	image VARCHAR 
);

CREATE TABLE IF NOT EXISTS "title"(
	IDtitle SERIAL PRIMARY KEY,
	title VARCHAR 
);


CREATE TABLE IF NOT EXISTS "lector"(
    id INTEGER PRIMARY KEY REFERENCES karas,
    ip VARCHAR,
    port INTEGER
);

--INSERT INTO "lector" (id, ip, port)  VALUES (1, '127.0.0.1', 6600);
INSERT INTO "lector" (id, ip, port)  VALUES (1, '::1', 6600);
INSERT INTO "lector" (id, ip, port)  VALUES (2, '12.2.3.4', 1234);

