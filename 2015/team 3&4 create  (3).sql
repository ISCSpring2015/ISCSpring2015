SET NOCOUNT OFF
USE [master]
GO
-----------------------------------------------------
-- 	Creating Database  --
----------------------------------------------------
GO

--Check if the database exists
IF EXISTS(select * from sys.databases where name='DATABASE_EDTS')
    BEGIN
    ALTER DATABASE DATABASE_EDTS
	SET SINGLE_USER
    WITH ROLLBACK IMMEDIATE
	DROP DATABASE DATABASE_EDTS
	END
GO
CREATE DATABASE DATABASE_EDTS
GO
USE DATABASE_EDTS
GO

/****** Object: Tables    Script Date: 02/20/2015  ******/
GO 
--LOGIN TABLE CREATION

--Team 4
CREATE TABLE tblCurriculum
(
CurriculumID INT IDENTITY(1,1) PRIMARY KEY,
Name VARCHAR(128) NOT NULL,
ShortName VARCHAR(50) NOT NULL,
Purpose VARCHAR(512)
)
GO
--Team4
CREATE TABLE tblSection
(
SectionID INT IDENTITY(1,1) NOT NULL,
CurriculumID INT NOT NULL,
Name VARCHAR(128) NOT NULL,
ShortName VARCHAR(64) NOT NULL,
Purpose VARCHAR(256),
CONSTRAINT PK_SectionID PRIMARY KEY(SectionID),
CONSTRAINT Fk_tblSections_CurriculumID FOREIGN KEY(CurriculumID)
REFERENCES tblCurriculum(CurriculumID)
)
GO

/*BKlevel1 Table*/
--Team 3
GO
CREATE TABLE tblBKLevel1
(
BKLevel1ID INT IDENTITY(1,1) NOT NULL,
CurriculumID INT NOT NULL,
NumberLevel1 INT NOT NULL,
Name VARCHAR(256) NOT NULL,
ShortName VARCHAR(64) NOT NULL,
CONSTRAINT PK_BKLevel1ID PRIMARY KEY(BKLevel1ID),
CONSTRAINT Fk_CurriculumID FOREIGN KEY(CurriculumID)
REFERENCES tblCurriculum(CurriculumID)
)
GO
PRINT 'Table Created Successfully'

---Team 3
/*Bklevel2 Table*/
 
CREATE TABLE tblBKLevel2
(
BKLevel2ID INT IDENTITY(1,1) NOT NULL,
BKLevel1ID INT NOT NULL,
Name VARCHAR(256) NOT NULL ,
ShortName VARCHAR(64) NOT NULL,
NumberLevel1 INT NOT NULL,
NumberLevel2 INT NOT NULL,

CONSTRAINT PK_BKLevel2ID PRIMARY KEY(BKLevel2ID),
CONSTRAINT Fk_BKLevel2_curriculumid FOREIGN KEY (BKLevel1ID)
REFERENCES tblBKLevel1(BKLevel1ID)
)




GO

PRINT 'Table Created Successfully'

 /*Skills set Table*/
 
 ---Team 4
CREATE TABLE tblSkillSet(
	SkillsetID INT IDENTITY (1,1) NOT NULL,
	Name VARCHAR (100) NOT NULL,
	ShortName VARCHAR(100) NOT NULL,
	skillSetNum1 INT NOT NULL,
	CurriculumID INT NOT NULL,
	CONSTRAINT pk_SkillSetID PRIMARY KEY (SkillSetID),
	CONSTRAINT fk_skill FOREIGN KEY (CurriculumID) REFERENCES tblCurriculum(CurriculumID)

) 
GO

/*Skills Table*/
 --drop table [dbo].[tblSkills]
 ---team 3
GO
CREATE TABLE tblSkill
(
	SkillID INT IDENTITY (1,1) NOT NULL,
	SkillsetID INT NOT NULL,
	SkillSetNum1 int NOT NULL,
	SkillNum2 int NOT NULL,
	Name varchar(128),
	ShortName varchar(64)
	CONSTRAINT PK_SkillsID PRIMARY KEY (SkillID),
	CONSTRAINT FK_Skills_SkillSetID FOREIGN KEY (SkillsetID) 
	REFERENCES tblSkillSet (SkillsetID)

) 

GO
PRINT 'Table Created Successfully'

 

--Course table
--- team 3
 CREATE TABLE tblCourse
