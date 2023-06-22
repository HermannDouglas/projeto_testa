BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "agenda_local" (
	"id"	integer NOT NULL,
	"nome"	varchar(255) NOT NULL,
	"rua"	varchar(255) NOT NULL,
	"numero"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "agenda_convidado" (
	"id"	integer NOT NULL,
	"nome"	varchar(255) NOT NULL,
	"email"	varchar(254),
	"user_id"	integer NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "agenda_compromisso" (
	"id"	integer NOT NULL,
	"descricao"	varchar(255) NOT NULL,
	"data_inicio"	datetime,
	"data_fim"	datetime,
	"local_id"	bigint NOT NULL,
	"nota"	varchar(255),
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("local_id") REFERENCES "agenda_local"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "agenda_compromisso_convidados" (
	"id"	integer NOT NULL,
	"compromisso_id"	bigint NOT NULL,
	"convidado_id"	bigint NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("convidado_id") REFERENCES "agenda_convidado"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("compromisso_id") REFERENCES "agenda_compromisso"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "agenda_local" ("id","nome","rua","numero") VALUES (1,'UFAC','BR 364',250),
 (2,'Consultório médico','das Palmeiras',129),
 (3,'Casa do Tony','das Carmélias',12);
INSERT INTO "agenda_convidado" ("id","nome","email","user_id") VALUES (1,'Peter Parker','peter.parker@gmail.com',2),
 (2,'Tony Stark','tony.stark@outlook.com',3),
 (3,'Hermann Douglas','hermann@email.com',1),
 (4,'Bruce Wayne','bruce.banner@outlook.com',4),
 (5,'Diana Prince','diana.prince@gmail.com',5);
INSERT INTO "agenda_compromisso" ("id","descricao","data_inicio","data_fim","local_id","nota") VALUES (1,'Reunião do Estágio Supervisionado','2023-07-04 13:00:00','2023-07-04 13:30:00',1,NULL),
 (2,'Consulta oftalmológica','2023-07-10 14:00:00','2023-07-10 14:30:00',2,NULL),
 (3,'Festa de aniversário','2023-07-21 00:30:00','2023-07-20 05:00:00',3,NULL);
INSERT INTO "agenda_compromisso_convidados" ("id","compromisso_id","convidado_id") VALUES (1,1,1),
 (2,1,2),
 (3,1,3),
 (4,2,5),
 (5,2,1),
 (6,3,2),
 (7,3,3),
 (8,3,4),
 (9,3,1),
 (10,3,5);
INSERT INTO "auth_user" ("id","password","last_login","is_superuser","username","last_name","email","is_staff","is_active","date_joined","first_name") VALUES (1,'pbkdf2_sha256$600000$FtXokw9yYTt98t30Sjnh1D$BoHbhejWawUjwIEfSeHHPbLqF/zWIASkyWTAC8XyxQU=','2023-06-22 20:28:48.875116',1,'hermann','','hermann@email.com',1,1,'2023-06-22 19:49:55.832984',''),
 (2,'pbkdf2_sha256$600000$x9XCeqsoPT3WtQUY5TjH2a$Voo2TGCbi4f+w4YEjACFYsb+V+g7jj9T3EYM+bVfjeE=',NULL,0,'peter','','',0,1,'2023-06-22 20:02:12.721017',''),
 (3,'pbkdf2_sha256$600000$CEJncskW5fiR72otf8umrs$ZCSXWDzTPIRoOFlqJnXygdU7VRcsEgybpgUBGvzHpng=',NULL,0,'tony','','',0,1,'2023-06-22 20:03:08.303631',''),
 (4,'pbkdf2_sha256$600000$GlnfHLAthi11odILGUXir9$Qr+42xGhmiReLoJYtWDfTi8F8+oh8GiE6qiWkPqN/FE=',NULL,0,'bruce','','',0,1,'2023-06-22 20:08:32.207010',''),
 (5,'pbkdf2_sha256$600000$9DnJlO7At6KLoC8F4P1ySX$VdFJHxkKBy5kwfVzAJM/8SJU7YBCeMw3E4SC2bwBVeY=',NULL,0,'diana','','',0,1,'2023-06-22 20:09:27.125307','');
CREATE INDEX IF NOT EXISTS "agenda_compromisso_local_id_6a0efa28" ON "agenda_compromisso" (
	"local_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "agenda_compromisso_convidados_compromisso_id_convidado_id_965c568c_uniq" ON "agenda_compromisso_convidados" (
	"compromisso_id",
	"convidado_id"
);
CREATE INDEX IF NOT EXISTS "agenda_compromisso_convidados_compromisso_id_e079df9f" ON "agenda_compromisso_convidados" (
	"compromisso_id"
);
CREATE INDEX IF NOT EXISTS "agenda_compromisso_convidados_convidado_id_82005ea9" ON "agenda_compromisso_convidados" (
	"convidado_id"
);
COMMIT;
