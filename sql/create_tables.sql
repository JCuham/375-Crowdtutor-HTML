CREATE TABLE UserAccount (
    userID int(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    phoneNum VARCHAR(64),
    password VARCHAR(128), NOT NULL
    email VARCHAR(128) NOT NULL,
    userActive int(1), --bool value 1 for true 0 for false
    wantLongTerm int(1),
    learnerCount int(32),
    currentHours int(3),
    currentSessions int(3),
    searchConsider int(1) 
);

CREATE TABLE LearnerPreference (
    learnerPrefID int(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    learnerID int(8) REFERENCES UserAccount(userID),
    tutorGender VARCHAR(64),
    knowledgeLevel int(2), -- rating from 1 to 10
    prefOnline int(1)
);

CREATE TABLE TutorPreference (
    tutorPrefID int(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tutorID int(8) REFERENCES UserAccount(userID),
    learnerGender VARCHAR(64),
    maxLearners int(3),
    maxSessions int(3)
);

CREATE TABLE AvailableTimeslot (
    timeslotID int(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    timeslotUserID int(8) REFERENCES UserAccount(userID),
    startTime DATE,
    timeslotLength int(3),
    repeat int(1)
);

CREATE TABLE UserBlock (
    userBlockID int(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userID int(8) REFERENCES UserAccount(userID), --The user who is requesting to block someone
    blockUserID int(8) REFERENCES UserAccount(userID) --The user to be blocked
);

CREATE TABLE Course (
    courseID int(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    courseName VARCHAR(64),
    courseDepartment VARCHAR(64)
);

CREATE TABLE UserCourse (
    userCourseID int(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userID int(8) REFERENCES UserAccount(userID),
    courseID int(8) REFERENCES Course(courseID),
    courseKnowledge int(2)
);

CREATE TABLE TutoringSession (
    sessionID int(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    learnerID int(8) REFERENCES UserAccount(userID) NOT NULL,
    tutorID int(8) REFERENCES UserAccount(userID) NOT NULL,
    courseID int(8) REFERENCES Course(courseID),
    startTime DATE,
    sessionLength int(2) --In hours currently could be changed to datetime and have time calculation done in query
);