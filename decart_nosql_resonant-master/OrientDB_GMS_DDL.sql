/* Group Member Skill Graph Database

-- sql command reference:
http://orientdb.com/docs/2.2.x/Commands.html

-- Data Types:
http://orientdb.com/docs/2.2/Types.html
*/

/* Alter Super Classes V & E */
/* DO NOT SET READONLY or any other Constraints here.
   It will prevent GUI Insert & Edit. */
CREATE PROPERTY V.creationDT Datetime (DEFAULT sysdate());
CREATE PROPERTY E.creationDT Datetime (DEFAULT sysdate());

/* Vertex Classes */

/* -- Class Group */
CREATE CLASS Group EXTENDS V;
CREATE PROPERTY Group.groupName STRING;
CREATE PROPERTY Group.description STRING;
/* -- Enforce Unique Case-Insensitive Group Name in DB */
CREATE INDEX udxGroup ON Group (groupName COLLATE ci) UNIQUE;


/* -- Class Member */
CREATE CLASS Member EXTENDS V;
CREATE PROPERTY Member.fname STRING;
CREATE PROPERTY Member.lname STRING;
CREATE PROPERTY Member.dob Date;
CREATE PROPERTY Member.age Short;


/* -- Class Skill */
CREATE CLASS Skill EXTENDS V;
CREATE PROPERTY Skill.skillName STRING;

/* -- Enforce Unique Case-Insensitive Skill Name in DB */
CREATE INDEX udxSkill ON Skill (skillName COLLATE ci) UNIQUE;


/* Edge Classes */

/* -- BELONGS */
CREATE CLASS BELONGS EXTENDS E;
CREATE PROPERTY BELONGS.startDate Date;
CREATE PROPERTY BELONGS.endDate Date;
CREATE PROPERTY BELONGS.status String;

/* -- FRIENDS */
CREATE CLASS FRIENDS EXTENDS E;
CREATE PROPERTY FRIENDS.startDate Date;

/* -- POSSESS */
CREATE CLASS POSSESS EXTENDS E;
CREATE PROPERTY POSSESS.startDate Date;


