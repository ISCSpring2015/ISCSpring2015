
USE DATABASE_EDTS
GO
--Team4
--Inserting values into Curriculum table
INSERT INTO [dbo].[tblCurriculum]([Name], [ShortName], [Purpose]) 
VALUES ('Model Curriculum and Guidelines for Undergraduate Degree Programs in Information Systems','IS2002','represents the views of organizations employing the graduates ');

/*INSERT INTO [dbo].[tblCurriculum] ([Name], [ShortName], [Purpose]) 
VALUES ('InformationSystems1997','IS1997', 'represents the views of organizations employing the graduates ');

INSERT [dbo].[tblCurriculum] ([Name], [ShortName], [Purpose])
 VALUES ('InformationSystems2010','IS2010', 'represents the views of organizations employing the graduates ');*/

GO

--Inserting values into BKLevel1
---Team 3
SET IDENTITY_INSERT [dbo].[tblBKLevel1] ON
GO
INSERT [dbo].tblBKLevel1 (BKLevel1ID,CurriculumID, NumberLevel1,Name, Shortname) VALUES (1,1,1, 'Information Technology', 'IT')
INSERT [dbo].tblBKLevel1 (BKLevel1ID,CurriculumID,NumberLevel1, Name, Shortname) VALUES (2,1, 2,'Organizational and Management Concepts', 'OMC')
INSERT [dbo].tblBKLevel1 (BKLevel1ID,CurriculumID, NumberLevel1,Name, Shortname)  VALUES (3,1,3, 'Theory and Development of Systems', 'TDS')

GO
SET IDENTITY_INSERT [dbo].[tblBKLevel1] OFF
----Team 4 sections
--Inserting values into Section table
GO
INSERT INTO tblSection(CurriculumID,Name,ShortName,Purpose) VALUES(1,'Common IS Curriculum','Core','A section is centered about one theme within the curriculum');


GO

--Inserting values into skillset table
---team 4
GO
INSERT INTO tblSkillSet(CurriculumID,skillSetNum1,Name,ShortName)  VALUES(1,1,'Information Technology Skills','IT');
INSERT INTO tblSkillSet(CurriculumID,skillSetNum1,Name,ShortName)  VALUES(1,2,'Organizational and Professional skills','OP');
INSERT INTO tblSkillSet(CurriculumID,skillSetNum1,Name,ShortName)  VALUES(1,3, ' Strategic Organizational Systems Development','SOSD');
GO


--Inserting values into Skill table
---team 3

GO
SET IDENTITY_INSERT [dbo].[tblSkill] on
GO
INSERT [dbo].tblSkill (SkillID,SkillsetID,SkillSetNum1,SkillNum2, Name, ShortName) VALUES (1,1, 1,1,'Software Development', 'SD')
INSERT [dbo].tblSkill (SkillID,SkillsetID,SkillSetNum1,SkillNum2, Name, ShortName) VALUES (2,1, 1,2,'Web Development', 'WD')
INSERT [dbo].tblSkill (SkillID,SkillsetID,SkillSetNum1,SkillNum2, Name, ShortName) VALUES (3,1, 1,3,'Database', 'DB')
INSERT [dbo].tblSkill (SkillID,SkillsetID,SkillSetNum1,SkillNum2, Name, ShortName) VALUES (4,1, 1,4,'Systems Integration', 'SI')
INSERT [dbo].tblSkill (SkillID,SkillsetID,SkillSetNum1,SkillNum2, Name, ShortName) VALUES (5,1, 1,5,'Information Assurance and Security', 'IA&S')

INSERT [dbo].tblSkill (SkillID,SkillsetID,SkillSetNum1,SkillNum2, Name, ShortName) VALUES (6,2, 1,1,'Business Fundamentals','BF')		

INSERT [dbo].tblSkill (SkillID,SkillsetID,SkillSetNum1,SkillNum2, Name, ShortName) VALUES (7,2, 1,1,'Individual and Team Interpersonal Skill','IT')			


INSERT [dbo].tblSkill (SkillID,SkillsetID,SkillSetNum1,SkillNum2, Name, ShortName) VALUES (8,3, 1,1,'Organizational Systems Development','OS')		

INSERT [dbo].tblSkill (SkillID,SkillsetID,SkillSetNum1,SkillNum2, Name, ShortName) VALUES (9,3, 1,1,'Project Management','PM')		

GO
SET IDENTITY_INSERT [dbo].[tblSkill] OFF
GO






---Inserting values into BKLevel2 table
---Team 3
SET IDENTITY_INSERT [dbo].[tblBKLevel2] ON
GO
INSERT [dbo].tblBKLevel2 (BKLevel2ID,BKLevel1ID,NumberLevel1,NumberLevel2 ,Name,ShortName) VALUES (1,1,1,1,'Computer Architectures','CA')
INSERT [dbo].tblBKLevel2 (BKLevel2ID,BKLevel1ID,NumberLevel1,NumberLevel2,Name,ShortName) VALUES (2,1,1,2,'Algorithms and Data Structures','ADS')
INSERT [dbo].tblBKLevel2 (BKLevel2ID,BKLevel1ID,NumberLevel1,NumberLevel2,Name,ShortName) VALUES (3,1,1,3,'	Programming Languages','PL')
INSERT [dbo].tblBKLevel2 (BKLevel2ID,BKLevel1ID,NumberLevel1,NumberLevel2,Name,ShortName) VALUES (4,1,1,4,'Operating Systems','OS')
INSERT [dbo].tblBKLevel2 (BKLevel2ID,BKLevel1ID,NumberLevel1,NumberLevel2,Name,ShortName) VALUES (5,1,1,5,'Telecommunications','TELCOM')
INSERT [dbo].tblBKLevel2 (BKLevel2ID,BKLevel1ID,NumberLevel1,NumberLevel2,Name,ShortName) VALUES (6,1,1,6,'Database','DB')
INSERT [dbo].tblBKLevel2 (BKLevel2ID,BKLevel1ID,NumberLevel1,NumberLevel2,Name,ShortName) VALUES (7,1,1,7,'Artificial Intelligence','AI')

INSERT [dbo].tblBKLevel2 (BKLevel2ID,BKLevel1ID,NumberLevel1,NumberLevel2 ,Name,ShortName) VALUES (8,2,2,1,'General Organization Theory','GOT')
INSERT [dbo].tblBKLevel2 (BKLevel2ID,BKLevel1ID,NumberLevel1,NumberLevel2,Name,ShortName) VALUES (9,2,2,2,'Information Systems Management','ISM')
INSERT [dbo].tblBKLevel2 (BKLevel2ID,BKLevel1ID,NumberLevel1,NumberLevel2,Name,ShortName) VALUES (10,2,2,3,'Decision Theory','DT')
INSERT [dbo].tblBKLevel2 (BKLevel2ID,BKLevel1ID,NumberLevel1,NumberLevel2,Name,ShortName) VALUES (11,2,2,4,'Organizational Behavior','OB')
INSERT [dbo].tblBKLevel2 (BKLevel2ID,BKLevel1ID,NumberLevel1,NumberLevel2,Name,ShortName) VALUES (12,2,2,5,'Managing the Process of Change','MPC')
INSERT [dbo].tblBKLevel2 (BKLevel2ID,BKLevel1ID,NumberLevel1,NumberLevel2,Name,ShortName) VALUES (13,2,2,6,'Legal and Ethical Aspects of IS','L&EA')
INSERT [dbo].tblBKLevel2 (BKLevel2ID,BKLevel1ID,NumberLevel1,NumberLevel2,Name,ShortName) VALUES (14,2,2,7,'Professionalism','PM')
INSERT [dbo].tblBKLevel2 (BKLevel2ID,BKLevel1ID,NumberLevel1,NumberLevel2,Name,ShortName) VALUES (15,2,2,8,'Interpersonal Skills','IPS')

