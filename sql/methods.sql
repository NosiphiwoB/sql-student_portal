--Table 1
CREATE TABLE user(
  ID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  StudentID VARCHAR(255) DEFAULT (uuid()),
  Name VARCHAR(255),
  Email VARCHAR(255),
  Password VARCHAR(255)
);
--values
INSERT INTO user (name, email, password)
VALUES ('Nox', 'nox@gmail.com', 'nox123'),
  ("Anathi", "ana@gmail.com", 'ana123'),
  ("Vusimuzi", "vusi@gmail.com", "vusi123");
--Table 2
CREATE TABLE subs(
  ID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(255)
);
--Subjects
Insert into subs(Name)
values ('Math'),
  ('English'),
  ('Physics'),
  ('History');
-- get(subs)
--Table 3
CREATE TABLE UserSubjects(
  ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  StudentID INT,
  subsID INT,
  FOREIGN KEY(StudentID) REFERENCES user(ID),
  FOREIGN KEY(subsID) REFERENCES subs(ID)
);
--Insert StudentID and SubsID
Insert into UserSubjects(StudentID, subsID)
values (3, 3),
  (1, 4),
  (2, 1);
--joining tables
SELECT user.ID,
  user.Name,
  subs.Name
FROM user
  INNER JOIN subs ON user.ID = subs.ID;

--joining all tables using UserSubjects table
select
  user.StudentID as student_id,
  user.Name as student,
  subs.Name as subject
from UserSubjects
  INNER JOIN user ON user.ID = UserSubjects.StudentID
  INNER JOIN subs ON subs.ID = UserSubjects.subsId;

