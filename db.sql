BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "polls_choice" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"choice_text"	varchar(200) NOT NULL,
	"votes"	integer NOT NULL,
	"choice_question_id"	integer NOT NULL,
	FOREIGN KEY("choice_question_id") REFERENCES "polls_question"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "polls_question" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"question_text"	varchar(200) NOT NULL,
	"pub_date"	datetime NOT NULL
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"name"	varchar(150) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"first_name"	varchar(30) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"last_name"	varchar(150) NOT NULL
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag">=0),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL
);
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
INSERT INTO "django_session" VALUES ('hii181phonanj1xoigps1eq2jqfdgyne','NzQ1NDg2YmEyMTc5M2ExN2RiYjcwNTY3OGY2NDliOGExZTVlMWE3MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMzBmODUwZGQxN2RkZDBhNjBjMjMxNzRmNDRhNzc2YThiZWUxNTY0In0=','2019-09-22 09:01:43.294700');
INSERT INTO "django_session" VALUES ('phqe3lvtv3xps8k2f6cumg7ztgsjxpsx','NzQ1NDg2YmEyMTc5M2ExN2RiYjcwNTY3OGY2NDliOGExZTVlMWE3MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMzBmODUwZGQxN2RkZDBhNjBjMjMxNzRmNDRhNzc2YThiZWUxNTY0In0=','2019-09-23 01:43:27.160082');
INSERT INTO "polls_question" VALUES (1,'Which artist do you prefer, Nicki Minaj or Cardi B?','2019-09-08 09:04:09');
INSERT INTO "polls_question" VALUES (2,'Which of Katy Perry''s singles have you ever heard?','2019-09-08 09:04:34');
INSERT INTO "auth_user" VALUES (1,'pbkdf2_sha256$150000$RdEo8Ws8QzI4$6coF/MyusRypHVT9N29xAh58EQ/ta+bVLcYD4JY9E9o=','2019-09-09 01:43:27.158234',1,'admin','','admin@myawesomesite.com',1,1,'2019-09-08 09:01:21.690458','');
INSERT INTO "auth_permission" VALUES (1,1,'add_question','Can add question');
INSERT INTO "auth_permission" VALUES (2,1,'change_question','Can change question');
INSERT INTO "auth_permission" VALUES (3,1,'delete_question','Can delete question');
INSERT INTO "auth_permission" VALUES (4,1,'view_question','Can view question');
INSERT INTO "auth_permission" VALUES (5,2,'add_choice','Can add choice');
INSERT INTO "auth_permission" VALUES (6,2,'change_choice','Can change choice');
INSERT INTO "auth_permission" VALUES (7,2,'delete_choice','Can delete choice');
INSERT INTO "auth_permission" VALUES (8,2,'view_choice','Can view choice');
INSERT INTO "auth_permission" VALUES (9,3,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (10,3,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (11,3,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (12,3,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (13,4,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (14,4,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (15,4,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (16,4,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (17,5,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (18,5,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (19,5,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (20,5,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (21,6,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (22,6,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (23,6,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (24,6,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (25,7,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (26,7,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (27,7,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (28,7,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (29,8,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (30,8,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (31,8,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (32,8,'view_session','Can view session');
INSERT INTO "django_content_type" VALUES (1,'polls','question');
INSERT INTO "django_content_type" VALUES (2,'polls','choice');
INSERT INTO "django_content_type" VALUES (3,'admin','logentry');
INSERT INTO "django_content_type" VALUES (4,'auth','permission');
INSERT INTO "django_content_type" VALUES (5,'auth','group');
INSERT INTO "django_content_type" VALUES (6,'auth','user');
INSERT INTO "django_content_type" VALUES (7,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (8,'sessions','session');
INSERT INTO "django_admin_log" VALUES (1,'2019-09-08 09:04:10.147038','1','Which artist do you prefer, Nicki Minaj or Cardi B?','[{"added": {}}]',1,1,1);
INSERT INTO "django_admin_log" VALUES (2,'2019-09-08 09:04:36.414878','2','Which of Katy Perry''s songs have you ever heard?','[{"added": {}}]',1,1,1);
INSERT INTO "django_admin_log" VALUES (3,'2019-09-08 10:06:15.829969','1','Nicki Minaj','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (4,'2019-09-08 10:06:23.653021','2','Cardi B','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (5,'2019-09-08 10:06:30.910415','3','Firework','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (6,'2019-09-08 10:06:54.315355','4','Last Friday Night','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (7,'2019-09-08 10:07:29.830517','5','I Kissed a Girl','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (8,'2019-09-08 10:07:39.259814','6','Thinking of You','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (9,'2019-09-08 10:07:47.837030','7','Hot n Cold','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (10,'2019-09-08 10:07:59.032239','8','E.T.','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (11,'2019-09-08 10:08:11.211969','9','The One That Got Away','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (12,'2019-09-08 10:08:16.821494','10','Wide Awake','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (13,'2019-09-08 10:08:25.216962','11','Roar','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (14,'2019-09-08 10:08:31.802325','12','Unconditionally','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (15,'2019-09-08 10:08:42.035775','13','Dark Horse','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (16,'2019-09-08 10:08:47.439252','14','Birthday','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (17,'2019-09-08 10:09:04.122998','15','This Is How We Do','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (18,'2019-09-08 10:09:09.647939','16','Rise','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (19,'2019-09-08 10:09:17.736669','17','Chained to the Rhythm','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (20,'2019-09-08 10:09:31.523753','18','Bon Appétit','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (21,'2019-09-08 10:09:39.869383','19','Swish Swish','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (22,'2019-09-08 10:09:51.188761','20','Hey Hey Hey','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (23,'2019-09-08 10:09:56.783459','21','365','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (24,'2019-09-08 10:10:06.217141','22','Never Really Over','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (25,'2019-09-08 10:10:14.824970','23','Small Talk','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (26,'2019-09-08 10:10:23.192064','2','Which of Katy Perry''s singles have you ever heard?','[{"changed": {"fields": ["question_text"]}}]',1,1,2);
INSERT INTO "django_admin_log" VALUES (27,'2019-09-08 10:13:32.190132','23','Small Talk','[{"changed": {"fields": ["votes"]}}]',2,1,2);
INSERT INTO "django_admin_log" VALUES (28,'2019-09-08 10:13:54.001788','4','Last Friday Night','[{"changed": {"fields": ["votes"]}}]',2,1,2);
INSERT INTO "django_admin_log" VALUES (29,'2019-09-08 10:14:03.970095','22','Never Really Over','[{"changed": {"fields": ["votes"]}}]',2,1,2);
INSERT INTO "django_admin_log" VALUES (30,'2019-09-08 10:14:12.393500','23','Small Talk','[{"changed": {"fields": ["votes"]}}]',2,1,2);
INSERT INTO "django_admin_log" VALUES (31,'2019-09-08 10:14:37.150215','24','Teenage Dream','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (32,'2019-09-09 01:43:39.705769','25','Part of Me','[{"added": {}}]',2,1,1);
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2019-09-08 08:56:21.277364');
INSERT INTO "django_migrations" VALUES (2,'auth','0001_initial','2019-09-08 08:56:21.290150');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2019-09-08 08:56:21.298224');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2019-09-08 08:56:21.308368');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2019-09-08 08:56:21.325829');
INSERT INTO "django_migrations" VALUES (6,'contenttypes','0002_remove_content_type_name','2019-09-08 08:56:21.344019');
INSERT INTO "django_migrations" VALUES (7,'auth','0002_alter_permission_name_max_length','2019-09-08 08:56:21.349920');
INSERT INTO "django_migrations" VALUES (8,'auth','0003_alter_user_email_max_length','2019-09-08 08:56:21.358185');
INSERT INTO "django_migrations" VALUES (9,'auth','0004_alter_user_username_opts','2019-09-08 08:56:21.366575');
INSERT INTO "django_migrations" VALUES (10,'auth','0005_alter_user_last_login_null','2019-09-08 08:56:21.374735');
INSERT INTO "django_migrations" VALUES (11,'auth','0006_require_contenttypes_0002','2019-09-08 08:56:21.375999');
INSERT INTO "django_migrations" VALUES (12,'auth','0007_alter_validators_add_error_messages','2019-09-08 08:56:21.383518');
INSERT INTO "django_migrations" VALUES (13,'auth','0008_alter_user_username_max_length','2019-09-08 08:56:21.394587');
INSERT INTO "django_migrations" VALUES (14,'auth','0009_alter_user_last_name_max_length','2019-09-08 08:56:21.404519');
INSERT INTO "django_migrations" VALUES (15,'auth','0010_alter_group_name_max_length','2019-09-08 08:56:21.412059');
INSERT INTO "django_migrations" VALUES (16,'auth','0011_update_proxy_permissions','2019-09-08 08:56:21.418099');
INSERT INTO "django_migrations" VALUES (17,'polls','0001_initial','2019-09-08 08:56:21.422715');
INSERT INTO "django_migrations" VALUES (18,'sessions','0001_initial','2019-09-08 08:56:21.425464');
INSERT INTO "django_migrations" VALUES (19,'polls','0002_auto_20190908_1600','2019-09-08 09:00:25.894305');
CREATE INDEX IF NOT EXISTS "polls_choice_choice_question_id_c24e892e" ON "polls_choice" (
	"choice_question_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
COMMIT;
