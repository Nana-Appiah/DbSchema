USE [PANTrainer]
GO
/****** Object:  Table [dbo].[AdmList]    Script Date: 3/21/2022 12:15:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdmList](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NULL,
	[UserName] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[IsActive] [int] NULL,
 CONSTRAINT [PK_AdmList] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssignedTraining]    Script Date: 3/21/2022 12:15:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignedTraining](
	[AssignedTrainingID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NULL,
	[FirstName] [varchar](100) NULL,
	[LastName] [varchar](50) NULL,
	[EmailAddress] [varchar](100) NULL,
	[TrainingID] [int] NULL,
	[TrainingStatusID] [int] NULL,
	[AssignedBy] [varchar](50) NULL,
	[AssignedDate] [date] NULL,
	[ApprovedBy] [varchar](50) NULL,
	[ApprovedDate] [date] NULL,
 CONSTRAINT [PK_AssignedTraining] PRIMARY KEY CLUSTERED 
(
	[AssignedTrainingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AdmList] ON 

INSERT [dbo].[AdmList] ([AdminID], [EmployeeID], [UserName], [FirstName], [LastName], [IsActive]) VALUES (1, 35, N'equarshie@panafricansl.com', N'EVELYN', N'QUARSHIE', 1)
INSERT [dbo].[AdmList] ([AdminID], [EmployeeID], [UserName], [FirstName], [LastName], [IsActive]) VALUES (2, 175, N'elarbi@panafricansl.com', N'EUGENE', N'ANKAMAH-LARBI', 1)
INSERT [dbo].[AdmList] ([AdminID], [EmployeeID], [UserName], [FirstName], [LastName], [IsActive]) VALUES (3, 186, N'nbiney@panafricansl.com', N'NANA AMA', N'BINEY', 1)
INSERT [dbo].[AdmList] ([AdminID], [EmployeeID], [UserName], [FirstName], [LastName], [IsActive]) VALUES (4, 260, N'dkaketewah@panafricansl.com', N'DOMINIC', N'AKETEWAH', 1)
INSERT [dbo].[AdmList] ([AdminID], [EmployeeID], [UserName], [FirstName], [LastName], [IsActive]) VALUES (5, 264, N'aagyei@panafricansl.com', N'ABIGAIL', N'AGYEI', 1)
INSERT [dbo].[AdmList] ([AdminID], [EmployeeID], [UserName], [FirstName], [LastName], [IsActive]) VALUES (6, 285, N'aamonoo@panafricansl.com', N'FRANCIS', N'AMONOO', 1)
INSERT [dbo].[AdmList] ([AdminID], [EmployeeID], [UserName], [FirstName], [LastName], [IsActive]) VALUES (7, 360, N'atwumasi@panafricansl.com', N'ALFRED', N'OFORI-TWUMASI', 1)
INSERT [dbo].[AdmList] ([AdminID], [EmployeeID], [UserName], [FirstName], [LastName], [IsActive]) VALUES (8, 575, N'WKWAMEFIO@panafricansl.com', N'WILLIAM', N'KWAMIFIO', 1)
INSERT [dbo].[AdmList] ([AdminID], [EmployeeID], [UserName], [FirstName], [LastName], [IsActive]) VALUES (9, 743, N'bohene-kwapong@panafricansl.com', N'BENJAMIN', N'OHENE-KWAPONG', 1)
INSERT [dbo].[AdmList] ([AdminID], [EmployeeID], [UserName], [FirstName], [LastName], [IsActive]) VALUES (10, 756, N'EABROWN@PANAFRICANSL.COM', N'AMA', N'BROWN', 1)
SET IDENTITY_INSERT [dbo].[AdmList] OFF
GO
SET IDENTITY_INSERT [dbo].[AssignedTraining] ON 

INSERT [dbo].[AssignedTraining] ([AssignedTrainingID], [EmployeeID], [FirstName], [LastName], [EmailAddress], [TrainingID], [TrainingStatusID], [AssignedBy], [AssignedDate], [ApprovedBy], [ApprovedDate]) VALUES (1, 35, N'EVELYN', N'QUARSHIE', N'equarshie@panafricansl.com', 3, 1, N'nappiah', CAST(N'2022-03-21' AS Date), N'nappiah', CAST(N'2022-03-21' AS Date))
INSERT [dbo].[AssignedTraining] ([AssignedTrainingID], [EmployeeID], [FirstName], [LastName], [EmailAddress], [TrainingID], [TrainingStatusID], [AssignedBy], [AssignedDate], [ApprovedBy], [ApprovedDate]) VALUES (2, 175, N'EUGENE', N'ANKAMAH-LARBI', N'elarbi@panafricansl.com', 3, 1, N'nappiah', CAST(N'2022-03-21' AS Date), N'nappiah', CAST(N'2022-03-21' AS Date))
INSERT [dbo].[AssignedTraining] ([AssignedTrainingID], [EmployeeID], [FirstName], [LastName], [EmailAddress], [TrainingID], [TrainingStatusID], [AssignedBy], [AssignedDate], [ApprovedBy], [ApprovedDate]) VALUES (3, 186, N'NANA AMA', N'BINEY', N'nbiney@panafricansl.com', 3, 1, N'nappiah', CAST(N'2022-03-21' AS Date), N'nappiah', CAST(N'2022-03-21' AS Date))
INSERT [dbo].[AssignedTraining] ([AssignedTrainingID], [EmployeeID], [FirstName], [LastName], [EmailAddress], [TrainingID], [TrainingStatusID], [AssignedBy], [AssignedDate], [ApprovedBy], [ApprovedDate]) VALUES (4, 260, N'DOMINIC', N'AKETEWAH', N'dkaketewah@panafricansl.com', 3, 1, N'nappiah', CAST(N'2022-03-21' AS Date), N'nappiah', CAST(N'2022-03-21' AS Date))
INSERT [dbo].[AssignedTraining] ([AssignedTrainingID], [EmployeeID], [FirstName], [LastName], [EmailAddress], [TrainingID], [TrainingStatusID], [AssignedBy], [AssignedDate], [ApprovedBy], [ApprovedDate]) VALUES (5, 264, N'ABIGAIL', N'AGYEI', N'aagyei@panafricansl.com', 3, 1, N'nappiah', CAST(N'2022-03-21' AS Date), N'nappiah', CAST(N'2022-03-21' AS Date))
INSERT [dbo].[AssignedTraining] ([AssignedTrainingID], [EmployeeID], [FirstName], [LastName], [EmailAddress], [TrainingID], [TrainingStatusID], [AssignedBy], [AssignedDate], [ApprovedBy], [ApprovedDate]) VALUES (6, 285, N'FRANCIS', N'AMONOO', N'aamonoo@panafricansl.com', 3, 1, N'nappiah', CAST(N'2022-03-21' AS Date), N'nappiah', CAST(N'2022-03-21' AS Date))
INSERT [dbo].[AssignedTraining] ([AssignedTrainingID], [EmployeeID], [FirstName], [LastName], [EmailAddress], [TrainingID], [TrainingStatusID], [AssignedBy], [AssignedDate], [ApprovedBy], [ApprovedDate]) VALUES (7, 360, N'ALFRED', N'OFORI-TWUMASI', N'atwumasi@panafricansl.com', 3, 1, N'nappiah', CAST(N'2022-03-21' AS Date), N'nappiah', CAST(N'2022-03-21' AS Date))
INSERT [dbo].[AssignedTraining] ([AssignedTrainingID], [EmployeeID], [FirstName], [LastName], [EmailAddress], [TrainingID], [TrainingStatusID], [AssignedBy], [AssignedDate], [ApprovedBy], [ApprovedDate]) VALUES (8, 575, N'WILLIAM', N'KWAMIFIO', N'WKWAMEFIO@panafricansl.com', 3, 1, N'nappiah', CAST(N'2022-03-21' AS Date), N'nappiah', CAST(N'2022-03-21' AS Date))
INSERT [dbo].[AssignedTraining] ([AssignedTrainingID], [EmployeeID], [FirstName], [LastName], [EmailAddress], [TrainingID], [TrainingStatusID], [AssignedBy], [AssignedDate], [ApprovedBy], [ApprovedDate]) VALUES (9, 743, N'BENJAMIN', N'OHENE-KWAPONG', N'bohene-kwapong@panafricansl.com', 3, 1, N'nappiah', CAST(N'2022-03-21' AS Date), N'nappiah', CAST(N'2022-03-21' AS Date))
INSERT [dbo].[AssignedTraining] ([AssignedTrainingID], [EmployeeID], [FirstName], [LastName], [EmailAddress], [TrainingID], [TrainingStatusID], [AssignedBy], [AssignedDate], [ApprovedBy], [ApprovedDate]) VALUES (10, 756, N'AMA', N'BROWN', N'EABROWN@PANAFRICANSL.COM', 3, 1, N'nappiah', CAST(N'2022-03-21' AS Date), N'nappiah', CAST(N'2022-03-21' AS Date))
SET IDENTITY_INSERT [dbo].[AssignedTraining] OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'primary key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AdmList', @level2type=N'COLUMN',@level2name=N'AdminID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the ID of the employee' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AdmList', @level2type=N'COLUMN',@level2name=N'EmployeeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the user name of the employee' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AdmList', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the first name of the employee' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AdmList', @level2type=N'COLUMN',@level2name=N'FirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the last name of the employee' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AdmList', @level2type=N'COLUMN',@level2name=N'LastName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'flag determining if the profile is active or not' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AdmList', @level2type=N'COLUMN',@level2name=N'IsActive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the Id for the table entity' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AssignedTraining', @level2type=N'COLUMN',@level2name=N'AssignedTrainingID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the ID of the scheduled training' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AssignedTraining', @level2type=N'COLUMN',@level2name=N'TrainingID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the status of the training' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AssignedTraining', @level2type=N'COLUMN',@level2name=N'TrainingStatusID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the one doing the assignment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AssignedTraining', @level2type=N'COLUMN',@level2name=N'AssignedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the assigned date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AssignedTraining', @level2type=N'COLUMN',@level2name=N'AssignedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the one doing the approval of the training' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AssignedTraining', @level2type=N'COLUMN',@level2name=N'ApprovedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the date of approval' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AssignedTraining', @level2type=N'COLUMN',@level2name=N'ApprovedDate'
GO
