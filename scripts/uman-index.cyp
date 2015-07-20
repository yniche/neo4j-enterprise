
// Run the following cmd line by line, not as part of the script in web admin UI
CREATE Index On :_Company (name)

CREATE Index On :_Person (email)

CREATE Index On :_Person (fname)

CREATE Index On :_Person (lname)

CREATE Index On :_Person (firstName)

CREATE Index On :_Person (lastName)

// CREATE Index On :_Time // Unexpected end of input: expected an identifier character, whitespace or '(' (line 1, column 23) CREATE Index On :_Time"

// CREATE CONSTRAINT ON (person:_Person ) ASSERT person.email IS UNIQUE // Already indexed

CREATE CONSTRAINT ON (acc:_Account) ASSERT acc.username IS UNIQUE

// CREATE CONSTRAINT ON (co:_Company) ASSERT co.name IS UNIQUE // Already indexed
