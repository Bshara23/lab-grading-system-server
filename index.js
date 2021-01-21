const express = require("express");
const app = express();
const cors = require("cors");
const pool = require("./db");
const path = require("path");
const { v4: uuidv4 } = require('uuid');
var multer = require("multer");

var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "./uploads");
  },
  filename: function (req, file, cb) {
    const uniqueSuffix = Date.now() + "-" + Math.round(Math.random() * 1e4);
    cb(null, uniqueSuffix + "_e_e_e_" + file.originalname);
  },
});

var upload = multer({ storage: storage });

// middleware
app.use(cors());
app.use(express.json());
// middleware
// Save Comments
// app.post('/SaveComment/:MyComment', async (req, res) => {
//     try {
//         const {MyComment} = req.params;
//         const SaveComment = await pool.query("INSERT INTO Comment (user_id, user_name) VALUES($1, $2) RETURNING *",
//         [user_id, user_name])
//         //user_id | user_name
//         res.json(addUser.rows[0]);
//     } catch (error) {
//         console.log(error);
//     }
// });

// update user
app.put("/Grade/:SubmissionId/:Grade", async (req, res) => {
  try {
    const{SubmissionId,grade,id,submitteddate,Status,graderId,graderFullName,homeworkId}=req.body;
    console.log("grade and graderId",grade,graderId);
      const updateUser = await pool.query(
         "UPDATE submission SET grade = $1,status=$2,graderid=$3,graderfullname=$4 WHERE id = $5;",
         [grade, Status,graderId,graderFullName,SubmissionId]
      );
    res.json(grade);
  } catch (error) {
    console.log(error);
  }
});

//get Student Comments
app.get("/getTeachSubComments/:SubmissionId", async (req, res) => {
  try {
    const { SubmissionId } = req.params;
    const getTeachSubComments = await pool.query(
      `SELECT
        *
    FROM
        "comment"
    WHERE
        "comment"."submissionid" = $1 AND
        "comment"."authortype" = 'teacher'`,
      [SubmissionId]
    );
    res.json(getTeachSubComments.rows);
  } catch (error) {
    console.log(error);
  }
});
//get Student Comments
app.get("/getStuSubComments/:StudentId/:SubmissionId", async (req, res) => {
  try {
    const { StudentId, SubmissionId } = req.params;
    const getStudentComments = await pool.query(
      `SELECT
        "comment".*
    FROM
        "comment"
    WHERE
        "comment"."authorid" = $1 AND
        "comment"."submissionid" = $2`,
      [StudentId, SubmissionId]
    );
    res.json(getStudentComments.rows);
  } catch (error) {
    console.log(error);
  }
});
//get student details
app.get("/getStudentDetails/:StudentId", async (req, res) => {
  try {
    const { StudentId } = req.params;
    const getStudentDetails = await pool.query(
      `SELECT
        *
    FROM
        "person"
    WHERE
        "person"."id"  =$1`,
      [StudentId]
    );
    res.json(getStudentDetails.rows);
  } catch (error) {
    console.log(error);
  }
});
//get the specific homework of student
app.get("/getAllStudentHomeWorks/:HomeWorkId", async (req, res) => {
  try {
    const { HomeWorkId } = req.params;
    const getStudentsHomeWorks = await pool.query(
      `SELECT
        "submission".*
    FROM
        "submission"
    WHERE
        "submission"."homeworkid" =$1`,
      [HomeWorkId]
    );
    res.json(getStudentsHomeWorks.rows);
  } catch (error) {
    console.log(error);
  }
});

//get the specific homework of student
app.get("/getStudentHomeWork/:SubmittedId", async (req, res) => {
  try {
    const { SubmittedId } = req.params;
    const getStudentHomeWork = await pool.query(
      `SELECT
        *
    FROM
        "submission"
    WHERE
        "submission"."id" =  $1`,
      [SubmittedId]
    );
    res.json(getStudentHomeWork.rows);
  } catch (error) {
    console.log(error);
  }
});
//get course homeworks

app.get("/getCourseHomeWorks/:courseId", async (req, res) => {
  try {
    const { courseId } = req.params;
    const getCourseHomeWorks = await pool.query(
      `SELECT
    "homework".id, 
	"homework".title, 
	"homework".deadline, 
	"homework".description
FROM
	"homework"
WHERE
	"homework"."courseid" = $1`,
      [courseId]
    );
    res.json(getCourseHomeWorks.rows);
  } catch (error) {
    console.log(error);
  }
});
//get the Home that the student submitted and not sumbitted

app.get("/getStudentCourseHomeWorks/:studentId/:courseId", async (req, res) => {
  try {
    const { studentId, courseId } = req.params;
    const getStudentHomeWorks = await pool.query(
      `SELECT
        "submission".*, 
        "homework".title, 
        "homework".deadline, 
        "homework".description
    FROM
        "homework"
        INNER JOIN
        "submission"
        ON 
            "homework"."id" = "submission"."homeworkid"
    WHERE
        "submission"."studentid" = $1 AND
        "homework"."courseid" = $2`,
      [studentId, courseId]
    );
    res.json(getStudentHomeWorks.rows);
  } catch (error) {
    console.log(error);
  }
});
// get all courses of user
app.get("/getUserCourses/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const getUserCourses = await pool.query(
      `SELECT
        course.title, 
        "person"."fname", 
        "person"."lname", 
        course."id"
    FROM
        "person"
        INNER JOIN
        "courseparticipants"
        ON 
            "person"."id" = "courseparticipants"."personid"
        INNER JOIN
        course
        ON 
            "courseparticipants"."courseid" = course."id"
    WHERE
        "person"."id" =$1`,
      [id]
    );
    res.json(getUserCourses.rows);
  } catch (error) {
    console.log(error);
  }
});

