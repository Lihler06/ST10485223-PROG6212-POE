CREATE TABLE Role
(
    RoleID INT IDENTITY(1,1) PRIMARY KEY,
    RoleName VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE [User]
(
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    RoleID INT NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
    ProfilePictureUrl VARCHAR(500) NULL,

    CONSTRAINT FK_User_Role
        FOREIGN KEY (RoleID) REFERENCES Role(RoleID)
);

CREATE TABLE Event
(
    EventID INT IDENTITY(1,1) PRIMARY KEY,
    OrganiserID INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Description VARCHAR(500) NOT NULL,
    EventDate DATE NOT NULL,
    Location VARCHAR(200) NOT NULL,
    Distance DECIMAL(6,2) NOT NULL,
    EventType VARCHAR(20) NOT NULL,
    BannerImageUrl VARCHAR(500) NULL,

    CONSTRAINT FK_Event_Organiser
        FOREIGN KEY (OrganiserID) REFERENCES [User](UserID),

    CONSTRAINT CK_Event_Type
        CHECK (EventType IN ('Run', 'Walk', 'Cycle')),

    CONSTRAINT CK_Event_Distance
        CHECK (Distance > 0)
);
CREATE TABLE Category
(
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    EventID INT NOT NULL,
    CategoryName VARCHAR(100) NOT NULL,
    MinimumAge INT NULL,
    MaximumAge INT NULL,
    Distance DECIMAL(6,2) NULL,

    CONSTRAINT FK_Category_Event
        FOREIGN KEY (EventID) REFERENCES Event(EventID),

    CONSTRAINT CK_Category_Age
        CHECK (
            (MinimumAge IS NULL AND MaximumAge IS NULL)
            OR
            (MinimumAge >= 0 AND MaximumAge >= MinimumAge)
        ),

    CONSTRAINT CK_Category_Distance
        CHECK (Distance IS NULL OR Distance > 0)
);
CREATE TABLE Enrolment
(
    EnrolmentID INT IDENTITY(1,1) PRIMARY KEY,
    EventID INT NOT NULL,
    ParticipantID INT NOT NULL,
    CategoryID INT NOT NULL,
    EnrolmentDate DATETIME2 NOT NULL DEFAULT GETDATE(),
    EnrolmentStatus VARCHAR(20) NOT NULL DEFAULT 'Pending',

    CONSTRAINT FK_Enrolment_Event
        FOREIGN KEY (EventID) REFERENCES Event(EventID),

    CONSTRAINT FK_Enrolment_Participant
        FOREIGN KEY (ParticipantID) REFERENCES [User](UserID),

    CONSTRAINT FK_Enrolment_Category
        FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),

    CONSTRAINT UQ_Enrolment_Participant_Event
        UNIQUE (ParticipantID, EventID),

    CONSTRAINT CK_Enrolment_Status
        CHECK (EnrolmentStatus IN ('Pending', 'Confirmed', 'Cancelled'))
);
CREATE TABLE Result
(
    ResultID INT IDENTITY(1,1) PRIMARY KEY,
    EnrolmentID INT NOT NULL,
    FinishTime TIME NOT NULL,
    FinishPosition INT NOT NULL,
    ResultStatus VARCHAR(20) NOT NULL DEFAULT 'Unpublished',
    PublishedDate DATETIME2 NULL,

    CONSTRAINT FK_Result_Enrolment
        FOREIGN KEY (EnrolmentID) REFERENCES Enrolment(EnrolmentID),

    CONSTRAINT UQ_Result_Enrolment
        UNIQUE (EnrolmentID),

    CONSTRAINT CK_Result_Position
        CHECK (FinishPosition > 0),

    CONSTRAINT CK_Result_Status
        CHECK (ResultStatus IN ('Unpublished', 'Published'))
);
INSERT INTO Role (RoleName)
VALUES
('Organiser'),
('Participant');


INSERT INTO [User]
    (RoleID, FirstName, LastName, Email, PasswordHash, PhoneNumber)
VALUES
(1, 'Thabo', 'Mokoena', 'thabo.organiser@raceday.co.za', 'HASHED_PASSWORD_1', '0711111111'),
(1, 'Lerato', 'Dlamini', 'lerato.organiser@raceday.co.za', 'HASHED_PASSWORD_2', '0722222222'),
(2, 'Sipho', 'Nkosi', 'sipho.participant@raceday.co.za', 'HASHED_PASSWORD_3', '0733333333'),
(2, 'Amahle', 'Zulu', 'amahle.participant@raceday.co.za', 'HASHED_PASSWORD_4', '0744444444');
INSERT INTO Event
    (OrganiserID, Name, Description, EventDate, Location, Distance, EventType)
VALUES
(1, 'Durban City Run', 'A scenic road running event through Durban.', '2026-10-18', 'Durban, KwaZulu-Natal', 10.00, 'Run'),
(1, 'Pietermaritzburg Cycle Challenge', 'A challenging cycling event through Pietermaritzburg.', '2026-11-08', 'Pietermaritzburg, KwaZulu-Natal', 40.00, 'Cycle'),
(2, 'Johannesburg Community Walk', 'A community walking event for all fitness levels.', '2026-12-05', 'Johannesburg, Gauteng', 5.00, 'Walk');
INSERT INTO Category
    (EventID, CategoryName, MinimumAge, MaximumAge, Distance)
VALUES
(1, 'Junior 10K', 16, 18, 10.00),
(1, 'Open 10K', 19, 39, 10.00),
(1, 'Masters 10K', 40, 99, 10.00),

(2, 'Open 40K', 18, 39, 40.00),
(2, 'Masters 40K', 40, 99, 40.00),

(3, 'Junior 5K', 13, 17, 5.00),
(3, 'Open 5K', 18, 39, 5.00),
(3, 'Masters 5K', 40, 99, 5.00);
INSERT INTO Enrolment
    (EventID, ParticipantID, CategoryID, EnrolmentStatus)
VALUES
(1, 3, 1, 'Confirmed'),
(1, 4, 2, 'Confirmed'),
(2, 3, 4, 'Pending'),
(3, 4, 7, 'Confirmed');
SELECT * FROM Role;
SELECT * FROM [User];
SELECT * FROM Event;
SELECT * FROM Category;
SELECT * FROM Enrolment;
SELECT * FROM Result;
