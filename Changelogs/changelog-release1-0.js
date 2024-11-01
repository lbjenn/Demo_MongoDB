//liquibase formatted mongo
//CHANGESET jennl:AliceBI-students-crcollection runWith:mongosh labels:Release-1.0 contextFilter:students
db.createCollection('students');
//rollback db.students.drop();

//CHANGESET jennl:AliceBI-cridx-IDX-students-uniquename runWith:mongosh labels:Release-1.0 contextFilter:students
db.students.createIndex({
    "name": "text"
},
{
    name: "ID-students-uniquename",
    unique: true
});
//rollback db.students.dropIndex( "IDX-students-uniquename");

//changeSet jennl:Alice-BI-ins-students-demo1 runWith:mongosh labels:Release-1.0, DML contextFilter:students
db.students.insertMany([
    { name: "Alice Wonderland", year: 2018, major: "History", address: { city: "NYC", street: "123 33rd St.", state:"New York"}},
    { name: "White Rabbit", year: 2017, major: "English", address: { city: "Rabbit Hole", street: "999 Main Street", state:"New York"}},
    { name: "Mad Hatter", year: 2024, major: "Math", address: { city: "Hattery", street: "5th Ave.", state:"New York"}},
    { name: "Dutches", year: 2034, major: "English", address: { city: "The Manor", street: "123 Sycamore St.", state:"New York"}}
    ])
//rollback db.students.deleteOne( { name: "Alice Wonderland"});
//rollback db.students.deleteOne( { name: "White Rabbit"});
//rollback db.students.deleteOne( { name: "Mad Hatter"});
//rollback db.students.deleteOne( { name: "Dutches"});

//includeAll": {"relativeToChangelogFile":true, "path": "demo"}

