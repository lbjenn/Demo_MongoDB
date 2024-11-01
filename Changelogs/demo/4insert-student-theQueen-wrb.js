//liquibase formatted mongo
//changeSet jennl:Alice-BI-ins-the-queen runWith:mongosh labels:Release-1.0, [jira-112] contextFilter:DML
db.students.insertOne( { name: "The Queen of Hearts", year: 2017, major: "Philosophy", address: { city: "The Castle", street: "Palace Blvd.", state:"New York"}});
//rollback db.students.deleteOne( { name: "The Queen of Hearts"});