INSERT [dbo].tblBKLevel2 (BKLevel2ID,BKLevel1ID,NumberLevel1,NumberLevel2 ,Name,ShortName) VALUES (16,3,3,1,'Systems and Information Concepts','SIS')
INSERT [dbo].tblBKLevel2 (BKLevel2ID,BKLevel1ID,NumberLevel1,NumberLevel2,Name,ShortName) VALUES (17,3,3,2,'Approaches to Systems Development','ASD')
INSERT [dbo].tblBKLevel2 (BKLevel2ID,BKLevel1ID,NumberLevel1,NumberLevel2,Name,ShortName) VALUES (18,3,3,3,'Systems Development Concepts and Methodologies','SDCM')
INSERT [dbo].tblBKLevel2 (BKLevel2ID,BKLevel1ID,NumberLevel1,NumberLevel2,Name,ShortName) VALUES (19,3,3,4,'Systems Development Tools and Techniques','SDTT')
INSERT [dbo].tblBKLevel2 (BKLevel2ID,BKLevel1ID,NumberLevel1,NumberLevel2,Name,ShortName) VALUES (20,3,3,5,'Application Planning','AP')
INSERT [dbo].tblBKLevel2 (BKLevel2ID,BKLevel1ID,NumberLevel1,NumberLevel2,Name,ShortName) VALUES (21,3,3,6,'Risk Management','RM')
INSERT [dbo].tblBKLevel2 (BKLevel2ID,BKLevel1ID,NumberLevel1,NumberLevel2,Name,ShortName) VALUES (22,3,3,7,'Project Management','PM')
INSERT [dbo].tblBKLevel2 (BKLevel2ID,BKLevel1ID,NumberLevel1,NumberLevel2 ,Name,ShortName) VALUES (23,3,3,8,'Information and Business Analysis','IBA')
INSERT [dbo].tblBKLevel2 (BKLevel2ID,BKLevel1ID,NumberLevel1,NumberLevel2,Name,ShortName) VALUES (24,3,3,9,'Information Systems Design','ISD')
INSERT [dbo].tblBKLevel2 (BKLevel2ID,BKLevel1ID,NumberLevel1,NumberLevel2,Name,ShortName) VALUES (25,3,3,10,'Systems Implementation and Testing Strategies','SI&TS')
INSERT [dbo].tblBKLevel2 (BKLevel2ID,BKLevel1ID,NumberLevel1,NumberLevel2,Name,ShortName) VALUES (26,3,3,11,'Systems Operation and Maintenance','SOM')
INSERT [dbo].tblBKLevel2 (BKLevel2ID,BKLevel1ID,NumberLevel1,NumberLevel2,Name,ShortName) VALUES (27,3,3,12,'Systems Development for Specific Types of Information Systems','SDST')
GO
SET IDENTITY_INSERT [dbo].[tblBKLevel2] OFF
GO


