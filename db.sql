BEGIN TRANSACTION;
/* Question SQL dialects for reference

CREATE TABLE IF NOT EXISTS "polls_choice" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"choice_text"	varchar(200) NOT NULL,
	"votes"	integer NOT NULL,
	"choice_question_id"	integer NOT NULL,
	FOREIGN KEY("choice_question_id") REFERENCES "polls_question"("id") DEFERRABLE INITIALLY DEFERRED
);

CREATE TABLE IF NOT EXISTS "polls_question" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"question_text"	varchar(200) NOT NULL,
	"pub_date"	datetime NOT NULL
); */

INSERT INTO "polls_choice" VALUES (1,'Nicki Minaj',0,1);
INSERT INTO "polls_choice" VALUES (2,'Cardi B',1,1);
INSERT INTO "polls_choice" VALUES (3,'Firework',0,2);
INSERT INTO "polls_choice" VALUES (4,'Last Friday Night',1,2);
INSERT INTO "polls_choice" VALUES (5,'I Kissed a Girl',0,2);
INSERT INTO "polls_choice" VALUES (6,'Thinking of You',0,2);
INSERT INTO "polls_choice" VALUES (7,'Hot n Cold',0,2);
INSERT INTO "polls_choice" VALUES (8,'E.T.',1,2);
INSERT INTO "polls_choice" VALUES (9,'The One That Got Away',0,2);
INSERT INTO "polls_choice" VALUES (10,'Wide Awake',0,2);
INSERT INTO "polls_choice" VALUES (11,'Roar',1,2);
INSERT INTO "polls_choice" VALUES (12,'Unconditionally',0,2);
INSERT INTO "polls_choice" VALUES (13,'Dark Horse',1,2);
INSERT INTO "polls_choice" VALUES (14,'Birthday',0,2);
INSERT INTO "polls_choice" VALUES (15,'This Is How We Do',0,2);
INSERT INTO "polls_choice" VALUES (16,'Rise',0,2);
INSERT INTO "polls_choice" VALUES (17,'Chained to the Rhythm',0,2);
INSERT INTO "polls_choice" VALUES (18,'Bon Appétit',0,2);
INSERT INTO "polls_choice" VALUES (19,'Swish Swish',0,2);
INSERT INTO "polls_choice" VALUES (20,'Hey Hey Hey',0,2);
INSERT INTO "polls_choice" VALUES (21,'365',0,2);
INSERT INTO "polls_choice" VALUES (22,'Never Really Over',1,2);
INSERT INTO "polls_choice" VALUES (23,'Small Talk',1,2);
INSERT INTO "polls_choice" VALUES (24,'Teenage Dream',0,2);
INSERT INTO "polls_choice" VALUES (25,'Part of Me',1,2);
INSERT INTO "polls_question" VALUES (1,'Which artist do you prefer, Nicki Minaj or Cardi B?','2019-09-08 09:04:09');
INSERT INTO "polls_question" VALUES (2,'Which of Katy Perry''s singles have you ever heard?','2019-09-08 09:04:34');

COMMIT;
