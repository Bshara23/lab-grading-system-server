function sssss2(type){
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


module.exports = sssss2;