-- Inserting values into Course table
----Team 3
GO
SET IDENTITY_INSERT [dbo].[tblCourse] ON
GO
INSERT [dbo].tblCourse (CourseID,SectionID, Name,ShortName,CatalogCopy,Prerequisites,YearInCurriculum,Scope,Topics,Discussion)
             VALUES (1,1,N'Personal Productivity with IS Technology',
			             N'IS 2002.P0',
						 N'Students with minimal skills will learn to enhance their personal productivity and problem solving skills by applying information technologies to problem situations and
			         by designing and using small information systems for individuals and groups',
					 N'Elementary knowledge of word processing, spreadsheets, e-mail, and Web browsing',
					 N'2002',
					 N'This prerequisite course enables students to improve their 
					 skills as knowledge workers',
					 N'Knowledge work productivity concepts; advanced software functionality to support personal and group productivity ',
					 N'The course has both a theoretical problem solving component and an equivalent 
					 component of structured supervised laboratory experience')  
INSERT [dbo].tblCourse (CourseID,SectionID, Name,ShortName,CatalogCopy,Prerequisites,YearInCurriculum,Scope,Topics,Discussion)
             VALUES (2,1,N'Fundamentals of Information Systems',N'IS 2002.1',N'Information systems are an integral part of all business activities and careers','IS 2002.P0','2002','This course provides an introduction to systems and development concepts,
                    information technology, and application software.','system components and relationships','Standard systems purpose and organization will be introduced.')
INSERT [dbo].tblCourse (CourseID,SectionID, Name,ShortName,CatalogCopy,Prerequisites,YearInCurriculum,Scope,Topics,Discussion) 
            VALUES (3,1,  N'Electronic Business Strategy, Architecture and Design',N'IS 2002.2',N'The course focuses on the linkage between organizational strategy and
                    networked information technologies','IS 2002.1','2002','This course examines the linkage of organizational strategy and electronic
                    methods of delivering products','Electronic commerce economics and business models,','A course in electronic business has during the recent years become an integral
                    part of the Information Systems curriculum.')
INSERT [dbo].tblCourse (CourseID,SectionID, Name,ShortName,CatalogCopy,Prerequisites,YearInCurriculum,Scope,Topics,Discussion)
             VALUES (4,1,N'Information Systems Theory and Practice',N'IS 2002.3',N'Students who have constructed personal information systems will be exposed to the theory of the Information Systems discipline', 
			         'IS 2002.1','2002','This course provides an understanding of organizational systems, planning, and decision process, and how information is used for decision support in organizations',
					 'Systems theory and concepts; information systems and organizational system;decision support; quality; level of systems: strategic, tactical, and operational; system components and relationships; information systems strategies; 
					  roles of information and information technology','Students having end-user skills who have implemented personal productivity systems using personal productivity work tools will be prepared to use the information systems theory 
					  presented in this course')
INSERT [dbo].tblCourse (CourseID,SectionID, Name,ShortName,CatalogCopy,Prerequisites,YearInCurriculum,Scope,Topics,Discussion)
             VALUES (5,1,N'Information Technology Hardware and System Software',N'IS 2002.4','Principles and application of computer hardware and software will be presented through lecture of the theoretical underpinnings, installation, configuration, and 
			         operational laboratory experiences','IS 2002.1','2002','This course provides the hardware/software technology background to enable systems development personnel to understand tradeoffs in computer architecture for effective use in a business environment. 
					 System architecture for networked computing systems and operating systems will be covered','Hardware: CPU architecture, memory, registers, addressing modes, busses, instruction sets, multi processors versus single processors; peripheral devices: hard disks 
					 and other storage devices, video display monitors, device controllers, input/output; operating systems functions and types; operating system modules: processes, process management, memory and file system management; examples and contrasts of hardware architectures 
					 and operating systems','Students who are knowledgeable of and have developed personal information systems will gain an in-depth exposure to information technology hardware and software components and their interaction.
                     A systems view of computer systems will be utilized in identification of computer system components. Peripheral devices will be identified and principles of operation will be studied and learned. The operating system software, including I/O drivers and extensions to 
					 the operating system will be examined, learned and utilized in the laboratory')
INSERT [dbo].tblCourse (CourseID,SectionID, Name,ShortName,CatalogCopy,Prerequisites,YearInCurriculum,Scope,Topics,Discussion)
             VALUES (6,1,N'Programming, Data, File and Object Structures',N'IS 2002.5','This course presents object oriented and procedural software engineering methodologies in data definition and measurement, abstract data type construction and use in developing screen editors, reports 
			        and other IS applications using data structures including indexed files','IS 2002.1','2002','This course provides an exposure to algorithm development, programming, computer concepts, and the design and application of data and file structures. It includes the use of
					logical and physical structures for both programs and data','Data structures and representation: characters, records, and files; precision of data; information representation, organization, and storage; algorithm development; programming control structures; program 
					correctness, verification, and validation; file structures and representation. Programming in traditional and visual development environments that incorporate event-driven, object-oriented design','Students will gain in-depth understanding of defining and measuring 
					events that produce data, both simple and complex, and principles, concepts, and practices of successful software development.Formal problem solving strategies will be presented. Program design methods and strategies including top down implementation will be discussed 
					and implemented. Graphic programming environments will be explored. Capabilities of a number of programming languages will be presented. Skills will be developed in at least one language supporting an indexed file system.
                    Software engineering principles will be practiced with a systems view. Students will learn to recognize objects and abstract data types, concepts of event driven and data flow models, module identification, modularity including parameters, module naming, cohesion, 
					coupling desired and erroneous practices, and testing. Verification and validation methods will be presented and practiced by generating small modules and larger programs.
                    Specific data structures including arrays, records, stacks, queues, and trees will be created and used. The course will provide an introduction to the use of predefined user interface components') 
INSERT [dbo].tblCourse (CourseID,SectionID, Name,ShortName,CatalogCopy,Prerequisites,YearInCurriculum,Scope,Topics,Discussion)
             VALUES (7,1,N'Networks and Telecommunication',N'IS 2002.6 ','Students will gain in-depth experience of networking and telecommunications fundamentals including LANs, MANs, WANs, intranets, the Internet, and the WWW. Data communication and telecommunication concepts, models,
			          standards, and protocols will be studied. Installation, configuration, systems integration and management of infrastructure technologies will be practiced in the laboratory','IS 2002.4','2002','This course provides an in-depth knowledge of data communications and 
					  networking requirements including networking and telecommunications technologies, hardware, and software. Emphasis is upon the analysis and design of networking applications in organizations. Management of telecommunications networks, cost-benefit analysis, and 
					  evaluation of connectivity options are covered. Students learn to evaluate, select, and implement different communication options within an organization','Telecommunication configurations; network and Web applications; distributed systems; wired and wireless 
					  architectures, topologies, and protocols; installation, configuration, and operation of bridges, routers, switches, and gateways; network performance tuning; privacy, security, firewalls, reliability; installation and configuration of networks; monitoring and
					   management of networks; and communications standards','Students who have used networking technologies to complete assignments in previous courses and who are knowledgeable of the significance of information technology in facilitating information systems will be
					   given an opportunity in this course to gain considerable depth in networking, both theoretically and through practical laboratory experience.Students will learn about some of the significant networking standards and the organizations that have developed the standards.
					   The ISO seven-layer OSI model and the TCP/IP model will be used as organizing frameworks. The ITU and IEEE standards will be reviewed and global telecommunication policies and competing standards will be examined.The technology supporting communications providers, 
					   satellite communications, as well as local and metropolitan systems will be explored. Devices including media, modems, multiplexers, computer interfaces, switches, and routers will be studied.Acquisition, installation, configuration, and other details of management 
					   of the various technologies will be studied')
INSERT [dbo].tblCourse (CourseID,SectionID, Name,ShortName,CatalogCopy,Prerequisites,YearInCurriculum,Scope,Topics,Discussion)
             VALUES (8,1,N'Analysis and Logical Design',N'IS 2002.7','Students with information technology skills will learn to analyze and design information systems. Students will practice project management during team oriented analysis and design of a departmental level system',
			         'IS 2002.1','2002','This course examines the system development and modification process. It emphasizes the factors for effective communication and integration with users and user systems. It encourages interpersonal skill development with clients, users, team members,
					  and others associated with development, operation, and maintenance of the system. Structured and object oriented analysis and design, use of modeling tools, adherence to methodological life cycle and project management standards','Life cycle phases: requirements 
					  determination, logical design, physical design, and implementation planning; interpersonal skills, interviewing, presentation skills; group dynamics; risk and feasibility analysis; group-based approaches: project management, joint application development (JAD), 
					  and structured walkthroughs; structured versus object oriented methodologies; RAD, prototyping; database design; software package evaluation, acquisition, and integration; global and inter-organizational issues and system integration; professional code of ethics',
					  'Students with the basic skills of information technology will learn to gather information in order to identify problems to be solved. They will determine system requirements and a logical design for an information system. A project of limited scope will be designed 
					  during this course.Students will investigate alternative solutions, and will determine feasibility of solutions. They will identify value added by the completion of the system.Students will be exposed to methods to support each stage of the development process. 
					  While automated tools are not a substitute for understanding of the processes involved, they may be used to ensure that a particular methodology is used rigorously. If manual methods are used, it is important to define the methodology thoroughly.
					  Project management will be taught and used to control the team project. Team concepts including personal and interpersonal skills will be discussed and monitored. Empowerment concepts will be used and measured. Scheduling and completing individual 
					  and group actions will be used to ensure project milestone completion')
INSERT [dbo].tblCourse (CourseID,SectionID, Name,ShortName,CatalogCopy,Prerequisites,YearInCurriculum,Scope,Topics,Discussion)
             VALUES  (9,1,N'Physical Design and Implementation with DBMS',N'IS 2002.8','Students successfully completing the analysis and logical design course will continue in this course to learn to develop the detailed physical design and implementation of a logical design',
			          'IS 2002.5 and IS 2002.7','2002','This course covers information systems design and implementation within a database management system environment. Students will demonstrate their mastery of the design process acquired in earlier courses by designing and 
					  constructing a physical system using database software to implement the logical design','Conceptual, logical, and physical data models, and modeling tools; structured and object design approaches; models for databases: relational and object oriented; design tools; data dictionaries, 
					  repositories, warehousing, and data mining; database implementation including user interface and reports; multi-tier planning and implementation; data conversion and post implementation review','Students who have completed the information analysis and logical design course will engage
					  in the physical design and implementation process for an information system of a limited scope Automated tools or manual methods will be used within a team oriented project environment to design and implement a departmental information system requiring an enterprise level database.
                      A data model will be developed to guide the detailed design process for database construction.A corresponding functional analysis of the problem will be completed. Program specifications will be developed and utilized in construction of the physical system. Unit testing, integration, 
					  and integration testing of the final system will be accomplished. Tools will be used to measure the complexity of solutions; quality assurance measures implemented as project standards will be used to control project quality and risk.Code generators or libraries will be used to 
					  facilitate rapid development of the desired system. Existing project management software will be used to manage user expectations and completed work')
INSERT [dbo].tblCourse (CourseID,SectionID, Name,ShortName,CatalogCopy,Prerequisites,YearInCurriculum,Scope,Topics,Discussion)
             VALUES (10,1,N'Physical Design and Implementation in Emerging Environments',N'IS 2002.9','Students who have completed the analysis and logical design course will extend their knowledge by implementing an information system in an emerging systems environment. Teams will use project management principles to implement an information system',
			         'IS 2002.2 and IS 2002.8','2002','This course covers physical design and implementation of information systems applications. Implementation in emerging distributed computing environments using traditional and contemporary development methodologies','Topics may include selection of development environments and standards; structured, 
					  event driven, and object oriented application design; testing; software quality assurance; system implementation; user training; system delivery; post implementation review; configuration management; maintenance; multi-tiered architectures and client independent design','Students will utilize a contemporary development environment 
					  to implement a project that spans the scope of the previous courses. If object-oriented programming has not been taught to the students earlier in the curriculum, then it should be used here. If only object-oriented methods have been used, some procedural methods should be employed.
                      System or object , modular design, use of control structures with proof of correctness, verification, testing and validation should be integral components of software quality assurance. Implementation standards should be developed by the students and used rigorously as project teams complete a significant system.
                      A conversion and training plan should be developed and implemented involving hardware, data, people, and software systems.Project management tools should be used to ensure timely completion of the project. Interdependence skills should be practiced and evaluated. A contemporary methodology should guide the project sequence')
INSERT [dbo].tblCourse (CourseID,SectionID, Name,ShortName,CatalogCopy,Prerequisites,YearInCurriculum,Scope,Topics,Discussion)
             VALUES (11,1,N'Project Management and Practice',N'IS 2002.10','Advanced IS majors operating as a high-performance team will engage in and complete the design and implementation of a significant information system. Project management, management of the IS function, and systems integration will be components of the project experience',
			         'IS 2002.7','2002','This course covers the factors necessary for successful management of information systems development or enhancement projects. Both technical and behavioral aspects of project management are applied within the context of an information systems development project',
					 'Managing the system life cycle: requirements determination, design, implementation; system and database integration issues; network management; project tracking, metrics, and system performance evaluation; managing expectations of managers, clients, team members, and others; determining skill requirements and staffing; cost-effectiveness analysis;
					  reporting and presentation techniques; management of behavioral and technical aspects of the project; change management. Software tools for project tracking and monitoring. Team collaboration techniques and tools','This is the capstone course for IS majors who have completed the systems analysis and design sequences. 
					  It focuses on engaging in and completing a major system development project.Within the project context management of IS, systems integration is an explicit requirement for students to address.The project is a team effort and allows a final opportunity to practice personal and interdependence skills to ensure team member empowerment and success.
					  Project management tools will be employed by the team to ensure tracking of the project and communication of project goals and accomplishments to the client.Automated development tools may or may not be used depending on available resources. However, standards will be developed for all project deliverables. 
					  Software quality assurance methodologies will be employed to ensure a successful outcome for the project.On-going presentation of project planning, analysis, design, conversion plan, and other documentation will be done by the team. Each team member should play a significant role in some aspect of presentation')

GO
SET IDENTITY_INSERT [dbo].[tblCourse] Off
GO

--Inserting values into Subskill table
---Team4

GO

SET IDENTITY_INSERT [dbo].[tblSubSkills] On
GO

INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 1,1,1,1,1,1,1,'Programming-principles, objects, algorithms,modules, testing','PO','principles, concepts, modularity, objects and ADTs, data structures, algorithmic design, verification and validation, cohesion, coupling, language selection, user interface design, desk checking, debugging, testing, error correction, documentation, installation, integration, operation; writing code in a modern programming language (e.g., Java, C#);  interpreted and compiled computer languages; design tools; secure coding principles and practices')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 2,1,1,2,1,1,2,'Application Development-requirements, specs,developing, HCI considerations','AD',' principles, concepts, standards; requirements, specifications, HCI planning, device optimization (e.g. touch screen, voice), development and testing, utilization of IDEs, SDKs, and tool kits; configuration management, installation, module integration; conversion, operation')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 3,1,1,3,1,1,3, 'Algorithmic Design, Data, Object and File Structures','AO','analysis, design, development, debugging, testing, simple data structures(arrays, records, strings, linked structures, stacks, queues, hash functions).  Functions, parameters, control structures, event driven concepts, OO design, encapsulation, classes, inheritance, polymorphism')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 4,1,1,4,1,1,4,'Problem Solving-identify problems, systems concepts, creativity','PS','devise questions to help identify problems, apply systems concepts to definition and solutions of problems, formulate creative solutions to simple and complex problems, Fishbone-root cause, SWOT, Simon Model, Triz, ASIT; embracing developing technoloogy; methodologoies (waterfall, object, spiral etc.)')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 5,1,1,5,1,1,5, 'Client Server Software Development','CS','thin/full client; software specs, development, testing, installation,configuration, trouble-shooting, enhancement, maintenance, training andsupport; report/interface, development, documentation standards, applicationconfiguration management--e.g. Source-safe; Dropbox, project documentation')


INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 6,1,1,1,1,2,1,'Web page Development-HTML, page editors, tools','WD','Frontpage, HTML, page building/edit tools, frames; http, dreamweaver, photoshop')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 7,1,1,1,1,2,2,'Web programming-thin client, asp, aspx, ODBC, CGI,E-commerce, web services, scripting','WP','thin client programming: page design; HTML, *.asp/aspx coding; session variables / page security; ODBC; CGI programming; integration of multi-media; e-commerce models; tools: Perl, Visual Studio, Java, Web services, XML server / client side coding, web services, hypertext, n-tier architectures; integration of mobile technology')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 8,1,1,1,1,2,3,'Web Systems Development Tools','WS','e.g, sharepoint, Joomla, Drupal, IDEs, SDKs, snagit, Jing')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 9,1,1,1,1,2,4,'Web Security and Vulnerability','WV','vulnerability, penetration testing, vulnerability sanning; browser security; external memory issues')

INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 10,1,1,1,1,3,1,'Modeling and design, construction, schema tools,DB systems','MD','Data modeling, SQL, construction, tools -top down, bottom up designs; schema development tools; desk-top/enterprise conversions; systems: Access, SQL Server/Oracle/Sybase, data warehousing & mining; scripts, GUI tools; retrieve, manipulate and store data; tables, relationships and views')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 11,1,1,1,1,3,2,'Triggers, Stored Procedures, Audit Controls: Design / Development','TG','triggers, audit controls-stored procedures, trigger concepts, design, development, testing; audit control concepts/standards, audit control Implemetation; SWL, concepts, procedures embedded programming (e.g. C#)')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 12,1,1,1,1,3,3,'Administration: security, safety, backup, repairs,Replicating','AD','monitoring, safety -security, administration, replication, monitoring, repair,upgrades, backups, mirroring, security, privacy, legal standards, HIPAA; data administration, policies')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 13,1,1,1,1,3,4,'Metadata: architectures, systems, and administration','MD','definition, principles, practices, role of metadata in database design, repository, dictionaries, creation, ETL, administration, usage, tools')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 14,1,1,1,1,3,5,'Data Warehouse: design, conversions, reporting','DW','star schema, ETL, data cleansing and storage, reporting tools, business intelligence, analytic queries, SQL OLAP extensions, data mining')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 15,1,1,1,1,3,6,'Data Quality: dimensions, assessment,  improvement','DQ','Data Accuracy, Believability, Relevancy, Resolution, Completeness, Consistency, Timeliness; Data definition quality characteristics, Data model / requirements quality characteristics;  Data clean-up of legacy data, Mapping, transforming, cleansing legacy data; Data defect prevention, Data quality employee motivation, Information quality maturity assessment, gap analysis')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 16,1,1,1,1,3,7,'Database Security','DS','SQL injection attacks and counter measures; encryption; limiting exposure in internet applications; risk management: attacks and countermeasures')

INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 17,1,1,1,1,4,1,'Computer Systems Hardware','CH','fundamentals: cpu computer system block diagram, firmware, digital logic, serial vs parallel, bus, interface components;  memory addressing, coding, data representation; assembler, multi-processors, DMA,, disk, tape, interrupts; embedded systems; fault tolerance; microprocessors')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 18,1,1,1,1,4,2,'Networking (Lan/Wan) and Telecommunications','NW','fundamentals: media, devices, layered models, TCP/IP, telephony, network architecture; communication protocols such as TCP/IP, Host configuration, Domain Name Server')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 19,1,1,1,1,4,3,'Operating Systems Management-multi platforms/protocols, Win/Unix/Linux/VM','OM','multi platforms, multi protocols; systems Win XP, Win 2003 Unix; Linux, installation, configuration; security; connectivity, performance monitoring, virtual machine emulations; Open Systems models; distributed computing')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 20,1,1,1,1,4,4,'Computer Systems Software-OS fundamentals,resource mgt concepts','CF','OS fundamentals: memory, disk, tape and resource management, remote scheduling, memory management, device management, security, file systems, real-time and embedded systems, fault tolerance, scripts')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 21,1,1,1,1,4,5,'LAN/WAN Design and Management','LW','ethernets, hubs, routers, TCP/IP, internet, intranet; enterprise networking,Lans/Wans, network administration, design, configuration, installation,optimization, monitoring, testing, troubleshooting, router configuration, router,protocols, switches, firewalls and security, wireless considerations; network security architecture-defense in depth principles; network access and authorization (e.g. public key infrastructure); security objectives, operational objectivew and tradeoffs; security controls; identification and vulnerabilities')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 22,1,1,1,1,4,6,'Systems Configuration, Operation, Administration','SC','architecture, configuration, conversion, installation, integration,administration, monitoring, maintenance, upgrades, documentation service pack scheduling, client services, users and user groups, replicatrion backups, disaster planning and recovery, site management, COOP, power management, multi-site fail-over mechanisms, user education; security audit procedures; virtualization; fault tolerance')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 23,1,1,1,1,4,7,'Intersystems Communications','IS','Customer Information Control System/Intersystems Communications(CICS/ISC)')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 24,1,1,1,1,4,8,'Data mapping and exchange','DM','types include bidirectional, unidirectional, translation key (ex. SNOMED to ICD-9)')

INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 25,1,1,1,1,5,1,'Information Assurance Model','IA','Security services, information states,  security countermeasures, Security implementation: gates, guards, guns; cryptography, Disaster recovery, Business continuity planning, forensics; IA architecture')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 26,1,1,1,1,5,2,'Security Mechanisms','SM','cryptography: cryptosystems, keys-semetric/asymmetric, performance authentication (who you are, what you have/know), passwords bio-authentication;  Redundancy, intrusion detection')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 27,1,1,1,1,5,3,'Security Operations','SO','ethical/legal issues, auditing, costs/benefits, standards-DES, ISO 177799 risk identification/mitigation, physical security implementation business impact analysis, CASPR, technology innovation and risk incident management, enforcement')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 28,1,1,1,1,5,4,'Security Policy','SP','IAS policy/procedure creation, vulnerability, countermeasures security technology and system access (multi-levels classification e.g. unclassified, top secrete ...), property seizure information management/system administration and security,security services: availability, integrity, authentication user education; develop/update security policies and implement system designs which meet objectives (confidentiality, integrity, availability...)')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 29,1,1,1,1,5,5,'Security Attacks','SA','denial of service, protocol attacks, active/passive attacks, buffer overflow attacks, viruses, trogan horses, worms, adware, penetration testing, digital forensics, legal evidence, media analysis, threat analysis: risk assessment and cost benefit to businness processes vulnerability--prepetrators: inside / external, hacker / cracker; hardware / software.  Firewalls, demilitarized zones, and encryption; Use of tools to detect network intrusions and vulnerability')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 30,1,1,1,1,5,6,'Privacy Impact','PI','Requirements for confidentiality, integrity and availability;  privacy impact analysis of application security design protecting personal identifiable information.')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 31,1,1,1,1,5,7,'Information Assurance Systems','IAS','documentation of information assurance components which allocate security functions')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 32,1,1,1,1,5,8,'Information Systems Email Management','IE','application of confidentiality, integrity and availability principles;  threat and vulnerability analysis; detection of security gaps in application and system architectures')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 33,1,1,1,1,5,9,'Information Technology Security Principles','ITS','IA certification and accreditation; process activities and related documentation, system life-cycle support plans, concepts fo operations, procedures and trainng materials; security risks and countermeasures; security controls needs;  security management;  concepts of policy-based and risk adaptive access controls')


INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 34,1,1,1,2,1,1,'Learning Business Process and Enviroment','LB','learning business process and environment, exchanges, competitive position, e-business, global concepts, business models, Creating value, Value chain, improving value creation; financial markets, determining value of securities; organizational models')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 35,1,1,1,2,1,2,'Accounting, Distribution, Finance, HR, Marketing, Production','AD','accounting (language of money, representations of accounts, reports), distribution (purchasing, supply chain management, distribution systems), finance, human resources (laws, compensation, recruiting, retention, training), marketing (the market, customers and customer satisfaction, market strategies, cycle time and product life cycle; environment scanning), production, international business')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 36,1,1,1,2,1,3,'Business Problems and Appropriate Technical solutions','BP','business problems and appropriate technical solutions;  quantitive analysis and statistical solutons; decision formulation and decision making; business intelligence systems')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 37,1,1,1,2,1,4,'Business Law','BL','legal system, courts, dispute resolution processes (mediation, arbitration, concilation, negotiation, trial); types of organizations,contracts, warranties, and product liability.')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 38,1,1,1,2,1,5,'Disaster Recovery','DR','identify essential system functions to support business functions for restoration and recovery after a catastrophic failure; define requirements for critical system performance and continuity of business function; backup, replication, fail-over processes in support of system performance subsequent to a disaster')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 39,1,1,1,2,1,6,'Enterprise Information Systems','EIS','Alignment of business processes with large system structures; configuratioon of large systems; implementation and training; integration with business intelligence capabilities and optimization of business procedure.')

INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 40,1,1,1,2,2,1,'Learning to learn','LL','attitude of personal responsibility, journals, learning maps, habits of reading,listening to tape/cd, attending professional seminars, teaching others, meta-thinking, life long learning; human learning: recognition, differentiation, use, application, analysis, synthesis and evaluation')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 41,1,1,1,2,2,2,'Professionalism-self directed, leadership, time management','PS','being self-directed and proactive, personal goal setting, leadership, time management, being sensitive to organizational culture and policies')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 42,1,1,1,2,2,3,'Personal Skills-encouraging, listening, being Organized, principles of motivation','PE','encouraging, listening, negotiating, being persuasive, being organized Personality types and relationships (DISC, MBTI, COLOR)')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 43,1,1,1,2,2,4,'Professionalism-committing to and completing work','PC','Persistence, committing to and rigorously completing assignments, can-do')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 44,1,1,1,2,2,5,'Teams-team building, vision / mission development,Synergy building and problem solving; leadership','TT','team building, vision and mission development, planning, synergistic consensus team leadership, leadership development, negotiation, conflict resolution')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 45,1,1,1,2,2,6,'Communication-oral, written, multimedia, empathetic listening','CO','oral, written, and multimedia techniques; communicating in a variety of settings; empathetic listening, principle centered leadership, alignment technical memos, system documentation, technical requirements; necessity for involvement; development of resistance')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 46,1,1,1,2,2,7,'Ethics-theory/concepts,setting an ethical example','ET','ethical theory and concepts, codes of ethics--AITP/ACM; setting an ethical example; ethical policies, intellectual property, hacking, identity theft')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 47,1,1,1,2,2,8,'Critical Thinking','CT','fact recognition, argument strength, analysis (break into components), synthesis( assembling the components); abstraction; qualitative research principles')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 48,1,1,1,2,2,9,'Fundamentals','FS','Mathematics (algebra, trigonometry, variables, operations, expressions, logic, probability, limits, statistics)')

INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 49,1,1,1,3,1,1,'Strategic Utilization of Information Technology','SU','use of IT to support business process, integration of customer requirements; team development of systems, reengineering concepts and application, methodologies, interfaces, systems engineering, CRM and ERP concepts; Agile, Object, Lean UX and other methodologies; identification of security issues, incorporation of security concepts into designs ensuring security principles')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 50,1,1,1,3,1,2,'IT Planning','IP','value of IT, integration of IT in reengineering, IT policy, end user advocacy and optimiznation, IT advocacy and alignment outsourcing / offshoring (risks, benefits, opportunities), training; capture security controls and requirements, ensure integration of security objectives, assurance of people and information protection; ensure security in interface considerations')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 51,1,1,1,3,1,3,'IT and Organizational Systems','IO ','types of systems relationship of business process and IT, user developed systems, use of packaged software, decision systems, social systems; information assurance and security designs')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 52,1,1,1,3,1,4,'Information Systems Analysis and Design','ID','information analysis, group techniques / meetings design, systems engineering, Information architectures, enterprise IS development with strategic process; application and security planning; conversion and testing, HIPAA, FERPA, ISACA, GAAP;  requirements analysis. cost analysis, satisfaction of user need / involvement, development time, adequacy of information assurance controls; consideration / adoption of emerging technology (e.g. mobile computing), consideration of optimal life-cycle methodologies and tools')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 53,1,1,1,3,1,5,'Decision  Making','DM','personal decision making, Simon’s model, structured, unstructured decisions, decision tools, expert systems, advanced problem solving (Triz, Asit); business intelligence, advanced reporting technologies.')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 54,1,1,1,3,1,6,'Systems Concepts, Use of IT, Customer Service','SC','develop client relationships, understand and meet need, involving the client at all phases of the life-cycle; review of customer functional requirements; consideration of improved business process; assurance of customer needs into requirements analysis')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 55,1,1,1,3,1,7,'Systems Theory and Quality  Concepts','ST','system components, relationships, flows, concepts and application of events and measurement, customer expectations, quality concepts')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 56,1,1,1,3,1,8,'CMMI and Quality Models','CMM','quality culture, goals;  developing written standards, templates;  process metrics development process improvement through assessment, lessons learned')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 57,1,1,1,3,1,9,'Systems Engineering Techniques','SET','scope development, requirements determination, system design, detailed design and specifications, Enterprise Architecture, System architecture, information architecture, make or buy, RFP/Bid Process verification and requirements tracing, validation planning and test case development, unit testing, integration, system testing, system certification, system acceptance, installation and operation of the system, post-implementation audit; ensuring security designs, secure configuration management; agency evaluation and validation of requirements; ensuring customer training and incorporation of installation teams')

INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 58,1,1,1,3,2,1,'Project Goal Setting and Planning','PG','establish project goals consistent with organizational goals as well as re-engineering initiatives;  project plan and scope statements: cost, schedule and performance; project initiation, project charter')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 59,1,1,1,3,2,2,'Monitor and Direct Resources and Activities, Team Leading','MDR','specify, gather, deploy, monitor and direct resources and activities, team charter, RACI charts, project team building, team assessment')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 60,1,1,1,3,2,3,'Coordinate Life Cycle Scheduling and Planning','CL','life cycle coordination, consultant management, schedule management, use of project planning; reporting; documentation')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 61,1,1,1,3,2,4,'Apply concepts of continuous improvement','ACC','apply concepts of continuous quality improvement, providing reliable, cost-effective solutions that satisfy formal standards for performance, capacity, reliability, security, and safety; concept of standard practice--IEEE; ISO 9000;CMMI, 6 Sigma, Federal, state and local quality initiatives')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 62,1,1,1,3,2,5,'Project Scheduling and Tracking','PST','planning, scheduling and milestones; selection of process model; organizational issues; work breakdown structures; staffing; cost estimation, cost/benefit resources allocation, reviews, measurement, feedback, communication, ensuring quality, use project management software (PERT and Gantt Charts)')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 63,1,1,1,3,2,6,'Project Communications','PCM','Formal, invormal, nonverbal communications; media selection: hard copy, phone, email, meetings, web conference. Individual, group communication. Communication planning and management:  notifications-rules / responsibilities,When to communicate what to whom;  issue log and management')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 64,1,1,1,3,2,7,'Risk Management and Mitigation','RMM','Risk determination-root cause analysis, risk management:  risk probability, Risk impact;  probability / impact matrix and risk mitigation strategies— Avoidance, control, assumption, transfer.  Risk register')
INSERT [dbo].[tblSubSkills] ([SubskillsID],[SkillID],[OutcomeID],[BKLevel2Id],[SkillSetNum1],[SkillNum2],[SubSkillNum3],[Name],[ShortName],[JobAdWords]) VALUES ( 65,1,1,1,3,2,8,'Project Change Control','PCC','Configuaration Management, Security configuration management; Project change control Board, Requirements Change process, approvals, impact on scope, schedule and cost, work project completion and acceptance, scope creep.')





GO
SET IDENTITY_INSERT [dbo].[tblSubSkills] OFF
GO

SET IDENTITY_INSERT [dbo].[tblOutcome] ON

