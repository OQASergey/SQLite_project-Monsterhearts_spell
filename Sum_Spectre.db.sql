BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Ingredients" (
	"Ingred_ID"	integer,
	"Первый_ингредиент_верен"	varchar(3),
	"Второй_ингредиент_верен"	varchar(3),
	"Ingred_result"	INTEGER,
	PRIMARY KEY("Ingred_ID")
);
CREATE TABLE IF NOT EXISTS "Place" (
	"Place_id"	INTEGER,
	"В_месте_ритуала_какая_аура"	varchar(10),
	"Place_result"	varchar(20),
	PRIMARY KEY("Place_id")
);
CREATE TABLE IF NOT EXISTS "Time_of_end" (
	"Time_id"	INTEGER,
	"Когда_дух_отделился"	varchar(10),
	"Time_result"	varchar(20),
	PRIMARY KEY("Time_id")
);
CREATE TABLE IF NOT EXISTS "Catalyst" (
	"Catal_id"	INTEGER,
	"Отношение_заклинателя_к_тому_чью_сущность_он_использует_для_ритуала"	varchar(10),
	"Catal_result"	varchar(20),
	PRIMARY KEY("Catal_id")
);
CREATE TABLE IF NOT EXISTS "Pre_Results" (
	"Total_result"	INTEGER,
	"Welcome"	varchar(55),
	"Spell_bug_major"	varchar(70),
	"Spell_bug_blocker"	varchar(310),
	PRIMARY KEY("Total_result")
);
CREATE TABLE IF NOT EXISTS "Main_table" (
	"Prim_key"	INTEGER,
	"Ingred_result"	INTEGER,
	"Place_id"	INTEGER,
	"Catal_id"	INTEGER,
	"Time_id"	INTEGER,
	"Total_result"	INTEGER,
	FOREIGN KEY("Place_id") REFERENCES "Place"("Place_id"),
	PRIMARY KEY("Prim_key"),
	FOREIGN KEY("Total_result") REFERENCES "Pre_Results"("Total_result"),
	FOREIGN KEY("Time_id") REFERENCES "Time_of_end"("Time_id"),
	FOREIGN KEY("Catal_id") REFERENCES "Catalyst"("Catal_id")
);
CREATE TABLE IF NOT EXISTS "Consequences" (
	"Prim_key"	INTEGER,
	"Total_result"	INTEGER,
	"Cons_result"	varchar(200),
	"Resp_result"	varchar(200),
	"Void_eye"	varchar(100),
	PRIMARY KEY("Prim_key"),
	FOREIGN KEY("Total_result") REFERENCES "Pre_Results"("Total_result")
);
INSERT INTO "Ingredients" VALUES (1,'Да','Да',1);
INSERT INTO "Ingredients" VALUES (2,'Да','Нет',0);
INSERT INTO "Ingredients" VALUES (3,'Нет','Да',0);
INSERT INTO "Ingredients" VALUES (4,'Нет','Нет',0);
INSERT INTO "Place" VALUES (1,'Нет ауры',NULL);
INSERT INTO "Place" VALUES (2,'Слабая аура',' Призрак появляется, однако всего на несколько минут');
INSERT INTO "Place" VALUES (3,'Сильная аура',' Призрак появляется, и точно надолго');
INSERT INTO "Place" VALUES (4,'Рядом с сосудом',' Призрак появляется, и точно надолго');
INSERT INTO "Time_of_end" VALUES (1,'До 24 часов',' его память и личность не пострадали');
INSERT INTO "Time_of_end" VALUES (2,'24-48 часов',' его память и личность деградировали');
INSERT INTO "Time_of_end" VALUES (3,'Более 48 часов',NULL);
INSERT INTO "Catalyst" VALUES (1,'Пофигизм','. Он кажется апатичным, абсолютно отрешенным');
INSERT INTO "Catalyst" VALUES (2,'Альтруизм','. Он полностью свободен в своих желаниях');
INSERT INTO "Catalyst" VALUES (3,'Эгоизм','. Он явно одержим своими незавершёнными делами');
INSERT INTO "Pre_Results" VALUES (1,'Ты читаешь заклинание, смешав все ингредиенты, и...',' Заклинание не сработало. Вероятно выбраны неправильные ингредиенты',NULL);
INSERT INTO "Pre_Results" VALUES (2,'Ты читаешь заклинание, смешав все ингредиенты, и...',' Заклинание не сработало. Вероятно выбрано неправильное место',NULL);
INSERT INTO "Pre_Results" VALUES (3,'Ты читаешь заклинание, смешав все ингредиенты, и...',', и совершенно не замечает ничего вокруг',NULL);
INSERT INTO "Pre_Results" VALUES (4,'Ты читаешь заклинание, смешав все ингредиенты, и...',' Заклинание не сработало. Духа давно уже нет',NULL);
INSERT INTO "Pre_Results" VALUES (5,'Ты читаешь заклинание, смешав все ингредиенты, и...',NULL,NULL);
INSERT INTO "Pre_Results" VALUES (6,'Ты читаешь заклинание, смешав все ингредиенты, и...',NULL,NULL);
INSERT INTO "Pre_Results" VALUES (7,'Ты читаешь заклинание, смешав все ингредиенты, и...',NULL,NULL);
INSERT INTO "Pre_Results" VALUES (8,'Ты читаешь заклинание, смешав все ингредиенты, и...',', и совершенно не замечает ничего вокруг',NULL);
INSERT INTO "Pre_Results" VALUES (9,'Ты читаешь заклинание, смешав все ингредиенты, и...',NULL,NULL);
INSERT INTO "Pre_Results" VALUES (10,'Ты читаешь заклинание, смешав все ингредиенты, и...',NULL,NULL);
INSERT INTO "Pre_Results" VALUES (11,'Ты читаешь заклинание, смешав все ингредиенты, и...',NULL,NULL);
INSERT INTO "Pre_Results" VALUES (12,'Ты читаешь заклинание, смешав все ингредиенты, и... Призрак не появляется. Первое время вообще ничего не происходит до тех пор, пока',', но в глазах затаился неутолимый голод',' ты не замечаешь движаение. Тело медленно встаёт, неуверенно покачиваясь. Оно явно одержимо своими незавершёнными делами. Судя по всему');
INSERT INTO "Pre_Results" VALUES (13,'Ты читаешь заклинание, смешав все ингредиенты, и... Призрак не появляется. Первое время вообще ничего не происходит до тех пор, пока',', а в глазах затаился неутолимый голод',' ты не замечаешь движаение. Тело медленно встаёт, неуверенно покачиваясь. Оно явно одержимо своими незавершёнными делами. Судя по всему');
INSERT INTO "Main_table" VALUES (1,0,1,1,1,1);
INSERT INTO "Main_table" VALUES (2,0,1,1,2,1);
INSERT INTO "Main_table" VALUES (3,0,1,1,3,1);
INSERT INTO "Main_table" VALUES (4,0,1,2,1,1);
INSERT INTO "Main_table" VALUES (5,0,1,2,2,1);
INSERT INTO "Main_table" VALUES (6,0,1,2,3,1);
INSERT INTO "Main_table" VALUES (7,0,1,3,1,1);
INSERT INTO "Main_table" VALUES (8,0,1,3,2,1);
INSERT INTO "Main_table" VALUES (9,0,1,3,3,1);
INSERT INTO "Main_table" VALUES (10,0,2,1,1,1);
INSERT INTO "Main_table" VALUES (11,0,2,1,2,1);
INSERT INTO "Main_table" VALUES (12,0,2,1,3,1);
INSERT INTO "Main_table" VALUES (13,0,2,2,1,1);
INSERT INTO "Main_table" VALUES (14,0,2,2,2,1);
INSERT INTO "Main_table" VALUES (15,0,2,2,3,1);
INSERT INTO "Main_table" VALUES (16,0,2,3,1,1);
INSERT INTO "Main_table" VALUES (17,0,2,3,2,1);
INSERT INTO "Main_table" VALUES (18,0,2,3,3,1);
INSERT INTO "Main_table" VALUES (19,0,3,1,1,1);
INSERT INTO "Main_table" VALUES (20,0,3,1,2,1);
INSERT INTO "Main_table" VALUES (21,0,3,1,3,1);
INSERT INTO "Main_table" VALUES (22,0,3,2,1,1);
INSERT INTO "Main_table" VALUES (23,0,3,2,2,1);
INSERT INTO "Main_table" VALUES (24,0,3,2,3,1);
INSERT INTO "Main_table" VALUES (25,0,3,3,1,1);
INSERT INTO "Main_table" VALUES (26,0,3,3,2,1);
INSERT INTO "Main_table" VALUES (27,0,3,3,3,1);
INSERT INTO "Main_table" VALUES (28,0,4,1,1,1);
INSERT INTO "Main_table" VALUES (29,0,4,1,2,1);
INSERT INTO "Main_table" VALUES (30,0,4,1,3,1);
INSERT INTO "Main_table" VALUES (31,0,4,2,1,1);
INSERT INTO "Main_table" VALUES (32,0,4,2,2,1);
INSERT INTO "Main_table" VALUES (33,0,4,2,3,1);
INSERT INTO "Main_table" VALUES (34,0,4,3,1,1);
INSERT INTO "Main_table" VALUES (35,0,4,3,2,1);
INSERT INTO "Main_table" VALUES (36,0,4,3,3,1);
INSERT INTO "Main_table" VALUES (37,1,1,1,1,2);
INSERT INTO "Main_table" VALUES (38,1,1,1,2,2);
INSERT INTO "Main_table" VALUES (39,1,1,1,3,2);
INSERT INTO "Main_table" VALUES (40,1,1,2,1,2);
INSERT INTO "Main_table" VALUES (41,1,1,2,2,2);
INSERT INTO "Main_table" VALUES (42,1,1,2,3,2);
INSERT INTO "Main_table" VALUES (43,1,1,3,1,2);
INSERT INTO "Main_table" VALUES (44,1,1,3,2,2);
INSERT INTO "Main_table" VALUES (45,1,1,3,3,2);
INSERT INTO "Main_table" VALUES (46,1,2,1,1,3);
INSERT INTO "Main_table" VALUES (47,1,2,1,2,3);
INSERT INTO "Main_table" VALUES (48,1,2,1,3,4);
INSERT INTO "Main_table" VALUES (49,1,2,2,1,5);
INSERT INTO "Main_table" VALUES (50,1,2,2,2,6);
INSERT INTO "Main_table" VALUES (51,1,2,2,3,4);
INSERT INTO "Main_table" VALUES (52,1,2,3,1,6);
INSERT INTO "Main_table" VALUES (53,1,2,3,2,7);
INSERT INTO "Main_table" VALUES (54,1,2,3,3,4);
INSERT INTO "Main_table" VALUES (55,1,3,1,1,8);
INSERT INTO "Main_table" VALUES (56,1,3,1,2,8);
INSERT INTO "Main_table" VALUES (57,1,3,1,3,4);
INSERT INTO "Main_table" VALUES (58,1,3,2,1,9);
INSERT INTO "Main_table" VALUES (59,1,3,2,2,10);
INSERT INTO "Main_table" VALUES (60,1,3,2,3,4);
INSERT INTO "Main_table" VALUES (61,1,3,3,1,10);
INSERT INTO "Main_table" VALUES (62,1,3,3,2,11);
INSERT INTO "Main_table" VALUES (63,1,3,3,3,4);
INSERT INTO "Main_table" VALUES (64,1,4,1,1,8);
INSERT INTO "Main_table" VALUES (65,1,4,1,2,8);
INSERT INTO "Main_table" VALUES (66,1,4,1,3,4);
INSERT INTO "Main_table" VALUES (67,1,4,2,1,9);
INSERT INTO "Main_table" VALUES (68,1,4,2,2,10);
INSERT INTO "Main_table" VALUES (69,1,4,2,3,4);
INSERT INTO "Main_table" VALUES (70,1,4,3,1,12);
INSERT INTO "Main_table" VALUES (71,1,4,3,2,13);
INSERT INTO "Main_table" VALUES (72,1,4,3,3,4);
INSERT INTO "Consequences" VALUES (1,1,'. Может оно и к лучшему','... Не пора ли остановиться?',NULL);
INSERT INTO "Consequences" VALUES (2,2,'. Может оно и к лучшему','... Не пора ли остановиться?',NULL);
INSERT INTO "Consequences" VALUES (3,3,'. У потерянного между мирами призрака ещё есть возможность спокойно уйти','. Может всё же пора остановиться?',' Ты чувствуешь чей-то взгляд, и это точно не взгляд призрака.');
INSERT INTO "Consequences" VALUES (4,4,'. Может оно и к лучшему','... В любом случае больше ничего нельзя сделать.',NULL);
INSERT INTO "Consequences" VALUES (5,5,'. Если выбрать правильное место, то всё должно получиться',', однако может всё же пора остановиться?',' Ты чувствуешь чей-то взгляд, и это точно не взгляд призрака.');
INSERT INTO "Consequences" VALUES (6,6,'. Это уже не совсем тот человек, каким был когда-то','. Теперь наверное стоит остановиться. Точно хочешь продолжить?',' Ты чувствуешь чей-то взгляд, и это точно не взгляд призрака.');
INSERT INTO "Consequences" VALUES (7,7,'. Это уже совсем не тот человек, каким был когда-то','. Вот теперь то наверняка надо остановиться! Точно хочешь продолжить?',' Ты чувствуешь чей-то взгляд, и это точно не взгляд призрака.');
INSERT INTO "Consequences" VALUES (8,8,'. У потерянного между мирами призрака впереди долгие годы страданий',', и ответственность за случившееся целиком на тебе.',' Мгновение ты чувствуешь, как Бездна всматривается в тебя... Затем ощущение исчезает.');
INSERT INTO "Consequences" VALUES (9,9,'. Ритуал завершился без особых последствий',', а дальнейшая судьба призрака теперь на твоей ответсвенности.',' Мгновение ты чувствуешь, как Бездна всматривается в тебя... Затем ощущение исчезает.');
INSERT INTO "Consequences" VALUES (10,10,'. Это уже не совсем тот человек, каким был когда-то',', а ответсвенность за его дальнейшую судьбу и деяния будут теперь и на тебе.',' Мгновение ты чувствуешь, как Бездна всматривается в тебя... Затем ощущение исчезает.');
INSERT INTO "Consequences" VALUES (11,11,'. Это уже совсем не тот человек, каким был когда-то',', а ответсвенность за всё, что он впоследствии натворит, будет и на тебе тоже.',' Мгновение ты чувствуешь, как Бездна всматривается в тебя... Затем ощущение исчезает.');
INSERT INTO "Consequences" VALUES (12,12,'. Оно уже больше не человек, а что-то намного хуже',', а ответственность за всё, что оно впоследствии натворит, будет и на тебе тоже.',' Мгновение ты чувствуешь, как Бездна всматривается в тебя... Затем ощущение исчезает.');
INSERT INTO "Consequences" VALUES (13,13,'. Оно уже больше не человек, а что-то намного хуже',', а ответственность за всё, что оно впоследствии натворит, будет и на тебе тоже.',' Мгновение ты чувствуешь, как Бездна всматривается в тебя... Затем ощущение исчезает.');
COMMIT;
