const express = require("express");
const app = express();
const cors = require("cors");
const pool = require("./db");
const ayman = require('./queries/ayman');


// middleware
app.use(cors());
app.use(express.json());


// get all courses of user
app.get('/getUserCourses/:id', async (req, res) => {
    try {
        const {id} = req.params;
        const getUserCourses = await pool.query(`SELECT
        course.title, 
        "Person"."fName", 
        "Person"."lName", 
        course."id"
    FROM
        "Person"
        INNER JOIN
        "CourseParticipants"
        ON 
            "Person"."id" = "CourseParticipants"."personId"
        INNER JOIN
        course
        ON 
            "CourseParticipants"."courseId" = course."id"
    WHERE
        "Person"."id" =$1`,[id])
        res.json(getUserCourses.rows);
    } catch (error) {
        console.log(error);
    }
});

// get all users
app.get('/users', async (req, res) => {
    try {
        const getAllUsers = await pool.query("SELECT * FROM users;")
        res.json(getAllUsers.rows);
    } catch (error) {
        console.log(error);
    }
});

// get all users
app.get('/getteachersfromcourse/:id/:type', async (req, res) => {
    try {
        const {id,type} = req.params;
        const getTeachers = await pool.query(`SELECT
        course.title, 
        "Person"."fName", 
        "Person"."type"
    FROM
        course
        INNER JOIN
        "CourseParticipants"
        ON 
            course."id" = "CourseParticipants"."courseId"
        INNER JOIN
        "Person"
        ON 
            "CourseParticipants"."personId" = "Person"."id"
    WHERE
        "Person"."type" = $2 AND
        course."id" = $1`,[id,type])
        res.json(getTeachers.rows);
    } catch (error) {
        console.log(error);
    }
});
app.post('/getteachersfromcourse/:id', async (req, res) => {
    try {
        const {id} = req.params;
        const {type} = req.body;
        const getTeachers = await pool.query(`SELECT
        course.title, 
        "Person"."fName", 
        "Person"."type"
    FROM
        course
        INNER JOIN
        "CourseParticipants"
        ON 
            course."id" = "CourseParticipants"."courseId"
        INNER JOIN
        "Person"
        ON 
            "CourseParticipants"."personId" = "Person"."id"
    WHERE
        "Person"."type" = $2 AND
        course."id" = $1`,[id,type])
        res.json(getTeachers.rows);
    } catch (error) {
        console.log(error);
    }
});

// get user by id
app.get('/users/:id', async (req, res) => {
    try {
        const {id} = req.params;
        const getUser = await pool.query("SELECT * FROM users WHERE user_id = $1;", [id])
        res.json(getUser.rows);
    } catch (error) {
        console.log(error);
    }
});


// update user
app.put('/users/:id', async (req, res) => {
    try {
        const {id} = req.params;
        const {user_name} = req.body; 
        const updateUser = await pool.query("UPDATE users SET user_name = $1 WHERE user_id = $2;", [user_name, id])
        res.json("User updated");
    } catch (error) {
        console.log(error);
    }
});


// delete a user
app.delete('/users/:id', async (req, res) => {
    try {
        const {id} = req.params;
        const deleteUser = await pool.query("DELETE FROM users WHERE user_id = $1;", [id])
        res.json("User deleted");
    } catch (error) {
        console.log(error);
    }
});



// get all users
app.get('/courses', async (req, res) => {
    const type = "student";
    try {
        const getAllUsers = await pool.query(ayman('student'))
        res.json(getAllUsers.rows);
    } catch (error) {
        console.log(error);
    }
});

app.listen(5000, () => {
  console.log("Server has started on port 5000");
});



function sssss(type){
    return `SELECT
    "Course".title, 
    "Person"."fName", 
    "Person"."lName", 
    "Person"."type", 
    "Course".points, 
    "Course"."id", 
    "CourseParticipants"."courseId"
    FROM
    "Person"
    INNER JOIN
    "CourseParticipants"
    ON 
        "Person"."id" = "CourseParticipants"."personId"
    INNER JOIN
    "Course"
    ON 
        "CourseParticipants"."courseId" = "Course"."id"
    WHERE
    "Course"."id" = 4 AND "Person"."type" = '${type}'`

} 