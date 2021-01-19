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

 Date: 19/01/2021 13:36:35
*/


-- ----------------------------
-- Sequence structure for CourseParticipants_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "CourseParticipants_id_seq";
CREATE SEQUENCE "CourseParticipants_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for File_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "File_id_seq";
CREATE SEQUENCE "File_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for Homework_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "Homework_id_seq";
CREATE SEQUENCE "Homework_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for users_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "users_user_id_seq";
CREATE SEQUENCE "users_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for Comment
-- ----------------------------
DROP TABLE IF EXISTS "Comment";
CREATE TABLE "Comment" (
  "id" int4 NOT NULL,
  "authorId" int4 NOT NULL,
  "authorFullName" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "authorType" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "submissionId" int4 NOT NULL,
  "createdAt" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "updatedAt" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of Comment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for CourseParticipants
-- ----------------------------
DROP TABLE IF EXISTS "CourseParticipants";
CREATE TABLE "CourseParticipants" (
  "id" int4 NOT NULL DEFAULT nextval('"CourseParticipants_id_seq"'::regclass),
  "personId" int4 NOT NULL,
  "courseId" int4 NOT NULL,
  "createdAt" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "updatedAt" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of CourseParticipants
-- ----------------------------
BEGIN;
INSERT INTO "CourseParticipants" VALUES (2, 111111111, 4, '2020-12-26T20:19:53.462Z', '2020-12-26T20:19:53.462Z');
INSERT INTO "CourseParticipants" VALUES (3, 315798504, 4, '2020-12-26T20:19:53.462Z', '2020-12-26T20:19:53.462Z');
INSERT INTO "CourseParticipants" VALUES (1, 123123123, 4, '2020-12-26T20:19:53.462Z', '2020-12-26T20:19:53.462Z');
COMMIT;

-- ----------------------------
-- Table structure for Homework
-- ----------------------------
DROP TABLE IF EXISTS "Homework";
CREATE TABLE "Homework" (
  "id" int4 NOT NULL DEFAULT nextval('"Homework_id_seq"'::regclass),
  "courseId" int4 NOT NULL,
  "title" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "description" varchar(8191) COLLATE "pg_catalog"."default",
  "deadline" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "createdAt" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "updatedAt" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of Homework
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for HomeworkFile
-- ----------------------------
DROP TABLE IF EXISTS "HomeworkFile";
CREATE TABLE "HomeworkFile" (
  "id" int4 NOT NULL DEFAULT nextval('"File_id_seq"'::regclass),
  "path" varchar(511) COLLATE "pg_catalog"."default" NOT NULL,
  "createdAt" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "updatedAt" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "homeworkId" int4 NOT NULL
)
;

-- ----------------------------
-- Records of HomeworkFile
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for Person
-- ----------------------------
DROP TABLE IF EXISTS "Person";
CREATE TABLE "Person" (
  "id" int4 NOT NULL,
  "fName" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "lName" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(1023) COLLATE "pg_catalog"."default" NOT NULL,
  "type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "createdAt" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "updatedAt" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of Person
-- ----------------------------
BEGIN;
INSERT INTO "Person" VALUES (111111111, 'Ayman', 'Oudi', '123', 'student', '2020-12-26', '2020-12-26');
INSERT INTO "Person" VALUES (315798504, 'Bshara', 'Zahran', '123', 'student', '2020-12-26', '2020-12-26');
INSERT INTO "Person" VALUES (123123123, 'Alex', 'Kesselman', '123', 'teacher', '2020-12-26', '2020-12-26');
COMMIT;

-- ----------------------------
-- Table structure for Submission
-- ----------------------------
DROP TABLE IF EXISTS "Submission";
CREATE TABLE "Submission" (
  "id" int4 NOT NULL,
  "studentId" int4 NOT NULL,
  "homeworkId" int4 NOT NULL,
  "grade" int4,
  "status" varchar(255) COLLATE "pg_catalog"."default",
  "createdAt" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "updatedAt" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "graderId" int4,
  "graderFullName" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of Submission
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for SubmissionFile
-- ----------------------------
DROP TABLE IF EXISTS "SubmissionFile";
CREATE TABLE "SubmissionFile" (
  "id" int4 NOT NULL DEFAULT nextval('"File_id_seq"'::regclass),
  "path" varchar(511) COLLATE "pg_catalog"."default" NOT NULL,
  "createdAt" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "updatedAt" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "submissionId" int4 NOT NULL
)
;

-- ----------------------------
-- Records of SubmissionFile
-- ----------------------------
BEGIN;
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
  "createdAt" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "updatedAt" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
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
INSERT INTO "users" VALUES (2, 'ayman');
INSERT INTO "users" VALUES (1, 'bshara3');
INSERT INTO "users" VALUES (7, 'bshara3');
INSERT INTO "users" VALUES (44, '44bshara3');
COMMIT;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "CourseParticipants_id_seq"
OWNED BY "CourseParticipants"."id";
SELECT setval('"CourseParticipants_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "File_id_seq"
OWNED BY "HomeworkFile"."id";
SELECT setval('"File_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "Homework_id_seq"
OWNED BY "Homework"."id";
SELECT setval('"Homework_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "users_user_id_seq"
OWNED BY "users"."user_id";
SELECT setval('"users_user_id_seq"', 4, true);

-- ----------------------------
-- Primary Key structure for table Comment
-- ----------------------------
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table CourseParticipants
-- ----------------------------
ALTER TABLE "CourseParticipants" ADD CONSTRAINT "CourseParticipants_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Homework
-- ----------------------------
ALTER TABLE "Homework" ADD CONSTRAINT "Homework_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table HomeworkFile
-- ----------------------------
ALTER TABLE "HomeworkFile" ADD CONSTRAINT "File_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Person
-- ----------------------------
ALTER TABLE "Person" ADD CONSTRAINT "Person_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Submission
-- ----------------------------
ALTER TABLE "Submission" ADD CONSTRAINT "Submission_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table SubmissionFile
-- ----------------------------
ALTER TABLE "SubmissionFile" ADD CONSTRAINT "HomeworkFile_copy1_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table course
-- ----------------------------
ALTER TABLE "course" ADD CONSTRAINT "Course_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("user_id");

-- ----------------------------
-- Foreign Keys structure for table CourseParticipants
-- ----------------------------
ALTER TABLE "CourseParticipants" ADD CONSTRAINT "CourseId" FOREIGN KEY ("courseId") REFERENCES "course" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "CourseParticipants" ADD CONSTRAINT "PersonId" FOREIGN KEY ("personId") REFERENCES "Person" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