// create a user
app.post("/users", async (req, res) => {
  try {
    console.log(req.body);
    const { user_id, user_name } = req.body;
    const addUser = await pool.query(
      "INSERT INTO users (user_id, user_name) VALUES($1, $2) RETURNING *",
      [user_id, user_name]
    );
    //user_id | user_name
    res.json(addUser.rows[0]);
  } catch (error) {
    console.log(error);
  }
});

// get all users
app.get("/users", async (req, res) => {
  try {
    const getAllUsers = await pool.query("SELECT * FROM users;");
    res.json(getAllUsers.rows);
  } catch (error) {
    console.log(error);
  }
});

// get all users
app.get("/getteachersfromcourse/:id/:type", async (req, res) => {
  try {
    const { id, type } = req.params;
    const getTeachers = await pool.query(
      `SELECT
        course.title, 
        "person"."fname", 
        "person"."lname", 
        "person"."type", 
        course."id"
    FROM
        course
        INNER JOIN
        "courseparticipants"
        ON 
            course."id" = "courseparticipants"."courseid"
        INNER JOIN
        "person"
        ON 
            "courseparticipants"."personid" = "person"."id"
    WHERE
        "person"."type" =$2 AND
        course."id" =$1`,
      [id, type]
    );
    res.json(getTeachers.rows);
  } catch (error) {
    console.log(error);
  }
});

app.post("/getteachersfromcourse/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const { type } = req.body;
    const getTeachers = await pool.query(
      `SELECT
        course.title, 
        "person"."fname", 
        "person"."type"
    FROM
        course
        INNER JOIN
        "courseparticipants"
        ON 
            course."id" = "courseparticipants"."courseid"
        INNER JOIN
        "person"
        ON 
            "courseparticipants"."personid" = "person"."id"
    WHERE
        "person"."type" = $2 AND
        course."id" = $1`,
      [id, type]
    );
    res.json(getTeachers.rows);
  } catch (error) {
    console.log(error);
  }
});

// get user by id
app.get("/users/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const getUser = await pool.query(
      "SELECT * FROM users WHERE user_id = $1;",
      [id]
    );
    res.json(getUser.rows);
  } catch (error) {
    console.log(error);
  }
});

// update user
app.put("/users/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const { user_name } = req.body;
    const updateUser = await pool.query(
      "UPDATE users SET user_name = $1 WHERE user_id = $2;",
      [user_name, id]
    );
    res.json("User updated");
  } catch (error) {
    console.log(error);
  }
});

// delete a user
app.delete("/users/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const deleteUser = await pool.query(
      "DELETE FROM users WHERE user_id = $1;",
      [id]
    );
    res.json("User deleted");
  } catch (error) {
    console.log(error);
  }
});

// get all users
app.get("/courses", async (req, res) => {
  const type = "student";
  try {
    const getAllUsers = await pool.query(ayman("student"));
    res.json(getAllUsers.rows);
  } catch (error) {
    console.log(error);
  }
});

////////////////////////////////////// files

app.post(
  "/uploadFile/:homeworkId",
  upload.single("file"),
  async function (req, res, next) {
    try {
      const currDate = new Date().toISOString();
      const { homeworkId } = req.params;
      const { path, mimetype, originalname } = req.file;
      const addFile = await pool.query(
        "INSERT INTO homework_file (path, homework_id, mimetype, created_at, updated_at, title, id) VALUES($1, $2, $3, $4, $5, $6, $7) RETURNING *",
        [path, homeworkId, mimetype, currDate, currDate, originalname, uuidv4()]
      );
      res.json(addFile.rows[0]);
    } catch (error) {
      console.log(error);
    }
  }
);

app.get("/files/:homeworkId", async (req, res) => {
  try {
    const { homeworkId } = req.params;
    const getFiles = await pool.query(
      `SELECT homework_file.* FROM homework_file WHERE homework_file.homework_id = $1`,
      [homeworkId]
    );
    //user_id | user_name
    res.json(getFiles.rows);
  } catch (error) {
    console.log(error);
  }
});

app.get("/download/:id", async (req, res) => {
  try {
    const id = req.params.id;

    // get file from db
    const getFile = await pool.query(
      `SELECT homework_file.* FROM homework_file WHERE homework_file."id" = $1`,
      [id]
    );
    const file = getFile.rows[0];
    //
    const file_path = file.path;
    const file_mimetype = file.mimetype;

    res.set({
      "Content-Type": file_mimetype,
    });

    const full_path = path.join(__dirname, file_path);
    res.sendFile(full_path);
  } catch (error) {
    res.status(400).send("Error while downloading file. Try again later.");
  }
});

///////////////// init server

app.listen(5000, () => {
  console.log("Server has started on port 5000");
});
