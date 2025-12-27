
 CREATE DATABASE ResearchAdvisorDBS;
USE ResearchAdvisorDBS;
CREATE TABLE Department (
    DepartmentID VARCHAR(10) PRIMARY KEY,
    DepartmentName VARCHAR(25) NOT NULL UNIQUE
);

CREATE TABLE Student (
    StudentID VARCHAR(10) PRIMARY KEY,
    FullName VARCHAR(30) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    StudyYear INT CHECK (StudyYear BETWEEN 1 AND 5),
    DepartmentID VARCHAR(10),
    FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID)
);


CREATE TABLE Advisor (
    AdvisorID VARCHAR(10) PRIMARY KEY,
    FullName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Specialization VARCHAR(100),
    MaxLoad INT CHECK (MaxLoad > 0),
    DepartmentID VARCHAR(10),
    FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID)
);

CREATE TABLE ResearchTopic (
    TopicID VARCHAR(10) PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    StudentID VARCHAR(10) UNIQUE,
    FOREIGN KEY (StudentID)
        REFERENCES Student(StudentID)
);

CREATE TABLE AdvisorRequest (
    RequestID VARCHAR(10) PRIMARY KEY,
    RequestDate DATE,
    Status VARCHAR(20),
    StudentID VARCHAR(10),
    AdvisorID VARCHAR(10),
    FOREIGN KEY (StudentID)
        REFERENCES Student(StudentID),
    FOREIGN KEY (AdvisorID)
        REFERENCES Advisor(AdvisorID)
);

CREATE TABLE AdvisorDecision (
    DecisionID VARCHAR(10) PRIMARY KEY,
    Decision VARCHAR(10),
    DecisionDate DATE,
    RequestID VARCHAR(10) UNIQUE,
    FOREIGN KEY (RequestID)
        REFERENCES AdvisorRequest(RequestID)
);


CREATE TABLE FinalAssignment (
    AssignmentID VARCHAR(10) PRIMARY KEY,
    StudentID VARCHAR(10) UNIQUE,
    AdvisorID VARCHAR(10),
    DepartmentID VARCHAR(10),
    AssignmentDate DATE,
    FOREIGN KEY (StudentID)
        REFERENCES Student(StudentID),
    FOREIGN KEY (AdvisorID)
        REFERENCES Advisor(AdvisorID),
    FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID)
);

INSERT INTO Department VALUES
('D01','Computer Science'),
('D02','Software Engineering'),
('D03','Information Technology'),
('D04','Information Systems'),
('D05','Data Science'),
('D06','Artificial Intelligence'),
('D07','Cyber Security'),
('D08','Computer Engineering'),
('D09','Electrical Engineering'),
('D10','Applied Mathematics');


INSERT INTO Student VALUES
('S01','Abel Tadesse','s1@gmail.com',3,'D01'),
('S02','Chala Fikadu','s2@gmail.com',3,'D02'),
('S03','Biruk Alemu','s3@gmail.com',4,'D02'),
('S04','Rahel Kebede','s4@gmail.com',2,'D03'),
('S05','Yonatan Tesfa','s5@gmail.com',3,'D03'),
('S06','Selam Abebe','s6@gmail.com',2,'D04'),
('S07','Hanna Solomon','s7@gmail.com',3,'D04'),
('S08','Daniel Getachew','s8@gmail.com',4,'D05'),
('S09','Mulugeta Bekele','s9@gmail.com',3,'D05'),
('S10','Helen Girma','s10@gmail.com',2,'D06'),

('S11','Fitsum Desta','s11@gmail.com',3,'D06'),
('S12','Eyob Haile','s12@gmail.com',4,'D07'),
('S13','Ruth Mamo','s13@gmail.com',2,'D07'),
('S14','Samuel Abate','s14@gmail.com',3,'D08'),
('S15','Nardos Tola','s15@gmail.com',4,'D08'),
('S16','Kalkidan Worku','s16@gmail.com',2,'D09'),
('S17','Abraham Shiferaw','s17@gmail.com',3,'D09'),
('S18','Almaz Tesema','s18@gmail.com',4,'D10'),
('S19','Biniyam Fanta','s19@gmail.com',3,'D10'),
('S20','Meklit Assefa','s20@gmail.com',2,'D01'),

('S21','Lensa Bekele','s21@gmail.com',3,'D01'),
('S22','Tsegaye Mekonnen','s22@gmail.com',4,'D02'),
('S23','Haben Tesfaye','s23@gmail.com',2,'D03'),
('S24','Saron Yohannes','s24@gmail.com',3,'D04'),
('S25','Mesfin Desta','s25@gmail.com',4,'D05'),
('S26','Fikirte Tesfaye','s26@gmail.com',2,'D06'),
('S27','Kebede Wolde','s27@gmail.com',3,'D07'),
('S28','Wudinesh Dawit','s28@gmail.com',4,'D08'),
('S29','Adane Dawit','s29@gmail.com',3,'D09'),
('S30','Aremoniem Belayneh','s30@gmail.com',2,'D10');


INSERT INTO Advisor VALUES
('A01','Dr. Tesfaye Alemu','a1@gmail.com','Software Engineering',5,'D02'),
('A02','Dr. Kebede Wolde','a2@gmail.com','Computer Science',5,'D01'),
('A03','Dr. Selamawit Bekele','a3@gmail.com','Data Science',4,'D05'),
('A04','Dr. Yohannes Tola','a4@gmail.com','AI',4,'D06'),
('A05','Dr. Rahel Girma','a5@gmail.com','Cyber Security',3,'D07');


INSERT INTO ResearchTopic VALUES
('T01','AI Advisor Matching','S01'),
('T02','Secure Web System','S02'),
('T03','Data Mining','S03'),
('T04','Cloud Library','S04'),
('T05','ML Disease Prediction','S05');


INSERT INTO AdvisorRequest VALUES
('R01','2025-01-10','Pending','S01','A01'),
('R02','2025-01-11','Accepted','S02','A01'),
('R03','2025-01-12','Accepted','S03','A02');


INSERT INTO AdvisorDecision VALUES
('D01','Accept','2025-01-15','R02'),
('D02','Accept','2025-01-16','R03');

INSERT INTO FinalAssignment VALUES
('FA01','S02','A01','D02','2025-01-20'),
('FA02','S03','A02','D01','2025-01-21');


SELECT * FROM Department;
SELECT * FROM Student;
SELECT * FROM Advisor;

SELECT
    s.FullName AS StudentName,
    a.FullName AS AdvisorName,
    d.DepartmentName,
    f.AssignmentDate
FROM FinalAssignment f
JOIN Student s ON f.StudentID = s.StudentID
JOIN Advisor a ON f.AdvisorID = a.AdvisorID

JOIN Department d ON f.DepartmentID = d.DepartmentID;
