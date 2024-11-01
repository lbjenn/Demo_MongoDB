//liquibase formatted mongo
//changeSet jennl:Alice-BI-ins-the-caterpillar runWith:mongosh labels:Release-1.0, DML contextFilter:students
db.students.insertOne( { name: "The Caterpillar", year: 2023, major: "English", address: { city: "Mushroom Valley", street: "Funghi Ln.", state:"New York"}});
//rollback db.students.deleteOne( { name: "The Caterpillar"});