--Inserting values into Outcome table
 
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (1, 1, N'Understand how and why information systems are used today.', N'IS Today', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge])VALUES (2, 1, N'Explain the technology, people, and organizational components of information systems.', N'IS components', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (3, 1, N'Understand globalization and the role information systems has played in this evolution.', N'Global IS', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (4, 1, N'Understand how businesses are using information systems for competitive advantage vs. competitive necessity.', N'IS and competitive advantage', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (5, 1, N'Understand the value of information systems investments as well as learn to formulate a business case for a new information system', N'Value of IS', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (6, 1, N'Know the major components of an information systems infrastructure.', N'IS Infrastructure',1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (7, 1, N'Mitigate risks as well as plan for and recover from disasters.', N'Risk Mitigation', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (8, 1, N'Understand how information systems are enabling new forms of commerce between individuals, organizations, and governments.', N'IS enables organizations', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (9, 1, N'Be aware of emerging technologies that enable new forms of communication, collaboration, and partnering.', N'Emerging technologies', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (10, 1,N'Understand how various types of information systems provide the information needed to gain business intelligence to support the decision making', N'Types of IS', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (11, 1,N'Understand how enterprise systems foster stronger relationships with customers and suppliers and how these systems are widely used', N'Enterprise IS', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (12, 1,N'Understand how organizations develop and acquire information systems and technologies.', N'Acquire IS', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (13, 1,N'Understand how to secure information systems resources, focusing on both human and technological safeguards.', N'IS Security', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (14, 1,N'Evaluate the ethical concerns that information systems raise in society and the impact of information systems on crime, terrorism, and war.', N'IS and Ethics', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (15, 2,N'Understand the role of databases and database management systems in managing organizational data and information.', N'Database and IS', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (16, 2,N'Understand the historical development of database management systems and logical data models.', N'Logical Models', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (17, 2, N'Understand the basics of how data is physically stored and accessed.', N'DB access', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (18, 2, N'Understand the fundamentals of the basic file organization techniques.', N'IS requirements', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (19, 2, N'Apply information requirements specification processes in the broader systems analysis & design context.', N'DB modelling',3)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (20, 2, N'Use at least one conceptual data modeling technique to capture the information requirements for an enterprise domain.', N'Conceptual Models', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (21, 2, N'Link to each other the results of data/information modeling and process modeling.', N'DB / Process', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (22, 2, N'Design high-quality relational databases.', N'Good DB design',3)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (23, 2, N'Understand the purpose and principles of normalizing a relational database structure.', N'Normalization', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (24, 2, N'Design a relational database so that it is at least in 3NF.', N'Design RDB', 3)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (25, 2, N'Implement a relational database design using an industrial-strength database management system', N'Build RDB',2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (26, 2, N'Use the data definition, data manipulation, and data control language components of SQL in the context', N'DDL, DML, SQL', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (27, 2, N'Perform simple database administration tasks.', N'DBA Tasks', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (28, 2, N'Understand the concept of database transaction and apply it appropriately to an application context.', N'DB Transactions', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (29, 2, N'Understand the basic mechanisms for accessing relational databases from various types of application development environments.', N'SQL in apps', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (30, 2, N'Understand the role of databases and database management systems in the context of enterprise systems.', N'DBA / Enterprise', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (31, 2, N'Understand the key principles of data security and identify data security risk and violations in data management system design.', N'DB Security', 3)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (32, 2, N'Understand the core concepts of data quality and their application in an organizational context.', N'Data Quality', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (33, 2, N'Understand the difference between on-line transaction processing (OLTP) and online analytic processing (OLAP)', N'OLAP',3)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (34, 2, N'Create a simple data warehouse (data mart).', N'Data warehouse', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (35, 2, N'Understand how structured, semi-structured, and unstructured data are all essential elements of enterprise information and knowledge management.', N'Text Processing', 3)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (36, 3, N'Understand a variety of frameworks for enterprise architecture analysis and decision making.', N'Enterprise architecture frameworks', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (37, 3, N'Evaluate the total cost of ownership and return on investment for architecture alternatives.', N'Ownership cost for EA', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (38, 3, N'Utilize techniques for assessing and managing risk across the portfolio of the enterprise.', N'Managing Risk', 3)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (39, 3, N'Evaluate and plan for the integration of emerging technologies.', N'Integration, emerging technologies', 4)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (40, 3, N'Administer systems, including the use of virtualization and monitoring, power and cooling issues.', N'Virtualization', 4)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (41, 3, N'Manage proliferating types and volume of content.', N'Proliferating content', 3)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (42, 3, N'Understand the core concepts of data/information architecture and evaluate existing data/information architecture designs.', N'Data / Information architecture', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (43, 3, N'Plan for business continuity.', N'Business continuity',2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (44, 3, N'Understand the benefits and risks of service oriented architecture.', N'SOA benefits/risk', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (45, 3, N'Understand the role of audit and compliance in enterprise architecture.', N'Audit/Compliance in enterprise architecture', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (46, 3, N'Understand the integration of enterprise systems with inter-organizational partners such as suppliers, government, etc.', N'Integration of enterprise systems', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (47, 4, N'Understand key principles of data representation and manipulation in computing solutions.', N'Data Storage', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (48, 4, N'Understand the principles underlying layered systems architectures and their application to both computers and networks.', N'Layered Systems', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (49, 4, N'Understand the differences and similarities between the core elements of an IT infrastructure solution, such as clients, servers, network devices, wired and wireless network links', N'Processing Models', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (50, 4, N'Understand how IT infrastructure components are organized into infrastructure solutions in different organizational environments.', N'IT infrastructure', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (51, 4, N'Understand the principles underlying service virtualization.', N'Service Virtualization', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (52, 4, N'Understand through practical examples how protocols are used to enable communication between computing devices connected to each other.', N'Communication protocols', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (53, 4, N'Configure an IT infrastructure solution for a small organization, including a network based on standard technology components, servers, security devices.', N'IT configuration', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (54, 4, N'Apply the core concepts underlying IP networks to solve simple network design problems, including IP sub-netting.', N'Network Design',3)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (55, 4, N'Understand the role and structure of the Internet as an IT infrastructure component and design simple infrastructure solutions based on the use of the Internet.', N'Internet and IT', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (56, 4, N'Understand the components and structure of a large-scale organizational IT infrastructure solution at a level that allows them to use it effectively.', N'Enterprise IT', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (57, 4, N'Understand the role of IT control and service management frameworks in managing a large-scale organizational IT infrastructure solution.', N'IT control', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (58, 4, N'Negotiate with vendors providing design and implementation solutions.', N'Vendor negotiation', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (59, 4, N'Understand the opportunities that virtual computing service provision models, such as cloud computing, create for organizations.', N'Virtual computing', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (60, 4, N'Analyze and understand the security and business continuity implications of IT infrastructure design solutions.', N'Business Continuity', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (61, 4, N'Configure simple infrastructure security solutions.', N'IT and security', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (62, 4, N'Minimize the environmental and resource consumption impacts of IT infrastructure decisions', N'Optimized IT', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (63, 5, N'Initiate, specify, and prioritize information systems projects and to determine various aspects of feasibility of these projects.', N'Project startups', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (64, 5, N'Understand the foundations of project management, including its definition, scope, and the need for project management in the modern organization.', N'Project Scope', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (65, 5, N'Understand the phases of the project management lifecycle.', N'Project management lifecycle', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (66, 5, N'Manage project teams, including the fundamentals of leadership and team motivation.', N'Project teams', 3)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (67, 5, N'Manage project communication, both internal to the team, and external to other project stakeholders.', N'Project communication', 3)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (68, 5, N'Initiate projects, including project selection and defining project scope.', N'Project selection', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (69, 5, N'Manage project schedules with appropriate techniques and tools.', N'Project schedules', 3)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (70, 5, N'Manage project resources, including human resources, capital equipment, and time.', N'Project resources', 3)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (71, 5, N'Manage project quality, including the identification of the threats to project quality, techniques for measuring project quality, and the techniques for ensuring project quality is achieved.', N'Project quality', 3)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (72, 5, N'Manage project risk, including the identification of project risk, and the techniques for ensuring project risk is controlled.', N'Project and risk', 3)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (73, 5, N'Manage the project procurement process, including understanding external acquisition and outsourcing, as well as the steps for managing external procurement.', N'Project purchasing', 3)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (74, 5, N'Manage project execution, including monitoring project progress and managing project change, and appropriately documenting and communicating project status.', N'Project execution', 3)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (75, 5, N'Control projects through information tracking and cost and change control techniques.', N'Project control', 3)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (76, 5, N'Close projects, including administrative, personnel, and contractual closure.', N'Project close', 3)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (77, 5, N'Understand the mechanisms for dealing with legal issues in complex project contexts.', N'Project Legal issues', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (78, 5, N'Appreciate ethnic cultural differences in working with global teams either internal to organizations or by engaging offshore outsourcers.', N'Cultural teams', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (79, 6, N'Understand the types of business needs that can be addressed using information technology-based solutions.', N'Business needs', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (80, 6, N'Initiate, specify, and prioritize information systems projects and to determine various aspects of feasibility of these projects.', N'Feasibility', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (81, 6, N'Clearly define problems, opportunities, or mandates that initiate projects.', N'Define problems', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (82, 6, N'Use at least one specific methodology for analyzing a business situation (a problem or opportunity), modeling it using a formal technique, and specifying requirements for a system that enables a productive change in a way the business is conducted.', N'Methodology', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (83, 6, N'Within the context of the methodologies they learn, write clear and concise business requirements documents and convert them into technical specifications.', N'Business requirements',3)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (84, 6, N'Communicate effectively with various organizational stakeholders to collect information using a variety of techniques and to convey proposed solution characteristics to them.', N'Stakeholders communication',3)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (85, 6, N'Manage information systems projects using formal project management methods.', N'Project management methods', 7)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (86, 6, N'Articulate various systems acquisition alternatives, including the use of packaged systems (such as ERP, CRM, SCM, etc.) and outsourced design and development resources.', N'Use of packaged system',2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (87, 6, N'Use contemporary CASE tools for the use in process and data modeling.', N'CASE', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (88, 6, N'Compare the acquisition alternatives systematically.', N'Acquisition alternatives', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (89, 6, N'Incorporate principles leading to high levels of security and user experience from the beginning of the systems development process.', N'Levels of security', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (90, 6, N'Design high-level logical system characteristics (user interface design, design of data and information requirements).', N'Interface Design', 3)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (91, 6, N'Analyze and articulate ethical, cultural, and legal issues and their feasibilities among alternative solutions.', N'HCI and culture', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (92, 7, N'Understand the various functions and activities within the information systems area, including the role of IT management and the CIO, structuring of IS management within an organization, and managing IS professionals within the firm.', N'CIO', 3)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (93, 7, N'View an organization through the lens of non-IT senior management in deciding how information systems enable core and supportive business processes as well as those that interface with suppliers and customers.', N'Non-IT and senior management', 3)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (94, 7, N'Understand the concepts of information economics at the enterprise level.', N'Information economics', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (95, 7, N'Appreciate how IS represents a key source of competitive advantage for firms.', N'IS and Competitive advantage', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (96, 7, N'Structure IS-related activities to maximize the business value of IS within and outside the company.', N'Alignment ',2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (97, 7, N'Understand existing and emerging information technologies, the functions of IS and its impact on the organizational operations.', N'Emerging technologies', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (98, 7, N'Evaluate the issues and challenges associated with successfully and unsuccessfully incorporating IS into a firm.', N'Successful IS', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (99, 7, N'Understand how strategic decisions are made concerning acquiring IS resources and capabilities including the ability to evaluate the different sourcing options.', N'Sourcing options', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (100, 7,N'Apply information to the needs of different industries and areas.', N'Needs of industries',2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (101, 7, N'Understand the role of IT control and service management frameworks from the perspective of managing the IS function in an organization.', N'Service frameworks', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (102, 8,N'Use primitive data types and data structures offered by the development environment', N'Data types', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (103, 8,N'Choose an appropriate data structure for modeling a simple problem', N'Data structure roles', 2)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (104, 8, N'Understand basic programming concepts', N'Programming concepts', 1)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (105, 8, N'Write simple applications that relate to a specific domain', N'Write applications', 4)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (106, 8,N'Design, implement, test, and debug a program that uses each of the following fundamental programming constructs: basic computation, simple I/O, standard conditional and iterative structures, and the definition of functions.', N'Build program', 3)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (107, 8,N'Test applications with sample data', N'Test applications',4)
INSERT [dbo].[tblOutcome] ([OutcomeID], [CourseID],  [Name], [ShortName], [DepthOfKnowledge]) VALUES (108, 8,N'Apply core program control structures', N'Apply control structures', 3)

SET IDENTITY_INSERT [dbo].[tblOutcome] off
GO

-- Inserting values into subskillsinbk2 table
----Team 3

insert into [tblSubskillsinBk2] (SubskillsID,BkLevel2ID) values (1, 1)
insert into [tblSubskillsinBk2] (SubskillsID,BkLevel2ID) values (1, 2)
insert into [tblSubskillsinBk2] (SubskillsID,BkLevel2ID) values (1, 3)
insert into [tblSubskillsinBk2] (SubskillsID,BkLevel2ID) values (1, 4)
insert into [tblSubskillsinBk2] (SubskillsID,BkLevel2ID) values (1, 5)
insert into [tblSubskillsinBk2] (SubskillsID,BkLevel2ID) values (1, 6)
insert into [tblSubskillsinBk2] (SubskillsID,BkLevel2ID) values (1, 7)

--Team4 
-- Inserting values into subskillsinoutcome table
GO
INSERT INTO tblSubskillsinOutcome(OutcomeID,SubskillsID) VALUES(2,1)
INSERT INTO tblSubskillsinOutcome(OutcomeID,SubskillsID) VALUES(3,2)
INSERT INTO tblSubskillsinOutcome(OutcomeID,SubskillsID) VALUES(4,3)
INSERT INTO tblSubskillsinOutcome(OutcomeID,SubskillsID) VALUES(6,4)
INSERT INTO tblSubskillsinOutcome(OutcomeID,SubskillsID) VALUES(6,5)
INSERT INTO tblSubskillsinOutcome(OutcomeID,SubskillsID) VALUES(7,6)
INSERT INTO tblSubskillsinOutcome(OutcomeID,SubskillsID) VALUES(8,7)

GO
-- Team4 
-- Inserting values into OutcomeinBk2 table
INSERT INTO tblOutcomeinBK2(OutcomeID,BKLevelID) VALUES(2,1)
INSERT INTO tblOutcomeinBK2(OutcomeID,BKLevelID) VALUES(3,2)
INSERT INTO tblOutcomeinBK2(OutcomeID,BKLevelID) VALUES(4,4)
INSERT INTO tblOutcomeinBK2(OutcomeID,BKLevelID) VALUES(6,5)
INSERT INTO tblOutcomeinBK2(OutcomeID,BKLevelID) VALUES(6,6)

GO