(
CourseID INT IDENTITY(1,1) not null ,
SectionID INT,
Name VARCHAR(100) NOT NULL,
ShortName VARCHAR(128) NOT NULL,
CatalogCopy VARCHAR(2056) ,
Prerequisites VARCHAR(128) ,
YearInCurriculum VARCHAR(5) NOT NULL,
Scope VARCHAR(1024) ,
Topics VARCHAR(1024) ,
Discussion VARCHAR(2056) ,
CONSTRAINT PK_CourseID PRIMARY KEY (CourseID),
CONSTRAINT Fk_Course_SectionID FOREIGN KEY(SectionID)
REFERENCES tblSection(SectionID)
)
GO


/* SubSkills Table */

---Team 3
GO
CREATE TABLE tblSubSkills
(
    SubskillsID INT IDENTITY (1,1) NOT NULL,
	SkillID INT NOT NULL,
	OutcomeID int NOT NULL,
	BKLevel2Id int NOT NULL,
	SkillSetNum1 int NOT NULL,
	SkillNum2 int NOT NULL,
	SubSkillNum3 int NOT NULL,
	Name varchar (256) NOT NULL,
	ShortName VARCHAR (128) NOT NULL,
	JobAdWords VARCHAR(1024) 
	CONSTRAINT PK_SubskillsID PRIMARY KEY (SubskillsID)
	Constraint FK_Subskills_SkillsID FOREIGN KEY (SKillID)
	REFERENCES tblSkill (SkillID)
)
GO
PRINT 'Table Created Successfully'




/*SubskillsinBK2 Table*/
---Team 3

CREATE TABLE tblSubskillsinBk2
(
SubskillsBk2ID INT IDENTITY(1,1) NOT NULL,
SubskillsID INT NOT NULL,
BkLevel2ID INT NOT NULL,
CONSTRAINT PK_SubskillsBK2ID PRIMARY KEY (SubskillsBk2ID),
CONSTRAINT Fk_SubskillsinBk2_SubskillsID FOREIGN KEY(SubskillsBk2ID)
REFERENCES tblSubSkills(SubskillsID),
CONSTRAINT Fk_SubskillsinBk2_BkLevel2ID FOREIGN KEY(BkLevel2ID)
REFERENCES tblBkLevel2(BkLevel2ID)

)
GO
PRINT 'Table Created Successfully'
 
 ---Team 4
 CREATE TABLE tblOutcome(
	OutcomeID INT IDENTITY(1,1) PRIMARY KEY,
	CourseID INT NOT NULL ,
	Name VARCHAR(256) NOT NULL,
	ShortName VARCHAR(128) NOT NULL,
	DepthOfKnowledge INT,
	CONSTRAINT fk_course_id FOREIGN KEY (CourseID) 
	REFERENCES tblCourse(courseID)
)
GO
 ---team 4
 CREATE TABLE tblOutcomeinBK2(
	OutcomeBK2ID INT IDENTITY(1,1) NOT NULL,
	OutcomeID INT NOT NULL,
	BKLevelID INT NOT NULL,
CONSTRAINT PK_OutcomeBK2ID PRIMARY KEY(OutcomeBK2ID),
CONSTRAINT Fk_tblOutcomeinBK2_OutcomeID FOREIGN KEY(OutcomeID)
REFERENCES tblOutcome(OutcomeID),
CONSTRAINT Fk_tblOutcomeinBK2_BKLevelID FOREIGN KEY(BKLevelID)
REFERENCES tblBKLevel2(BKLevel2ID),
)
GO
--Team4
CREATE TABLE tblSubskillsinOutcome(
	SubskillsinoutcomeID INT IDENTITY (1,1) NOT NULL,
	OutcomeID INT NOT NULL,
	SubskillsID INT NOT NULL,
	CONSTRAINT pk_SubskillsinoutcomeID PRIMARY KEY (SubskillsinoutcomeID),
	CONSTRAINT tblSubskillsinoutcome_OutcomeID FOREIGN KEY (OutcomeID) REFERENCES tblOutcome(OutcomeID),
       CONSTRAINT tblSubskillsinoutcome_SubskillsID FOREIGN KEY (SubskillsID) REFERENCES tblSubskills(SubskillsID)
) 
 GO
 CREATE TABLE [dbo].[Person](
	[personid] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [nvarchar](30) NOT NULL,
	[lastname] [nvarchar](30) NOT NULL,
	[address1] [nvarchar](128) NOT NULL,
	[address2] [nvarchar](128) NULL,
	[city] [nvarchar](40) NOT NULL,
	[state] [nvarchar](40) NOT NULL,
	[zipcode] [nvarchar](20) NOT NULL,
	[username] [nvarchar](20) NOT NULL,
	[password] [varchar](30) NOT NULL,
	[phonenumber1] [nvarchar](30) NOT NULL,
	[EmailID] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO