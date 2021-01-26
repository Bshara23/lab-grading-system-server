/*
 Navicat PostgreSQL Data Transfer

 Source Server         : school
 Source Server Type    : PostgreSQL
 Source Server Version : 130001
 Source Host           : localhost:5432
 Source Catalog        : school
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 130001
 File Encoding         : 65001

 Date: 26/01/2021 23:41:45
*/


-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS "comment";
CREATE TABLE "comment" (
  "id" int4 NOT NULL,
  "authorid" int4 NOT NULL,
  "authorfullname" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "authortype" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "submissionid" int4 NOT NULL,
  "createdat" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "updatedat" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "content" varchar(1023) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
INSERT INTO "comment" VALUES (0, 1, 'Alex Kesselman', 'teacher', 1763663306, '2021-01-26T20:13:38.954Z', '2021-01-26T20:13:38.954Z', 'hf');
INSERT INTO "comment" VALUES (1, 1, 'Alex Kesselman', 'teacher', 1763663306, '2021-01-26T20:13:41.478Z', '2021-01-26T20:13:41.478Z', 'hfhtfh');
INSERT INTO "comment" VALUES (2, 315798504, 'Bshara Zahran', 'student', 1763663306, '2021-01-26T20:46:31.906Z', '2021-01-26T20:46:31.906Z', 'ddd');
INSERT INTO "comment" VALUES (3, 315798504, 'Bshara Zahran', 'student', 1763663306, '2021-01-26T20:46:34.628Z', '2021-01-26T20:46:34.628Z', 'ddddawd');
INSERT INTO "comment" VALUES (4, 315798504, 'Bshara Zahran', 'student', 1763663306, '2021-01-26T20:47:33.117Z', '2021-01-26T20:47:33.117Z', 'aaa');
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
INSERT INTO "course" VALUES (5, 'awd', 'awd', 5, '2021-01-24T16:54:43.623Z', '2021-01-24T16:54:43.623Z');
INSERT INTO "course" VALUES (7, 'WEB', 'description about web...', 5, '2021-01-26T08:50:48.874Z', '2021-01-26T08:50:48.874Z');
INSERT INTO "course" VALUES (8, 'Calculus II', 'description about calc...', 5, '2021-01-26T08:59:44.057Z', '2021-01-26T08:59:44.057Z');
INSERT INTO "course" VALUES (6, 'qwrrwq', 'wqrqwrqwrqw', 5, '2021-01-25T15:00:04.382Z', '2021-01-25T15:00:04.382Z');
COMMIT;

-- ----------------------------
-- Table structure for course_file
-- ----------------------------
DROP TABLE IF EXISTS "course_file";
CREATE TABLE "course_file" (
  "id" int4 NOT NULL,
  "path" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "course_id" int4 NOT NULL,
  "mimetype" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "title" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "updated_at" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of course_file
-- ----------------------------
BEGIN;
INSERT INTO "course_file" VALUES (0, 'uploads\1611694305815-1340_e_e_e_aws-skillbased.png', 7, 'image/png', 'aws-skillbased.png', '2021-01-26T20:51:45.818Z', '2021-01-26T20:51:45.818Z');
COMMIT;

-- ----------------------------
-- Table structure for courseparticipants
-- ----------------------------
DROP TABLE IF EXISTS "courseparticipants";
CREATE TABLE "courseparticipants" (
  "personid" int4 NOT NULL,
  "courseid" int4 NOT NULL,
  "createdat" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "updatedat" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id" varchar(512) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of courseparticipants
-- ----------------------------
BEGIN;
INSERT INTO "courseparticipants" VALUES (315798504, 5, '2021-01-24T16:54:43.643Z', '2021-01-24T16:54:43.643Z', 'c87a9319-2e03-42f2-805e-49a9dbbf61e8');
INSERT INTO "courseparticipants" VALUES (315798504, 6, '2021-01-25T15:00:04.517Z', '2021-01-25T15:00:04.517Z', 'f6fa646d-d694-4c4d-bf5f-e2bb5d597056');
INSERT INTO "courseparticipants" VALUES (123, 6, '2021-01-25T15:00:04.518Z', '2021-01-25T15:00:04.518Z', 'faa02ef3-6133-41e1-9c7f-1089f0c9a3c8');
INSERT INTO "courseparticipants" VALUES (111111111, 6, '2021-01-25T15:00:04.519Z', '2021-01-25T15:00:04.519Z', '37d96eae-969d-462a-8284-823e049b3914');
INSERT INTO "courseparticipants" VALUES (1, 5, '2021-01-24T16:54:43.645Z', '2021-01-24T16:54:43.645Z', '373b3511-81fb-4da0-b638-bba27414743d');
INSERT INTO "courseparticipants" VALUES (1, 6, '2021-01-25T15:00:04.514Z', '2021-01-25T15:00:04.514Z', '8276eb40-7b86-4949-8039-8717ac1217a2');
INSERT INTO "courseparticipants" VALUES (315798504, 7, '2021-01-26T08:50:49.022Z', '2021-01-26T08:50:49.022Z', '5ed68cef-6a8b-457a-aefc-a99952dba712');
INSERT INTO "courseparticipants" VALUES (111111111, 7, '2021-01-26T08:50:49.026Z', '2021-01-26T08:50:49.026Z', '745dc03e-7bde-44d3-a02f-8872458046bc');
INSERT INTO "courseparticipants" VALUES (1, 7, '2021-01-26T08:50:49.028Z', '2021-01-26T08:50:49.028Z', 'd08eafd6-508c-4062-a7cd-42ead45b9cb7');
INSERT INTO "courseparticipants" VALUES (123, 7, '2021-01-26T08:50:49.027Z', '2021-01-26T08:50:49.027Z', 'd2a1e9f5-8345-4bea-a801-edba8e32a7ac');
INSERT INTO "courseparticipants" VALUES (315798504, 8, '2021-01-26T08:59:44.170Z', '2021-01-26T08:59:44.170Z', '29360b55-dddc-42f8-88f7-bac16db270f7');
INSERT INTO "courseparticipants" VALUES (111111111, 8, '2021-01-26T08:59:44.173Z', '2021-01-26T08:59:44.173Z', '4bd5bb4e-5a13-482e-9431-e11d208f894d');
INSERT INTO "courseparticipants" VALUES (1, 8, '2021-01-26T08:59:44.174Z', '2021-01-26T08:59:44.174Z', 'a7758302-20f8-47bb-b117-fc97a40dac66');
INSERT INTO "courseparticipants" VALUES (123, 8, '2021-01-26T08:59:44.172Z', '2021-01-26T08:59:44.172Z', '05929c20-4e64-4947-8b15-fb61e9f0a1a4');
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
INSERT INTO "homework" VALUES (456, 4, 'HomeWork2', 'This is homework2 of Web', '2021-01-23T14:47:03.617Z', '2021-01-23T14:47:03.617Z', '2021-01-23T14:47:03.617Z');
INSERT INTO "homework" VALUES (123, 4, 'HomeWork1', 'This is homework1 of Web', '2021-01-23T14:47:03.617Z', '2021-01-23T14:47:03.617Z', '2021-01-23T14:47:03.617Z');
INSERT INTO "homework" VALUES (789, 4, 'HomeWork3', 'This is homework3 of Web', '2021-01-23T14:47:03.617Z', '2021-01-23T14:47:03.617Z', '2021-01-23T14:47:03.617Z');
INSERT INTO "homework" VALUES (791, 7, 'hw2', 'eee', '2021-01-26T19:54:52.132Z', '2021-01-26T19:54:57.100Z', '2021-01-26T19:54:57.100Z');
INSERT INTO "homework" VALUES (792, 7, 'hw3', 'hw3', '2021-01-26T19:59:12.816Z', '2021-01-26T19:59:19.382Z', '2021-01-26T19:59:19.382Z');
INSERT INTO "homework" VALUES (793, 7, 'hw4', 'hw4 des', '2021-01-26T19:59:19.420Z', '2021-01-26T20:02:04.230Z', '2021-01-26T20:02:04.230Z');
COMMIT;

-- ----------------------------
-- Table structure for homework_file
-- ----------------------------
DROP TABLE IF EXISTS "homework_file";
CREATE TABLE "homework_file" (
  "id" int4 NOT NULL,
  "path" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "homework_id" int4 NOT NULL,
  "mimetype" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "title" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "updated_at" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of homework_file
-- ----------------------------
BEGIN;
INSERT INTO "homework_file" VALUES (0, 'uploads\1611387756591-9376_e_e_e_a.png', 456, 'image/png', 'a.png', '2021-01-23T07:42:36.600Z', '2021-01-23T07:42:36.600Z');
INSERT INTO "homework_file" VALUES (1, 'uploads\1611387763170-7858_e_e_e_a.png', 456, 'image/png', 'a.png', '2021-01-23T07:42:43.173Z', '2021-01-23T07:42:43.173Z');
INSERT INTO "homework_file" VALUES (2, 'uploads\1611387775192-695_e_e_e_a.png', 456, 'image/png', 'a.png', '2021-01-23T07:42:55.195Z', '2021-01-23T07:42:55.195Z');
INSERT INTO "homework_file" VALUES (3, 'uploads\1611387796974-9010_e_e_e_aws-skillbased.png', 123, 'image/png', 'aws-skillbased.png', '2021-01-23T07:43:16.976Z', '2021-01-23T07:43:16.976Z');
INSERT INTO "homework_file" VALUES (4, 'uploads\1611413587864-1625_e_e_e_a.png', 123, 'image/png', 'a.png', '2021-01-23T14:53:07.869Z', '2021-01-23T14:53:07.869Z');
INSERT INTO "homework_file" VALUES (5, 'uploads\1611413898339-5608_e_e_e_a.png', 123, 'image/png', 'a.png', '2021-01-23T14:58:18.340Z', '2021-01-23T14:58:18.340Z');
INSERT INTO "homework_file" VALUES (6, 'uploads\1611681166308-9973_e_e_e_a.png', 790, 'image/png', 'a.png', '2021-01-26T17:12:46.316Z', '2021-01-26T17:12:46.316Z');
INSERT INTO "homework_file" VALUES (7, 'uploads\1611694387472-3346_e_e_e_schedule.png', 793, 'image/png', 'schedule.png', '2021-01-26T20:53:07.479Z', '2021-01-26T20:53:07.479Z');
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
INSERT INTO "person" VALUES (315798504, 'Bshara', 'Zahran', '123', 'student', '2021-01-23T08:21:58.418Z', '2021-01-23T08:21:58.418Z');
INSERT INTO "person" VALUES (111111111, 'Ayman', 'Oudi', '123', 'student', '2021-01-23T08:21:58.418Z', '2021-01-23T08:21:58.418Z');
INSERT INTO "person" VALUES (123, 'John', 'Doe', '444', 'teacher', '2021-01-23T08:21:58.418Z', '2021-01-23T08:21:58.418Z');
INSERT INTO "person" VALUES (12345, 'Admin', 'Admin', '12345', 'admin', '23T08:21:58.418Z', '23T08:21:58.418Z');
INSERT INTO "person" VALUES (1, 'Alex', 'Kesselman', '123', 'teacher', '2021-01-23T08:21:58.418Z', '2021-01-23T08:21:58.418Z');
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
INSERT INTO "submission" VALUES (1609346866, 111111111, 793, -1, 'Waiting', '2021-01-26T20:02:04.534Z', '2021-01-26T20:02:04.534Z', -1, 'Not available');
INSERT INTO "submission" VALUES (1763663306, 315798504, 793, 32, 'Waiting', '2021-01-26T20:02:04.533Z', '2021-01-26T20:02:04.533Z', -1, 'Not available');
COMMIT;

-- ----------------------------
-- Table structure for submissionfile
-- ----------------------------
DROP TABLE IF EXISTS "submissionfile";
CREATE TABLE "submissionfile" (
  "id" int4 NOT NULL,
  "path" varchar(511) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "updated_at" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "submissionid" int4 NOT NULL,
  "mimetype" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "title" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of submissionfile
-- ----------------------------
BEGIN;
INSERT INTO "submissionfile" VALUES (0, 'uploads\1611693983273-2368_e_e_e_aws-skillbased.png', '2021-01-26T20:46:23.274Z', '2021-01-26T20:46:23.274Z', 1763663306, 'image/png', 'aws-skillbased.png');
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
-- Primary Key structure for table course_file
-- ----------------------------
ALTER TABLE "course_file" ADD CONSTRAINT "course_file_pkey" PRIMARY KEY ("id");

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
-- Foreign Keys structure for table comment
-- ----------------------------
ALTER TABLE "comment" ADD CONSTRAINT "authoridfk" FOREIGN KEY ("authorid") REFERENCES "person" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "comment" ADD CONSTRAINT "subidfk" FOREIGN KEY ("submissionid") REFERENCES "submission" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table course_file
-- ----------------------------
ALTER TABLE "course_file" ADD CONSTRAINT "course_id_fk" FOREIGN KEY ("course_id") REFERENCES "course" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

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
