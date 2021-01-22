/*
 Navicat PostgreSQL Data Transfer

 Source Server         : school
 Source Server Type    : PostgreSQL
 Source Server Version : 130001
 Source Host           : localhost:5432
 Source Catalog        : school
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 100000
 File Encoding         : 65001

 Date: 22/01/2021 13:52:13
*/


-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS "comment";
CREATE TABLE "comment" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "authorid" int4 NOT NULL,
  "authorfullname" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "authortype" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "submissionid" int4 NOT NULL,
  "createdat" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "updatedat" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "content" text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
INSERT INTO "comment" VALUES ('1', 111111111, 'Ayman Oudi', 'student', 1, '2021-01-20T21:26:55.065Z', '10/10/2020', 'Hi my name is ayman');
INSERT INTO "comment" VALUES ('2', 123123123, 'Alex Kesselman', 'teacher', 1, '2021-02-20T21:26:55.065Z', '20/10/2020', 'hello');
INSERT INTO "comment" VALUES ('3', 111111111, 'Ayman Oudi', 'student', 1, '2021-03-20T21:26:55.065Z', '20/20/2020', 'hi again');
INSERT INTO "comment" VALUES ('4', 111111111, 'Ayman Oudi', 'student', 2, '2021-04-20T21:26:55.065Z', '10/20/2020', 'meeeee');
INSERT INTO "comment" VALUES ('26774ffa-31ed-4eb6-b2c3-af65acf58d98', 123123123, 'Alex Kesselman', 'teacher', 1, '2021-04-20T21:26:55.065Z', '10/10/2020', 'vv');
INSERT INTO "comment" VALUES ('699c3597-efe1-4004-ba0a-eef9295f1658', 123123123, 'Alex Kesselman', 'teacher', 1, '2021-04-20T21:26:55.065Z', '10/10/2020', 'hh');
COMMIT;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS "course";
CREATE TABLE "course" (
  "id" int4 NOT NULL,
  "title" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "description" varchar(8191) COLLATE "pg_catalog"."default",
  "points" float4 NOT NULL,
  "createdat" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "updatedat" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of course
-- ----------------------------
BEGIN;
INSERT INTO "course" VALUES (1, 'Cryptology', 'Cryptology is the mathematics, such as number theory, and the application of formulas and algorithms, that underpin cryptography and cryptanalysis. Since the cryptanalysis concepts are highly specialized and complex, we concentrate here only on some of the key mathematical concepts behind cryptography.', 4, '26T08:30:57.138Z', '26T08:30:57.138Z');
INSERT INTO "course" VALUES (3, 'Real-Time Systems', 'A real-time system is a time-bound system which has well-defined, fixed time constraints. Processing must be done within the defined constraints or the system will fail. They either are event-driven or time-sharing.', 4.5, '26T08:30:57.138Z', '26T08:30:57.138Z');
INSERT INTO "course" VALUES (2, 'Algorithms', 'n mathematics and computer science, an algorithm (/ˈælɡərɪðəm/ ( listen)) is a finite sequence of well-defined, computer-implementable instructions, typically to solve a class of problems or to perform a computation.', 5, '2020-12-26T08:30:57.138Z', '2020-12-26T08:30:57.138Z');
INSERT INTO "course" VALUES (4, 'Advanced Web Technologies', 'The World Wide Web and its underlying technologies are increasingly gaining importance for the development of interactive Web applications.', 4, '26T08:30:57.138Z', '26T08:30:57.138Z');
COMMIT;

-- ----------------------------
-- Table structure for courseparticipants
-- ----------------------------
DROP TABLE IF EXISTS "courseparticipants";
CREATE TABLE "courseparticipants" (
  "id" int4 NOT NULL DEFAULT nextval('"CourseParticipants_id_seq"'::regclass),
  "personid" int4 NOT NULL,
  "courseid" int4 NOT NULL,
  "createdat" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "updatedat" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of courseparticipants
-- ----------------------------
BEGIN;
INSERT INTO "courseparticipants" VALUES (2, 111111111, 4, '2020-12-26T20:19:53.462Z', '2020-12-26T20:19:53.462Z');
INSERT INTO "courseparticipants" VALUES (3, 315798504, 4, '2020-12-26T20:19:53.462Z', '2020-12-26T20:19:53.462Z');
INSERT INTO "courseparticipants" VALUES (1, 123123123, 4, '2020-12-26T20:19:53.462Z', '2020-12-26T20:19:53.462Z');
COMMIT;

-- ----------------------------
-- Table structure for homework
-- ----------------------------
DROP TABLE IF EXISTS "homework";
CREATE TABLE "homework" (
  "id" int4 NOT NULL DEFAULT nextval('"Homework_id_seq"'::regclass),
  "courseid" int4 NOT NULL,
  "title" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "description" varchar(8191) COLLATE "pg_catalog"."default",
  "deadline" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "createdat" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "updatedat" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of homework
-- ----------------------------
BEGIN;
INSERT INTO "homework" VALUES (456, 4, 'HomeWork2', 'This is homework2 of Web', '30/10/2020', '20/10/2020', '20/10/2020');
INSERT INTO "homework" VALUES (123, 4, 'HomeWork1', 'This is homework1 of Web', '21/10/2020', '10/10/2020', '10/10/2020');
INSERT INTO "homework" VALUES (789, 4, 'HomeWork3', 'This is homework3 of Web', '20/11/2020', '10/11/2020', '10/11/2020');
COMMIT;

-- ----------------------------
-- Table structure for homework_file
-- ----------------------------
DROP TABLE IF EXISTS "homework_file";
CREATE TABLE "homework_file" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "path" varchar(511) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "updated_at" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "homework_id" int4 NOT NULL,
  "mimetype" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "title" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of homework_file
-- ----------------------------
BEGIN;
INSERT INTO "homework_file" VALUES ('53609361-7339-43c3-998c-95707069e303', 'uploads\1611234619007-8852_e_e_e_Important sheets.docx', '2021-01-21T13:10:20.062Z', '2021-01-21T13:10:20.062Z', 1, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Important sheets.docx');
INSERT INTO "homework_file" VALUES ('8232587b-dfeb-4a75-89f0-49e6108ef4b8', 'uploads\1611234630562-1418_e_e_e_Grades sheet.pdf', '2021-01-21T13:10:30.568Z', '2021-01-21T13:10:30.568Z', 1, 'application/pdf', 'Grades sheet.pdf');
INSERT INTO "homework_file" VALUES ('9f9c7161-2e9e-4b51-92bd-f6779cd1f61e', 'uploads\1611234641279-7590_e_e_e_Grades sheet.pdf', '2021-01-21T13:10:41.297Z', '2021-01-21T13:10:41.297Z', 1, 'application/pdf', 'Grades sheet.pdf');
INSERT INTO "homework_file" VALUES ('bdb3fb52-a7d3-47d1-8422-415ae5521507', 'uploads\1611234650185-1343_e_e_e_CV.docx', '2021-01-21T13:10:50.250Z', '2021-01-21T13:10:50.250Z', 1, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'CV.docx');
INSERT INTO "homework_file" VALUES ('acb86162-66e6-4ac9-a0f2-58d6279092d3', 'uploads\1611234665464-7_e_e_e_הצטיינות.jpg', '2021-01-21T13:11:05.477Z', '2021-01-21T13:11:05.477Z', 1, 'image/jpeg', 'הצטיינות.jpg');
INSERT INTO "homework_file" VALUES ('9386b486-91dc-4ed8-ba50-d6f82d0fe56c', 'uploads\1611234774171-6416_e_e_e_Grades sheet.pdf', '2021-01-21T13:12:54.179Z', '2021-01-21T13:12:54.179Z', 1, 'application/pdf', 'Grades sheet.pdf');
INSERT INTO "homework_file" VALUES ('84549515-b8be-41e4-87fb-bf99297ab3b2', 'uploads\1611234896569-5816_e_e_e_CV.docx', '2021-01-21T13:14:56.607Z', '2021-01-21T13:14:56.607Z', 1, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'CV.docx');
INSERT INTO "homework_file" VALUES ('85f50044-8b61-4a7d-a4c6-3336cf994122', 'uploads\1611234903785-8938_e_e_e_CV-Grades Sheet (3).pdf', '2021-01-21T13:15:03.816Z', '2021-01-21T13:15:03.816Z', 1, 'application/pdf', 'CV-Grades Sheet (3).pdf');
INSERT INTO "homework_file" VALUES ('a6573cef-ea20-4d68-94b2-43905f14ac82', 'uploads\1611234939832-7532_e_e_e_Important sheets.docx', '2021-01-21T13:15:39.848Z', '2021-01-21T13:15:39.848Z', 1, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Important sheets.docx');
INSERT INTO "homework_file" VALUES ('4f037f22-3e11-4e99-98b6-0c77fdeb7c4b', 'uploads\1611234960156-3787_e_e_e_הצטיינות.jpg', '2021-01-21T13:16:00.167Z', '2021-01-21T13:16:00.167Z', 1, 'image/jpeg', 'הצטיינות.jpg');
INSERT INTO "homework_file" VALUES ('e5d053d5-5cd8-44e6-8b7b-4b1b14aa5ab8', 'uploads\1611234979380-7587_e_e_e_Important sheets.pdf', '2021-01-21T13:16:19.393Z', '2021-01-21T13:16:19.393Z', 1, 'application/pdf', 'Important sheets.pdf');
INSERT INTO "homework_file" VALUES ('be39f321-8fdd-4ba9-a2f9-4c46be32df79', 'uploads\1611234995328-1843_e_e_e_Important sheets.pdf', '2021-01-21T13:16:35.345Z', '2021-01-21T13:16:35.345Z', 1, 'application/pdf', 'Important sheets.pdf');
INSERT INTO "homework_file" VALUES ('11856c8d-3fee-4309-950f-95538242c4d3', 'uploads\1611235030874-3788_e_e_e_הצטיינות.jpg', '2021-01-21T13:17:10.894Z', '2021-01-21T13:17:10.894Z', 1, 'image/jpeg', 'הצטיינות.jpg');
INSERT INTO "homework_file" VALUES ('5ef3c8cc-a05d-4471-afc5-e3964fa8af47', 'uploads\1611235039664-2978_e_e_e_הצטיינות.jpg', '2021-01-21T13:17:19.675Z', '2021-01-21T13:17:19.675Z', 1, 'image/jpeg', 'הצטיינות.jpg');
INSERT INTO "homework_file" VALUES ('8227b312-72cc-4330-a72b-433922adc475', 'uploads\1611235053298-104_e_e_e_הצטיינות.jpg', '2021-01-21T13:17:33.316Z', '2021-01-21T13:17:33.316Z', 1, 'image/jpeg', 'הצטיינות.jpg');
INSERT INTO "homework_file" VALUES ('a49fbd77-fe5c-4865-94a7-0f387e625f1c', 'uploads\1611235143802-744_e_e_e_CV-English.docx', '2021-01-21T13:19:03.809Z', '2021-01-21T13:19:03.809Z', 1, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'CV-English.docx');
COMMIT;

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS "person";
CREATE TABLE "person" (
  "id" int4 NOT NULL,
  "fname" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "lname" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(1023) COLLATE "pg_catalog"."default" NOT NULL,
  "type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "createdat" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "updatedat" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of person
-- ----------------------------
BEGIN;
INSERT INTO "person" VALUES (111111111, 'Ayman', 'Oudi', '123', 'student', '2020-12-26', '2020-12-26');
INSERT INTO "person" VALUES (315798504, 'Bshara', 'Zahran', '123', 'student', '2020-12-26', '2020-12-26');
INSERT INTO "person" VALUES (123123123, 'Alex', 'Kesselman', '123', 'teacher', '2020-12-26', '2020-12-26');
COMMIT;

-- ----------------------------
-- Table structure for submission
-- ----------------------------
DROP TABLE IF EXISTS "submission";
CREATE TABLE "submission" (
  "id" int4 NOT NULL,
  "studentid" int4 NOT NULL,
  "homeworkid" int4 NOT NULL,
  "grade" int4,
  "status" varchar(255) COLLATE "pg_catalog"."default",
  "createdat" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "updatedat" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "graderid" int4,
  "graderfullname" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of submission
-- ----------------------------
BEGIN;
INSERT INTO "submission" VALUES (2, 111111111, 456, 0, 'Not Submitted', '10', '10', 2, 'll');
INSERT INTO "submission" VALUES (3, 111111111, 789, 0, 'Not Submitted', '0', '0', 3, 'k');
INSERT INTO "submission" VALUES (1, 111111111, 123, 70, 'Submitted', '/10/0', '10/10', 123123123, 'Alex Kesselman');
COMMIT;

-- ----------------------------
-- Table structure for submissionfile
-- ----------------------------
DROP TABLE IF EXISTS "submissionfile";
CREATE TABLE "submissionfile" (
  "id" int4 NOT NULL,
  "path" varchar(511) COLLATE "pg_catalog"."default" NOT NULL,
  "createdat" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "updatedat" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "submissionid" int4 NOT NULL
)
;

-- ----------------------------
-- Records of submissionfile
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "users";
CREATE TABLE "users" (
  "user_id" int4 NOT NULL DEFAULT nextval('users_user_id_seq'::regclass),
  "user_name" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO "users" VALUES (1, 'bshara3');
INSERT INTO "users" VALUES (7, 'bshara3');
INSERT INTO "users" VALUES (44, '44bshara3');
INSERT INTO "users" VALUES (2, 'aiman');
COMMIT;

-- ----------------------------
-- Primary Key structure for table comment
-- ----------------------------
ALTER TABLE "comment" ADD CONSTRAINT "Comment_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table course
-- ----------------------------
ALTER TABLE "course" ADD CONSTRAINT "Course_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table courseparticipants
-- ----------------------------
ALTER TABLE "courseparticipants" ADD CONSTRAINT "CourseParticipants_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table homework
-- ----------------------------
ALTER TABLE "homework" ADD CONSTRAINT "Homework_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table homework_file
-- ----------------------------
ALTER TABLE "homework_file" ADD CONSTRAINT "homework_file_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table person
-- ----------------------------
ALTER TABLE "person" ADD CONSTRAINT "Person_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table submission
-- ----------------------------
ALTER TABLE "submission" ADD CONSTRAINT "Submission_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table submissionfile
-- ----------------------------
ALTER TABLE "submissionfile" ADD CONSTRAINT "HomeworkFile_copy1_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("user_id");

-- ----------------------------
-- Foreign Keys structure for table comment
-- ----------------------------
ALTER TABLE "comment" ADD CONSTRAINT "AuthorId" FOREIGN KEY ("authorid") REFERENCES "person" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "comment" ADD CONSTRAINT "SubmissionId" FOREIGN KEY ("submissionid") REFERENCES "submission" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table courseparticipants
-- ----------------------------
ALTER TABLE "courseparticipants" ADD CONSTRAINT "CourseId" FOREIGN KEY ("courseid") REFERENCES "course" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "courseparticipants" ADD CONSTRAINT "PersonId" FOREIGN KEY ("personid") REFERENCES "person" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table homework
-- ----------------------------
ALTER TABLE "homework" ADD CONSTRAINT "CourseId" FOREIGN KEY ("courseid") REFERENCES "course" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table submission
-- ----------------------------
ALTER TABLE "submission" ADD CONSTRAINT "HomeWorkId" FOREIGN KEY ("homeworkid") REFERENCES "homework" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "submission" ADD CONSTRAINT "PersonId" FOREIGN KEY ("studentid") REFERENCES "person" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table submissionfile
-- ----------------------------
ALTER TABLE "submissionfile" ADD CONSTRAINT "File" FOREIGN KEY ("submissionid") REFERENCES "submission" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
