db.createCollection("students", {
        validator: {
                $jsonSchema: {
                      bsonType: "object",
                      title: "Student Document Validation",
                      required: [ "name", "year", "major" ],
                      properties: {
                        name: {
                            bsonType: "string",
                            description: "name must be a string and is required"
                        },
                        year: {
                            bsonType: "int",
                            minimum: 2017,
                            maximum: 3017,
                            description: "year must be an integer between 2017 and 3017 and is required"
                        },
                        major: {
                            enum: [ "Math", "English", "Computer Science", "History" ],
                            description: "can only be one of the enum values and is required"
                        }
                    }
                }
        }
    });
