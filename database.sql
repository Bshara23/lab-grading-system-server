CREATE DATABASE school;

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    fname VARCHAR(255),
    lname VARCHAR(255),
    password VARCHAR(255),
    courses VARCHAR(255),
    type VARCHAR(255),
); 


CREATE TABLE usersCourses(
    user_id SERIAL PRIMARY KEY,
    course_id SERIAL PRIMARY KEY,

); 

CREATE TABLE courses(
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    description VARCHAR(255),
    points VARCHAR(255),
    homeworks VARCHAR(255),
    students VARCHAR(255),
    teachers VARCHAR(255),
); 