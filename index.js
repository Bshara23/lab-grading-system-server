const express = require("express");
const app = express();
const cors = require("cors");
const pool = require("./db");
const ayman = require('./queries/ayman');


// middleware
app.use(cors());
app.use(express.json());


// create a user
app.post('/users', async (req, res) => {
    try {
        console.log(req.body);
        const {user_id, user_name} = req.body; 
        const addUser = await pool.query("INSERT INTO users (user_id, user_name) VALUES($1, $2) RETURNING *",
        [user_id, user_name])
        //user_id | user_name
        res.json(addUser.rows[0]);
    } catch (error) {
        console.log(error);
    }
});

// get all users
app.get('/users', async (req, res) => {
    try {
        const getAllUsers = await pool.query("SELECT * FROM course;")
        res.json(getAllUsers.rows);
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