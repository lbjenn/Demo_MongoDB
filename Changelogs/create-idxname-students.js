db.students.createIndex({
    "name": "text"
},
{
    name: "ID-students-uniquename",
    unique: true
});
