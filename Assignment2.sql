CREATE TABLE classroom(
  building VARCHAR(100),
  room_no INTEGER,
  capacity INTEGER,
  PRIMARY KEY (building, room_no));

CREATE TABLE department(
  dept_name VARCHAR(100),
  building VARCHAR(100),
  budget DOUBLE,
  PRIMARY KEY (dept_name));

CREATE TABLE student(
  ID INTEGER,
  name VARCHAR(100),
  dept_name VARCHAR(100),
  tot_cred double,
  PRIMARY KEY (ID),
  FOREIGN KEY (dept_name) REFERENCES department);

CREATE TABLE instructor(
  ID INTEGER,
  name VARCHAR(100),
  dept_name VARCHAR(100),
  salary DOUBLE,
  PRIMARY KEY (ID)
  FOREIGN KEY (dept_name) REFERENCES department);

CREATE TABLE course(
  course_id INT,
  title VARCHAR(100),
  dept_name VARCHAR(100),
  credits DOUBLE,
  PRIMARY KEY (course_id),
  FOREIGN KEY (dept_name) REFERENCES department);

CREATE TABLE advisor(
  s_id INTEGER,
  i_id INTEGER,
  PRIMARY KEY (s_id),
  FOREIGN KEY (s_id) REFERENCES student,
  FOREIGN KEY (i_id) REFERENCES instructor);

CREATE TABLE section(
  course_id INTEGER,
  sec_id INTEGER,
  semester VARCHAR(100) CHECK (semester IN ('Q1', 'Q2' ,'Q3', 'Q4')),
  year INTEGER CHECK (year > 2000),
  building VARCHAR(100),
  room_no INTEGER,
  time_slot_id VARCHAR(100) CHECK (time_slot_id IN ('A', 'B', 'C', 'D')),
  PRIMARY KEY (course_id, sec_id, semester, year),
  FOREIGN KEY (Building, room_no) REFERENCES classroom,
  FOREIGN KEY (course_id) REFERENCES section);

CREATE TABLE prereq(
  course_id INTEGER,
  prereq_id INTEGER,
  PRIMARY KEY (course_id, prereq_id),
  FOREIGN KEY (prereq_id, course_id) REFERENCES course);

CREATE TABLE takes(
  ID INTEGER,
  course_id INTEGER,
  sec_id INTEGER,
  semester INTEGER CHEck (semester IN ('Q1' , 'Q2' ,'Q3' ,'Q4')), 
  year INTEGER CHECK (year > 2000),
  Grade DOUBLE,
  PRIMARY KEY (ID, course_id, sec_id, semester, year),
  FOREIGN KEY (ID) REFERENCES student,
  FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES section);
  
CREATE TABLE teaches(
  ID INTEGER,
  course_id INTEGER,
  sec_id INTEGER,
  semester INTEGER CHECK (semester IN ('Q1' , 'Q2' ,'Q3' ,'Q4')), 
  year INTEGER CHECK (year > 2000),
  PRIMARY KEY (ID, course_id, sec_id, semester, year),
  FOREIGN KEY (ID, course_id, sec_id, semester, year) REFERENCES section,
  FOREIGN KEY (ID) REFERENCES instructor);

INSERT into student
VALUES(13, "Brian","Luck Science","59.5");

INSERT into student
VALUES(666, "Dev","Satanism","66.6");

INSERT into student
VALUES(2, "Binar","Bool Science","58.5");

INSERT into student
VALUES(5, "Penta","Geometry","30");

INSERT into advisor
VALUES(13, 342);

INSERT into advisor
VALUES(666, 999);

INSERT into advisor
VALUES(2, 7474);

INSERT into advisor
VALUES(5, 23);

INSERT into instructor
VALUES(999, "Tietsjor", "Satanism", 99999.9);

INSERT into instructor
VALUES(342, "HectorLector", "Luck Science", 50000);

INSERT into instructor
VALUES(7474, "Peter", "Bool Science", 99999.9);

INSERT into instructor
VALUES(23, "Jan Modaal", "Geometry", 30000);

SELECT student.name as "Student name", instructor.name as "Instructor name" FROM student JOIN advisor on (student.ID = advisor.s_id) JOIN instructor on (instructor.ID = advisor.i_id);
