USE [master]
GO
/****** Object:  Database [Assignment]    Script Date: 10/03/2023 1:45:13 PM ******/
CREATE DATABASE [Assignment]

GO
ALTER DATABASE [Assignment] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Assignment] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Assignment', N'ON'
GO
ALTER DATABASE [Assignment] SET QUERY_STORE = OFF
GO
USE [Assignment]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 10/03/2023 1:45:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[aId] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](250) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[displayName] [nvarchar](50) NOT NULL,
	[roleId] [int] NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[aId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 10/03/2023 1:45:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[RollCallBookId] [int] IDENTITY(1,1) NOT NULL,
	[TeachingScheduleId] [int] NULL,
	[StudentId] [int] NULL,
	[IsAbsent] [bit] NULL,
	[Comment] [nvarchar](300) NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[RollCallBookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 10/03/2023 1:45:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[TeachingScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[subjectId] [int] NOT NULL,
	[SessionDate] [date] NULL,
	[SlotId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[lectureId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TeachingScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enroll]    Script Date: 10/03/2023 1:45:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enroll](
	[GroupId] [int] NOT NULL,
	[StudentId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group_Course]    Script Date: 10/03/2023 1:45:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group_Course](
	[GroupId] [int] NOT NULL,
	[TeachingScheduleId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 10/03/2023 1:45:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[GroupId] [int] IDENTITY(1,1) NOT NULL,
	[GroupCode] [nvarchar](50) NULL,
	[GroupDescription] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecture]    Script Date: 10/03/2023 1:45:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecture](
	[lectureId] [int] IDENTITY(1,1) NOT NULL,
	[lectureName] [nvarchar](50) NOT NULL,
	[lectureCode] [nvarchar](50) NOT NULL,
	[gender] [bit] NOT NULL,
	[dob] [date] NULL,
	[address] [nvarchar](50) NULL,
	[aId] [int] NULL,
 CONSTRAINT [PK_Lecture] PRIMARY KEY CLUSTERED 
(
	[lectureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 10/03/2023 1:45:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[roomId] [int] IDENTITY(1,1) NOT NULL,
	[roomName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[roomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slot]    Script Date: 10/03/2023 1:45:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot](
	[slotId] [int] IDENTITY(1,1) NOT NULL,
	[slotName] [nvarchar](50) NOT NULL,
	[startTime] [time](7) NOT NULL,
	[endTime] [time](7) NOT NULL,
 CONSTRAINT [PK_Slot] PRIMARY KEY CLUSTERED 
(
	[slotId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 10/03/2023 1:45:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[studentId] [int] IDENTITY(1,1) NOT NULL,
	[rollNumber] [nvarchar](250) NOT NULL,
	[fullName] [nvarchar](250) NOT NULL,
	[gender] [bit] NOT NULL,
	[dob] [date] NOT NULL,
	[image] [nvarchar](250) NOT NULL,
	[address] [nvarchar](250) NOT NULL,
	[phoneNumber] [nvarchar](250) NOT NULL,
	[aId] [int] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[studentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 10/03/2023 1:45:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subjectId] [int] IDENTITY(1,1) NOT NULL,
	[subjectCode] [nvarchar](250) NOT NULL,
	[subjectName] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[subjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (1, N'student', N'123', N'Student naming', 0)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (2, N'huongnt', N'1234', N'heluu', 1)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (3, N'sonnt', N'1234', N'Chao thay Son', 1)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (4, N'tritd', N'1234', N'Chao thay Tri', 1)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (5, N'thudm', N'1234', N'Chao co Thu', 1)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (6, N'tientd', N'1234', N'Chao thay Tien', 1)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (7, N'anth', N'123', N'Chao ban An', 0)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (9, N'giangth', N'123', N'Chao ban Giang', 0)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (12, N'OK', N'123', N'OK', 0)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (13, N'OK2', N'123', N'OK', 0)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (14, N'OK3', N'123', N'OK', 0)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (15, N'OK4', N'123', N'OK', 0)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (16, N'OK5', N'123', N'OK', 0)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (17, N'OK6', N'123', N'OK', 0)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (18, N'OK7', N'123', N'OK', 0)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (19, N'OK8', N'123', N'OK', 0)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (20, N'OK9', N'123', N'OK', 0)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (21, N'OK10', N'123', N'OK', 0)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (22, N'OK11', N'123', N'OK', 0)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (23, N'OK12', N'123', N'OK', 0)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (24, N'OK13', N'123', N'OK', 0)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (25, N'OK14', N'123', N'OK', 0)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (26, N'OK15', N'123', N'OK', 0)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (27, N'OK16', N'123', N'OK', 0)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (28, N'OK17', N'123', N'OK', 0)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (30, N'OK18', N'123', N'OK', 0)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (31, N'OK19', N'123', N'OK', 0)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (32, N'OK20', N'123', N'OK', 0)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (33, N'OK21', N'123', N'OK', 0)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (34, N'OK22', N'123', N'OK', 0)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (35, N'OK23', N'123', N'OK', 0)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (36, N'OK24', N'123', N'OK', 0)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (37, N'ok', N'123', N'ok', 0)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (39, N'ok2', N'123', N'ok', 0)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (40, N'ok3', N'12', N'ok', 0)
GO
INSERT [dbo].[Accounts] ([aId], [userName], [password], [displayName], [roleId]) VALUES (41, N'ok4', N'12', N'ok', 0)
GO
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Attendance] ON 
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1, 1, 1, 1, N'có việc đột xuất')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (2, 2, 1, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (3, 3, 1, 0, N'bi dau bung')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (4, 4, 1, 1, N'nha co viec')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (5, 5, 1, 1, N'Covid')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (6, 6, 1, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (7, 8, 1, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (8, 9, 1, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (9, 10, 1, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (10, 11, 1, 1, N'Covid')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (11, 12, 1, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (12, 13, 1, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (13, 14, 1, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (14, 15, 1, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (15, 16, 1, 1, N'Covid')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (16, 17, 1, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (17, 18, 1, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (18, 19, 1, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (19, 20, 1, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (20, 21, 1, 1, N'Covid')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (21, 22, 1, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (22, 23, 1, 1, N'Covid')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (23, 24, 1, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (24, 25, 1, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (25, 26, 1, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (26, 27, 1, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (27, 28, 1, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (28, 29, 1, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (29, 30, 1, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (30, 31, 1, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (31, 32, 1, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (32, 33, 1, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (33, 34, 1, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (34, 35, 1, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (35, 36, 1, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (36, 37, 1, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (37, 38, 1, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (38, 39, 1, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (39, 40, 1, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (40, 41, 1, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (41, 42, 1, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (42, 43, 1, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (43, 44, 1, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (44, 45, 1, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (45, 46, 1, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (46, 47, 1, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (47, 48, 1, 0, N'bi om')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (48, 49, 1, 0, N'bi om')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (49, 50, 1, 1, N'luoi hoc')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (50, 51, 1, 1, N'hoc tot')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (51, 52, 1, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (52, 53, 1, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (53, 1, 2, 1, N'Bị đau bụng')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (54, 2, 2, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (55, 3, 2, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (56, 4, 2, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (57, 5, 2, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (58, 6, 2, 1, N'Bị đau bụng')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (59, 8, 2, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (60, 9, 2, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (61, 10, 2, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (62, 11, 2, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (63, 12, 2, 1, N'Bị đau bụng')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (64, 13, 2, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (65, 14, 2, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (66, 15, 2, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (67, 16, 2, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (68, 17, 2, 1, N'Bị đau bụng')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (69, 18, 2, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (70, 19, 2, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (71, 20, 2, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (72, 21, 2, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (73, 22, 2, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (74, 23, 2, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (75, 24, 2, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (76, 25, 2, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (77, 26, 2, 1, N'Bị đau bụng')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (78, 27, 2, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (79, 28, 2, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (80, 29, 2, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (81, 30, 2, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (82, 31, 2, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (83, 32, 2, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (84, 33, 2, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (85, 34, 2, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (86, 35, 2, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (87, 36, 2, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (88, 37, 2, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (89, 38, 2, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (90, 39, 2, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (91, 40, 2, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (92, 41, 2, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (93, 42, 2, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (94, 43, 2, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (95, 44, 2, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (96, 45, 2, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (97, 46, 2, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (98, 47, 2, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (99, 48, 2, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (100, 49, 2, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (101, 50, 2, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (102, 51, 2, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (103, 52, 2, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (104, 53, 2, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (209, 1, 3, 1, N' 1 1e 12e 12e 21')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (210, 2, 3, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (211, 3, 3, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (212, 4, 3, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (213, 5, 3, 1, N'Có việc gia đình')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (214, 6, 3, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (215, 8, 3, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (216, 9, 3, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (217, 10, 3, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (218, 11, 3, 1, N'Có việc gia đình')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (219, 12, 3, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (220, 13, 3, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (221, 14, 3, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (222, 15, 3, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (223, 16, 3, 1, N'Có việc gia đình')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (224, 17, 3, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (225, 18, 3, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (226, 19, 3, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (227, 20, 3, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (228, 21, 3, 1, N'Có việc gia đình')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (229, 22, 3, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (230, 23, 3, 1, N'Có việc gia đình')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (231, 24, 3, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (232, 25, 3, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (233, 26, 3, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (234, 27, 3, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (235, 28, 3, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (236, 29, 3, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (237, 30, 3, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (238, 31, 3, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (239, 32, 3, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (240, 33, 3, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (241, 34, 3, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (242, 35, 3, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (243, 36, 3, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (244, 37, 3, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (245, 38, 3, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (246, 39, 3, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (247, 40, 3, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (248, 41, 3, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (249, 42, 3, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (250, 43, 3, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (251, 44, 3, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (252, 45, 3, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (253, 46, 3, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (254, 47, 3, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (255, 48, 3, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (256, 49, 3, 0, N'huhu')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (257, 50, 3, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (258, 51, 3, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (259, 52, 3, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (260, 53, 3, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (261, 1, 4, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (262, 2, 4, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (263, 3, 4, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (264, 4, 4, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (265, 5, 4, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (266, 6, 4, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (267, 8, 4, 1, N'Hỏng xe')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (268, 9, 4, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (269, 10, 4, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (270, 11, 4, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (271, 12, 4, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (272, 13, 4, 1, N'Hỏng xe')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (273, 14, 4, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (274, 15, 4, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (275, 16, 4, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (276, 17, 4, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (277, 18, 4, 1, N'Hỏng xe')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (278, 19, 4, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (279, 20, 4, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (280, 21, 4, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (281, 22, 4, 1, N'Hỏng xe')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (282, 23, 4, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (283, 24, 4, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (284, 25, 4, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (285, 26, 4, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (286, 27, 4, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (287, 28, 4, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (288, 29, 4, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (289, 30, 4, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (290, 31, 4, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (291, 32, 4, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (292, 33, 4, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (293, 34, 4, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (294, 35, 4, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (295, 36, 4, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (296, 37, 4, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (297, 38, 4, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (298, 39, 4, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (299, 40, 4, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (300, 41, 4, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (301, 42, 4, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (302, 43, 4, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (303, 44, 4, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (304, 45, 4, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (305, 46, 4, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (306, 47, 4, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (307, 48, 4, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (308, 49, 4, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (309, 50, 4, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (310, 51, 4, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (311, 52, 4, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (312, 53, 4, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (313, 1, 5, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (314, 2, 5, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (315, 3, 5, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (316, 4, 5, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (317, 5, 5, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (318, 6, 5, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (319, 8, 5, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (320, 9, 5, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (321, 10, 5, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (322, 11, 5, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (323, 12, 5, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (324, 13, 5, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (325, 14, 5, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (326, 15, 5, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (327, 16, 5, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (328, 17, 5, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (329, 18, 5, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (330, 19, 5, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (331, 20, 5, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (332, 21, 5, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (333, 22, 5, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (334, 23, 5, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (335, 24, 5, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (336, 25, 5, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (337, 26, 5, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (338, 27, 5, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (339, 28, 5, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (340, 29, 5, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (341, 30, 5, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (342, 31, 5, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (343, 32, 5, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (344, 33, 5, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (345, 34, 5, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (346, 35, 5, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (347, 36, 5, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (348, 37, 5, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (349, 38, 5, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (350, 39, 5, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (351, 40, 5, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (352, 41, 5, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (353, 42, 5, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (354, 43, 5, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (355, 44, 5, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (356, 45, 5, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (357, 46, 5, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (358, 47, 5, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (359, 48, 5, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (360, 49, 5, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (361, 50, 5, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (362, 51, 5, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (363, 52, 5, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (364, 53, 5, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (365, 1, 6, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (366, 2, 6, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (367, 3, 6, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (368, 4, 6, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (369, 5, 6, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (370, 6, 6, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (371, 8, 6, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (372, 9, 6, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (373, 10, 6, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (374, 11, 6, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (375, 12, 6, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (376, 13, 6, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (377, 14, 6, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (378, 15, 6, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (379, 16, 6, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (380, 17, 6, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (381, 18, 6, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (382, 19, 6, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (383, 20, 6, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (384, 21, 6, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (385, 22, 6, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (386, 23, 6, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (387, 24, 6, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (388, 25, 6, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (389, 26, 6, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (390, 27, 6, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (391, 28, 6, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (392, 29, 6, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (393, 30, 6, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (394, 31, 6, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (395, 32, 6, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (396, 33, 6, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (397, 34, 6, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (398, 35, 6, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (399, 36, 6, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (400, 37, 6, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (401, 38, 6, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (402, 39, 6, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (403, 40, 6, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (404, 41, 6, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (405, 42, 6, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (406, 43, 6, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (407, 44, 6, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (408, 45, 6, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (409, 46, 6, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (410, 47, 6, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (411, 48, 6, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (412, 49, 6, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (413, 50, 6, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (414, 51, 6, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (415, 52, 6, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (416, 53, 6, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (417, 1, 7, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (418, 2, 7, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (419, 3, 7, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (420, 4, 7, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (421, 5, 7, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (422, 6, 7, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (423, 8, 7, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (424, 9, 7, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (425, 10, 7, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (426, 11, 7, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (427, 12, 7, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (428, 13, 7, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (429, 14, 7, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (430, 15, 7, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (431, 16, 7, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (432, 17, 7, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (433, 18, 7, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (434, 19, 7, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (435, 20, 7, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (436, 21, 7, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (437, 22, 7, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (438, 23, 7, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (439, 24, 7, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (440, 25, 7, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (441, 26, 7, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (442, 27, 7, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (443, 28, 7, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (444, 29, 7, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (445, 30, 7, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (446, 31, 7, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (447, 32, 7, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (448, 33, 7, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (449, 34, 7, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (450, 35, 7, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (451, 36, 7, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (452, 37, 7, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (453, 38, 7, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (454, 39, 7, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (455, 40, 7, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (456, 41, 7, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (457, 42, 7, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (458, 43, 7, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (459, 44, 7, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (460, 45, 7, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (461, 46, 7, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (462, 47, 7, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (463, 48, 7, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (464, 49, 7, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (465, 50, 7, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (466, 51, 7, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (467, 52, 7, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (468, 53, 7, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (469, 1, 8, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (470, 2, 8, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (471, 3, 8, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (472, 4, 8, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (473, 5, 8, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (474, 6, 8, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (475, 8, 8, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (476, 9, 8, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (477, 10, 8, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (478, 11, 8, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (479, 12, 8, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (480, 13, 8, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (481, 14, 8, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (482, 15, 8, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (483, 16, 8, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (484, 17, 8, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (485, 18, 8, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (486, 19, 8, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (487, 20, 8, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (488, 21, 8, 1, N'covid')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (489, 22, 8, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (490, 23, 8, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (491, 24, 8, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (492, 25, 8, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (493, 26, 8, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (494, 27, 8, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (495, 28, 8, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (496, 29, 8, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (497, 30, 8, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (498, 31, 8, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (499, 32, 8, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (500, 33, 8, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (501, 34, 8, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (502, 35, 8, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (503, 36, 8, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (504, 37, 8, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (505, 38, 8, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (506, 39, 8, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (507, 40, 8, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (508, 41, 8, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (509, 42, 8, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (510, 43, 8, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (511, 44, 8, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (512, 45, 8, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (513, 46, 8, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (514, 47, 8, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (515, 48, 8, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (516, 49, 8, 1, N'ok')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (517, 50, 8, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (518, 51, 8, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (519, 52, 8, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (520, 53, 8, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (521, 1, 9, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (522, 2, 9, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (523, 3, 9, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (524, 4, 9, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (525, 5, 9, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (526, 6, 9, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (527, 8, 9, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (528, 9, 9, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (529, 10, 9, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (530, 11, 9, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (531, 12, 9, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (532, 13, 9, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (533, 14, 9, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (534, 15, 9, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (535, 16, 9, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (536, 17, 9, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (537, 18, 9, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (538, 19, 9, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (539, 20, 9, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (540, 21, 9, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (541, 22, 9, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (542, 23, 9, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (543, 24, 9, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (544, 25, 9, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (545, 26, 9, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (546, 27, 9, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (547, 28, 9, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (548, 29, 9, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (549, 30, 9, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (550, 31, 9, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (551, 32, 9, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (552, 33, 9, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (553, 34, 9, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (554, 35, 9, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (555, 36, 9, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (556, 37, 9, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (557, 38, 9, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (558, 39, 9, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (559, 40, 9, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (560, 41, 9, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (561, 42, 9, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (562, 43, 9, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (563, 44, 9, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (564, 45, 9, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (565, 46, 9, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (566, 47, 9, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (567, 48, 9, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (568, 49, 9, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (569, 50, 9, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (570, 51, 9, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (571, 52, 9, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (572, 53, 9, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (573, 1, 10, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (574, 2, 10, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (575, 3, 10, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (576, 4, 10, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (577, 5, 10, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (578, 6, 10, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (579, 8, 10, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (580, 9, 10, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (581, 10, 10, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (582, 11, 10, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (583, 12, 10, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (584, 13, 10, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (585, 14, 10, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (586, 15, 10, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (587, 16, 10, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (588, 17, 10, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (589, 18, 10, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (590, 19, 10, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (591, 20, 10, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (592, 21, 10, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (593, 22, 10, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (594, 23, 10, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (595, 24, 10, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (596, 25, 10, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (597, 26, 10, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (598, 27, 10, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (599, 28, 10, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (600, 29, 10, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (601, 30, 10, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (602, 31, 10, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (603, 32, 10, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (604, 33, 10, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (605, 34, 10, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (606, 35, 10, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (607, 36, 10, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (608, 37, 10, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (609, 38, 10, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (610, 39, 10, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (611, 40, 10, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (612, 41, 10, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (613, 42, 10, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (614, 43, 10, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (615, 44, 10, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (616, 45, 10, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (617, 46, 10, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (618, 47, 10, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (619, 48, 10, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (620, 49, 10, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (621, 50, 10, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (622, 51, 10, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (623, 52, 10, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (624, 53, 10, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (625, 1, 11, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (626, 2, 11, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (627, 3, 11, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (628, 4, 11, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (629, 5, 11, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (630, 6, 11, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (631, 8, 11, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (632, 9, 11, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (633, 10, 11, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (634, 11, 11, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (635, 12, 11, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (636, 13, 11, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (637, 14, 11, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (638, 15, 11, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (639, 16, 11, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (640, 17, 11, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (641, 18, 11, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (642, 19, 11, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (643, 20, 11, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (644, 21, 11, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (645, 22, 11, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (646, 23, 11, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (647, 24, 11, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (648, 25, 11, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (649, 26, 11, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (650, 27, 11, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (651, 28, 11, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (652, 29, 11, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (653, 30, 11, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (654, 31, 11, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (655, 32, 11, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (656, 33, 11, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (657, 34, 11, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (658, 35, 11, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (659, 36, 11, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (660, 37, 11, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (661, 38, 11, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (662, 39, 11, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (663, 40, 11, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (664, 41, 11, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (665, 42, 11, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (666, 43, 11, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (667, 44, 11, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (668, 45, 11, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (669, 46, 11, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (670, 47, 11, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (671, 48, 11, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (672, 49, 11, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (673, 50, 11, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (674, 51, 11, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (675, 52, 11, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (676, 53, 11, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (677, 1, 12, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (678, 2, 12, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (679, 3, 12, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (680, 4, 12, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (681, 5, 12, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (682, 6, 12, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (683, 8, 12, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (684, 9, 12, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (685, 10, 12, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (686, 11, 12, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (687, 12, 12, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (688, 13, 12, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (689, 14, 12, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (690, 15, 12, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (691, 16, 12, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (692, 17, 12, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (693, 18, 12, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (694, 19, 12, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (695, 20, 12, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (696, 21, 12, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (697, 22, 12, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (698, 23, 12, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (699, 24, 12, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (700, 25, 12, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (701, 26, 12, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (702, 27, 12, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (703, 28, 12, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (704, 29, 12, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (705, 30, 12, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (706, 31, 12, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (707, 32, 12, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (708, 33, 12, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (709, 34, 12, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (710, 35, 12, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (711, 36, 12, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (712, 37, 12, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (713, 38, 12, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (714, 39, 12, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (715, 40, 12, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (716, 41, 12, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (717, 42, 12, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (718, 43, 12, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (719, 44, 12, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (720, 45, 12, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (721, 46, 12, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (722, 47, 12, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (723, 48, 12, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (724, 49, 12, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (725, 50, 12, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (726, 51, 12, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (727, 52, 12, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (728, 53, 12, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (729, 1, 13, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (730, 2, 13, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (731, 3, 13, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (732, 4, 13, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (733, 5, 13, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (734, 6, 13, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (735, 8, 13, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (736, 9, 13, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (737, 10, 13, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (738, 11, 13, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (739, 12, 13, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (740, 13, 13, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (741, 14, 13, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (742, 15, 13, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (743, 16, 13, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (744, 17, 13, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (745, 18, 13, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (746, 19, 13, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (747, 20, 13, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (748, 21, 13, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (749, 22, 13, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (750, 23, 13, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (751, 24, 13, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (752, 25, 13, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (753, 26, 13, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (754, 27, 13, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (755, 28, 13, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (756, 29, 13, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (757, 30, 13, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (758, 31, 13, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (759, 32, 13, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (760, 33, 13, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (761, 34, 13, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (762, 35, 13, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (763, 36, 13, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (764, 37, 13, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (765, 38, 13, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (766, 39, 13, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (767, 40, 13, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (768, 41, 13, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (769, 42, 13, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (770, 43, 13, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (771, 44, 13, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (772, 45, 13, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (773, 46, 13, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (774, 47, 13, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (775, 48, 13, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (776, 49, 13, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (777, 50, 13, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (778, 51, 13, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (779, 52, 13, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (780, 53, 13, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (781, 1, 14, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (782, 2, 14, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (783, 3, 14, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (784, 4, 14, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (785, 5, 14, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (786, 6, 14, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (787, 8, 14, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (788, 9, 14, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (789, 10, 14, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (790, 11, 14, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (791, 12, 14, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (792, 13, 14, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (793, 14, 14, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (794, 15, 14, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (795, 16, 14, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (796, 17, 14, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (797, 18, 14, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (798, 19, 14, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (799, 20, 14, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (800, 21, 14, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (801, 22, 14, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (802, 23, 14, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (803, 24, 14, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (804, 25, 14, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (805, 26, 14, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (806, 27, 14, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (807, 28, 14, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (808, 29, 14, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (809, 30, 14, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (810, 31, 14, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (811, 32, 14, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (812, 33, 14, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (813, 34, 14, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (814, 35, 14, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (815, 36, 14, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (816, 37, 14, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (817, 38, 14, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (818, 39, 14, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (819, 40, 14, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (820, 41, 14, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (821, 42, 14, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (822, 43, 14, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (823, 44, 14, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (824, 45, 14, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (825, 46, 14, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (826, 47, 14, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (827, 48, 14, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (828, 49, 14, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (829, 50, 14, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (830, 51, 14, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (831, 52, 14, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (832, 53, 14, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (833, 1, 15, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (834, 2, 15, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (835, 3, 15, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (836, 4, 15, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (837, 5, 15, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (838, 6, 15, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (839, 8, 15, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (840, 9, 15, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (841, 10, 15, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (842, 11, 15, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (843, 12, 15, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (844, 13, 15, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (845, 14, 15, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (846, 15, 15, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (847, 16, 15, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (848, 17, 15, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (849, 18, 15, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (850, 19, 15, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (851, 20, 15, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (852, 21, 15, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (853, 22, 15, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (854, 23, 15, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (855, 24, 15, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (856, 25, 15, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (857, 26, 15, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (858, 27, 15, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (859, 28, 15, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (860, 29, 15, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (861, 30, 15, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (862, 31, 15, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (863, 32, 15, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (864, 33, 15, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (865, 34, 15, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (866, 35, 15, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (867, 36, 15, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (868, 37, 15, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (869, 38, 15, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (870, 39, 15, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (871, 40, 15, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (872, 41, 15, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (873, 42, 15, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (874, 43, 15, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (875, 44, 15, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (876, 45, 15, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (877, 46, 15, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (878, 47, 15, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (879, 48, 15, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (880, 49, 15, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (881, 50, 15, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (882, 51, 15, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (883, 52, 15, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (884, 53, 15, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (885, 1, 16, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (886, 2, 16, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (887, 3, 16, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (888, 4, 16, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (889, 5, 16, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (890, 6, 16, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (891, 8, 16, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (892, 9, 16, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (893, 10, 16, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (894, 11, 16, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (895, 12, 16, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (896, 13, 16, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (897, 14, 16, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (898, 15, 16, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (899, 16, 16, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (900, 17, 16, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (901, 18, 16, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (902, 19, 16, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (903, 20, 16, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (904, 21, 16, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (905, 22, 16, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (906, 23, 16, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (907, 24, 16, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (908, 25, 16, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (909, 26, 16, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (910, 27, 16, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (911, 28, 16, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (912, 29, 16, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (913, 30, 16, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (914, 31, 16, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (915, 32, 16, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (916, 33, 16, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (917, 34, 16, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (918, 35, 16, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (919, 36, 16, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (920, 37, 16, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (921, 38, 16, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (922, 39, 16, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (923, 40, 16, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (924, 41, 16, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (925, 42, 16, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (926, 43, 16, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (927, 44, 16, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (928, 45, 16, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (929, 46, 16, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (930, 47, 16, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (931, 48, 16, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (932, 49, 16, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (933, 50, 16, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (934, 51, 16, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (935, 52, 16, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (936, 53, 16, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (937, 1, 17, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (938, 2, 17, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (939, 3, 17, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (940, 4, 17, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (941, 5, 17, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (942, 6, 17, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (943, 8, 17, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (944, 9, 17, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (945, 10, 17, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (946, 11, 17, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (947, 12, 17, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (948, 13, 17, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (949, 14, 17, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (950, 15, 17, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (951, 16, 17, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (952, 17, 17, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (953, 18, 17, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (954, 19, 17, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (955, 20, 17, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (956, 21, 17, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (957, 22, 17, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (958, 23, 17, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (959, 24, 17, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (960, 25, 17, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (961, 26, 17, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (962, 27, 17, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (963, 28, 17, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (964, 29, 17, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (965, 30, 17, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (966, 31, 17, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (967, 32, 17, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (968, 33, 17, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (969, 34, 17, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (970, 35, 17, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (971, 36, 17, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (972, 37, 17, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (973, 38, 17, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (974, 39, 17, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (975, 40, 17, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (976, 41, 17, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (977, 42, 17, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (978, 43, 17, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (979, 44, 17, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (980, 45, 17, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (981, 46, 17, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (982, 47, 17, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (983, 48, 17, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (984, 49, 17, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (985, 50, 17, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (986, 51, 17, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (987, 52, 17, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (988, 53, 17, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (989, 1, 18, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (990, 2, 18, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (991, 3, 18, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (992, 4, 18, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (993, 5, 18, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (994, 6, 18, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (995, 8, 18, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (996, 9, 18, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (997, 10, 18, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (998, 11, 18, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (999, 12, 18, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1000, 13, 18, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1001, 14, 18, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1002, 15, 18, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1003, 16, 18, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1004, 17, 18, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1005, 18, 18, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1006, 19, 18, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1007, 20, 18, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1008, 21, 18, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1009, 22, 18, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1010, 23, 18, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1011, 24, 18, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1012, 25, 18, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1013, 26, 18, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1014, 27, 18, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1015, 28, 18, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1016, 29, 18, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1017, 30, 18, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1018, 31, 18, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1019, 32, 18, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1020, 33, 18, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1021, 34, 18, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1022, 35, 18, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1023, 36, 18, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1024, 37, 18, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1025, 38, 18, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1026, 39, 18, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1027, 40, 18, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1028, 41, 18, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1029, 42, 18, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1030, 43, 18, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1031, 44, 18, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1032, 45, 18, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1033, 46, 18, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1034, 47, 18, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1035, 48, 18, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1036, 49, 18, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1037, 50, 18, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1038, 51, 18, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1039, 52, 18, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1040, 53, 18, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1041, 1, 19, 1, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1042, 2, 19, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1043, 3, 19, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1044, 4, 19, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1045, 5, 19, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1046, 6, 19, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1047, 8, 19, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1048, 9, 19, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1049, 10, 19, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1050, 11, 19, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1051, 12, 19, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1052, 13, 19, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1053, 14, 19, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1054, 15, 19, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1055, 16, 19, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1056, 17, 19, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1057, 18, 19, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1058, 19, 19, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1059, 20, 19, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1060, 21, 19, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1061, 22, 19, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1062, 23, 19, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1063, 24, 19, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1064, 25, 19, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1065, 26, 19, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1066, 27, 19, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1067, 28, 19, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1068, 29, 19, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1069, 30, 19, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1070, 31, 19, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1071, 32, 19, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1072, 33, 19, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1073, 34, 19, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1074, 35, 19, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1075, 36, 19, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1076, 37, 19, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1077, 38, 19, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1078, 39, 19, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1079, 40, 19, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1080, 41, 19, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1081, 42, 19, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1082, 43, 19, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1083, 44, 19, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1084, 45, 19, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1085, 46, 19, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1086, 47, 19, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1087, 48, 19, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1088, 49, 19, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1089, 50, 19, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1090, 51, 19, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1091, 52, 19, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1092, 53, 19, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1093, 1, 20, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1094, 2, 20, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1095, 3, 20, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1096, 4, 20, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1097, 5, 20, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1098, 6, 20, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1099, 8, 20, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1100, 9, 20, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1101, 10, 20, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1102, 11, 20, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1103, 12, 20, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1104, 13, 20, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1105, 14, 20, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1106, 15, 20, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1107, 16, 20, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1108, 17, 20, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1109, 18, 20, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1110, 19, 20, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1111, 20, 20, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1112, 21, 20, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1113, 22, 20, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1114, 23, 20, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1115, 24, 20, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1116, 25, 20, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1117, 26, 20, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1118, 27, 20, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1119, 28, 20, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1120, 29, 20, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1121, 30, 20, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1122, 31, 20, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1123, 32, 20, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1124, 33, 20, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1125, 34, 20, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1126, 35, 20, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1127, 36, 20, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1128, 37, 20, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1129, 38, 20, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1130, 39, 20, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1131, 40, 20, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1132, 41, 20, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1133, 42, 20, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1134, 43, 20, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1135, 44, 20, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1136, 45, 20, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1137, 46, 20, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1138, 47, 20, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1139, 48, 20, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1140, 49, 20, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1141, 50, 20, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1142, 51, 20, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1143, 52, 20, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1144, 53, 20, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1145, 1, 21, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1146, 2, 21, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1147, 3, 21, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1148, 4, 21, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1149, 5, 21, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1150, 6, 21, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1151, 8, 21, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1152, 9, 21, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1153, 10, 21, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1154, 11, 21, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1155, 12, 21, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1156, 13, 21, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1157, 14, 21, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1158, 15, 21, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1159, 16, 21, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1160, 17, 21, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1161, 18, 21, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1162, 19, 21, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1163, 20, 21, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1164, 21, 21, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1165, 22, 21, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1166, 23, 21, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1167, 24, 21, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1168, 25, 21, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1169, 26, 21, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1170, 27, 21, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1171, 28, 21, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1172, 29, 21, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1173, 30, 21, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1174, 31, 21, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1175, 32, 21, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1176, 33, 21, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1177, 34, 21, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1178, 35, 21, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1179, 36, 21, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1180, 37, 21, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1181, 38, 21, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1182, 39, 21, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1183, 40, 21, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1184, 41, 21, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1185, 42, 21, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1186, 43, 21, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1187, 44, 21, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1188, 45, 21, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1189, 46, 21, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1190, 47, 21, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1191, 48, 21, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1192, 49, 21, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1193, 50, 21, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1194, 51, 21, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1195, 52, 21, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1196, 53, 21, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1197, 1, 22, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1198, 2, 22, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1199, 3, 22, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1200, 4, 22, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1201, 5, 22, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1202, 6, 22, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1203, 8, 22, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1204, 9, 22, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1205, 10, 22, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1206, 11, 22, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1207, 12, 22, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1208, 13, 22, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1209, 14, 22, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1210, 15, 22, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1211, 16, 22, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1212, 17, 22, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1213, 18, 22, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1214, 19, 22, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1215, 20, 22, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1216, 21, 22, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1217, 22, 22, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1218, 23, 22, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1219, 24, 22, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1220, 25, 22, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1221, 26, 22, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1222, 27, 22, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1223, 28, 22, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1224, 29, 22, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1225, 30, 22, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1226, 31, 22, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1227, 32, 22, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1228, 33, 22, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1229, 34, 22, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1230, 35, 22, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1231, 36, 22, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1232, 37, 22, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1233, 38, 22, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1234, 39, 22, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1235, 40, 22, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1236, 41, 22, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1237, 42, 22, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1238, 43, 22, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1239, 44, 22, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1240, 45, 22, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1241, 46, 22, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1242, 47, 22, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1243, 48, 22, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1244, 49, 22, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1245, 50, 22, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1246, 51, 22, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1247, 52, 22, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1248, 53, 22, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1249, 1, 23, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1250, 2, 23, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1251, 3, 23, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1252, 4, 23, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1253, 5, 23, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1254, 6, 23, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1255, 8, 23, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1256, 9, 23, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1257, 10, 23, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1258, 11, 23, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1259, 12, 23, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1260, 13, 23, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1261, 14, 23, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1262, 15, 23, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1263, 16, 23, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1264, 17, 23, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1265, 18, 23, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1266, 19, 23, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1267, 20, 23, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1268, 21, 23, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1269, 22, 23, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1270, 23, 23, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1271, 24, 23, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1272, 25, 23, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1273, 26, 23, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1274, 27, 23, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1275, 28, 23, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1276, 29, 23, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1277, 30, 23, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1278, 31, 23, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1279, 32, 23, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1280, 33, 23, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1281, 34, 23, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1282, 35, 23, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1283, 36, 23, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1284, 37, 23, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1285, 38, 23, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1286, 39, 23, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1287, 40, 23, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1288, 41, 23, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1289, 42, 23, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1290, 43, 23, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1291, 44, 23, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1292, 45, 23, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1293, 46, 23, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1294, 47, 23, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1295, 48, 23, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1296, 49, 23, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1297, 50, 23, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1298, 51, 23, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1299, 52, 23, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1300, 53, 23, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1301, 1, 24, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1302, 2, 24, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1303, 3, 24, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1304, 4, 24, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1305, 5, 24, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1306, 6, 24, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1307, 8, 24, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1308, 9, 24, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1309, 10, 24, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1310, 11, 24, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1311, 12, 24, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1312, 13, 24, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1313, 14, 24, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1314, 15, 24, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1315, 16, 24, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1316, 17, 24, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1317, 18, 24, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1318, 19, 24, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1319, 20, 24, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1320, 21, 24, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1321, 22, 24, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1322, 23, 24, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1323, 24, 24, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1324, 25, 24, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1325, 26, 24, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1326, 27, 24, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1327, 28, 24, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1328, 29, 24, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1329, 30, 24, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1330, 31, 24, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1331, 32, 24, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1332, 33, 24, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1333, 34, 24, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1334, 35, 24, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1335, 36, 24, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1336, 37, 24, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1337, 38, 24, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1338, 39, 24, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1339, 40, 24, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1340, 41, 24, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1341, 42, 24, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1342, 43, 24, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1343, 44, 24, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1344, 45, 24, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1345, 46, 24, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1346, 47, 24, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1347, 48, 24, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1348, 49, 24, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1349, 50, 24, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1350, 51, 24, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1351, 52, 24, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1352, 53, 24, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1353, 1, 25, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1354, 2, 25, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1355, 3, 25, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1356, 4, 25, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1357, 5, 25, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1358, 6, 25, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1359, 8, 25, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1360, 9, 25, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1361, 10, 25, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1362, 11, 25, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1363, 12, 25, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1364, 13, 25, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1365, 14, 25, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1366, 15, 25, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1367, 16, 25, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1368, 17, 25, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1369, 18, 25, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1370, 19, 25, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1371, 20, 25, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1372, 21, 25, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1373, 22, 25, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1374, 23, 25, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1375, 24, 25, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1376, 25, 25, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1377, 26, 25, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1378, 27, 25, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1379, 28, 25, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1380, 29, 25, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1381, 30, 25, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1382, 31, 25, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1383, 32, 25, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1384, 33, 25, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1385, 34, 25, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1386, 35, 25, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1387, 36, 25, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1388, 37, 25, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1389, 38, 25, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1390, 39, 25, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1391, 40, 25, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1392, 41, 25, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1393, 42, 25, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1394, 43, 25, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1395, 44, 25, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1396, 45, 25, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1397, 46, 25, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1398, 47, 25, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1399, 48, 25, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1400, 49, 25, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1401, 50, 25, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1402, 51, 25, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1403, 52, 25, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1404, 53, 25, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1405, 1, 26, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1406, 2, 26, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1407, 3, 26, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1408, 4, 26, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1409, 5, 26, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1410, 6, 26, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1411, 8, 26, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1412, 9, 26, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1413, 10, 26, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1414, 11, 26, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1415, 12, 26, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1416, 13, 26, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1417, 14, 26, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1418, 15, 26, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1419, 16, 26, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1420, 17, 26, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1421, 18, 26, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1422, 19, 26, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1423, 20, 26, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1424, 21, 26, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1425, 22, 26, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1426, 23, 26, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1427, 24, 26, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1428, 25, 26, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1429, 26, 26, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1430, 27, 26, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1431, 28, 26, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1432, 29, 26, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1433, 30, 26, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1434, 31, 26, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1435, 32, 26, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1436, 33, 26, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1437, 34, 26, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1438, 35, 26, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1439, 36, 26, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1440, 37, 26, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1441, 38, 26, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1442, 39, 26, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1443, 40, 26, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1444, 41, 26, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1445, 42, 26, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1446, 43, 26, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1447, 44, 26, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1448, 45, 26, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1449, 46, 26, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1450, 47, 26, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1451, 48, 26, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1452, 49, 26, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1453, 50, 26, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1454, 51, 26, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1455, 52, 26, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1456, 53, 26, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1457, 1, 27, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1458, 2, 27, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1459, 3, 27, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1460, 4, 27, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1461, 5, 27, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1462, 6, 27, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1463, 8, 27, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1464, 9, 27, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1465, 10, 27, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1466, 11, 27, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1467, 12, 27, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1468, 13, 27, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1469, 14, 27, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1470, 15, 27, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1471, 16, 27, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1472, 17, 27, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1473, 18, 27, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1474, 19, 27, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1475, 20, 27, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1476, 21, 27, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1477, 22, 27, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1478, 23, 27, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1479, 24, 27, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1480, 25, 27, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1481, 26, 27, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1482, 27, 27, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1483, 28, 27, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1484, 29, 27, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1485, 30, 27, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1486, 31, 27, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1487, 32, 27, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1488, 33, 27, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1489, 34, 27, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1490, 35, 27, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1491, 36, 27, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1492, 37, 27, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1493, 38, 27, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1494, 39, 27, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1495, 40, 27, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1496, 41, 27, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1497, 42, 27, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1498, 43, 27, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1499, 44, 27, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1500, 45, 27, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1501, 46, 27, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1502, 47, 27, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1503, 48, 27, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1504, 49, 27, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1505, 50, 27, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1506, 51, 27, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1507, 52, 27, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1508, 53, 27, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1509, 1, 28, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1510, 2, 28, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1511, 3, 28, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1512, 4, 28, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1513, 5, 28, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1514, 6, 28, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1515, 8, 28, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1516, 9, 28, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1517, 10, 28, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1518, 11, 28, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1519, 12, 28, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1520, 13, 28, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1521, 14, 28, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1522, 15, 28, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1523, 16, 28, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1524, 17, 28, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1525, 18, 28, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1526, 19, 28, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1527, 20, 28, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1528, 21, 28, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1529, 22, 28, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1530, 23, 28, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1531, 24, 28, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1532, 25, 28, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1533, 26, 28, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1534, 27, 28, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1535, 28, 28, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1536, 29, 28, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1537, 30, 28, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1538, 31, 28, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1539, 32, 28, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1540, 33, 28, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1541, 34, 28, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1542, 35, 28, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1543, 36, 28, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1544, 37, 28, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1545, 38, 28, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1546, 39, 28, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1547, 40, 28, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1548, 41, 28, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1549, 42, 28, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1550, 43, 28, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1551, 44, 28, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1552, 45, 28, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1553, 46, 28, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1554, 47, 28, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1555, 48, 28, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1556, 49, 28, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1557, 50, 28, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1558, 51, 28, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1559, 52, 28, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1560, 53, 28, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1561, 1, 29, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1562, 2, 29, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1563, 3, 29, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1564, 4, 29, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1565, 5, 29, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1566, 6, 29, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1567, 8, 29, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1568, 9, 29, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1569, 10, 29, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1570, 11, 29, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1571, 12, 29, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1572, 13, 29, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1573, 14, 29, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1574, 15, 29, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1575, 16, 29, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1576, 17, 29, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1577, 18, 29, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1578, 19, 29, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1579, 20, 29, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1580, 21, 29, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1581, 22, 29, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1582, 23, 29, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1583, 24, 29, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1584, 25, 29, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1585, 26, 29, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1586, 27, 29, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1587, 28, 29, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1588, 29, 29, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1589, 30, 29, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1590, 31, 29, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1591, 32, 29, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1592, 33, 29, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1593, 34, 29, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1594, 35, 29, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1595, 36, 29, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1596, 37, 29, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1597, 38, 29, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1598, 39, 29, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1599, 40, 29, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1600, 41, 29, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1601, 42, 29, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1602, 43, 29, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1603, 44, 29, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1604, 45, 29, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1605, 46, 29, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1606, 47, 29, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1607, 48, 29, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1608, 49, 29, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1609, 50, 29, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1610, 51, 29, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1611, 52, 29, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1612, 53, 29, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1613, 1, 30, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1614, 2, 30, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1615, 3, 30, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1616, 4, 30, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1617, 5, 30, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1618, 6, 30, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1619, 8, 30, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1620, 9, 30, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1621, 10, 30, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1622, 11, 30, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1623, 12, 30, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1624, 13, 30, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1625, 14, 30, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1626, 15, 30, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1627, 16, 30, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1628, 17, 30, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1629, 18, 30, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1630, 19, 30, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1631, 20, 30, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1632, 21, 30, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1633, 22, 30, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1634, 23, 30, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1635, 24, 30, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1636, 25, 30, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1637, 26, 30, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1638, 27, 30, 0, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1639, 28, 30, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1640, 29, 30, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1641, 30, 30, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1642, 31, 30, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1643, 32, 30, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1644, 33, 30, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1645, 34, 30, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1646, 35, 30, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1647, 36, 30, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1648, 37, 30, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1649, 38, 30, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1650, 39, 30, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1651, 40, 30, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1652, 41, 30, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1653, 42, 30, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1654, 43, 30, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1655, 44, 30, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1656, 45, 30, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1657, 46, 30, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1658, 47, 30, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1659, 48, 30, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1660, 49, 30, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1661, 50, 30, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1662, 51, 30, 0, N'')
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1663, 52, 30, NULL, NULL)
GO
INSERT [dbo].[Attendance] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1664, 53, 30, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Attendance] OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (1, 1, CAST(N'2022-07-11' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (2, 1, CAST(N'2022-07-12' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (3, 1, CAST(N'2022-07-13' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (4, 1, CAST(N'2022-07-14' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (5, 1, CAST(N'2022-07-15' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (6, 2, CAST(N'2022-07-11' AS Date), 2, 2, 1)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (8, 2, CAST(N'2022-07-12' AS Date), 2, 2, 1)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (9, 2, CAST(N'2022-07-13' AS Date), 2, 2, 1)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (10, 2, CAST(N'2022-07-14' AS Date), 2, 2, 1)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (11, 2, CAST(N'2022-07-15' AS Date), 2, 2, 1)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (12, 3, CAST(N'2022-07-11' AS Date), 3, 1, 2)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (13, 3, CAST(N'2022-07-12' AS Date), 3, 1, 2)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (14, 3, CAST(N'2022-07-13' AS Date), 3, 1, 2)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (15, 3, CAST(N'2022-07-14' AS Date), 3, 1, 2)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (16, 3, CAST(N'2022-07-15' AS Date), 3, 1, 2)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (17, 4, CAST(N'2022-07-11' AS Date), 4, 4, 2)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (18, 4, CAST(N'2022-07-12' AS Date), 4, 4, 2)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (19, 4, CAST(N'2022-07-13' AS Date), 4, 4, 2)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (20, 4, CAST(N'2022-07-14' AS Date), 4, 4, 2)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (21, 4, CAST(N'2022-07-15' AS Date), 4, 4, 2)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (22, 5, CAST(N'2022-07-12' AS Date), 5, 2, 3)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (23, 5, CAST(N'2022-07-15' AS Date), 5, 2, 3)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (24, 6, CAST(N'2022-07-11' AS Date), 5, 1, 5)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (25, 6, CAST(N'2022-07-13' AS Date), 5, 1, 5)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (26, 7, CAST(N'2022-07-11' AS Date), 6, 2, 4)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (27, 7, CAST(N'2022-07-14' AS Date), 6, 2, 4)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (28, 1, CAST(N'2022-07-18' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (29, 1, CAST(N'2022-07-19' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (30, 1, CAST(N'2022-07-20' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (31, 1, CAST(N'2022-07-21' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (32, 1, CAST(N'2022-07-22' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (33, 2, CAST(N'2022-07-18' AS Date), 2, 2, 1)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (34, 2, CAST(N'2022-07-19' AS Date), 2, 2, 1)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (35, 2, CAST(N'2022-07-20' AS Date), 2, 2, 1)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (36, 2, CAST(N'2022-07-21' AS Date), 2, 2, 1)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (37, 2, CAST(N'2022-07-22' AS Date), 2, 2, 1)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (38, 3, CAST(N'2022-07-18' AS Date), 3, 1, 2)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (39, 3, CAST(N'2022-07-19' AS Date), 3, 1, 2)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (40, 3, CAST(N'2022-07-20' AS Date), 3, 1, 2)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (41, 3, CAST(N'2022-07-21' AS Date), 3, 1, 2)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (42, 3, CAST(N'2022-07-22' AS Date), 3, 1, 2)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (43, 4, CAST(N'2022-07-18' AS Date), 4, 4, 2)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (44, 4, CAST(N'2022-07-19' AS Date), 4, 4, 2)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (45, 4, CAST(N'2022-07-20' AS Date), 4, 4, 2)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (46, 4, CAST(N'2022-07-21' AS Date), 4, 4, 2)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (47, 4, CAST(N'2022-07-22' AS Date), 4, 4, 2)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (48, 5, CAST(N'2022-07-19' AS Date), 5, 2, 3)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (49, 5, CAST(N'2022-07-22' AS Date), 5, 2, 3)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (50, 6, CAST(N'2022-07-18' AS Date), 5, 1, 5)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (51, 6, CAST(N'2022-07-20' AS Date), 5, 1, 5)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (52, 7, CAST(N'2022-07-18' AS Date), 6, 2, 4)
GO
INSERT [dbo].[Course] ([TeachingScheduleId], [subjectId], [SessionDate], [SlotId], [RoomId], [lectureId]) VALUES (53, 7, CAST(N'2022-07-21' AS Date), 6, 2, 2)
GO
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (1, 1)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (1, 2)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (1, 3)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (1, 4)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (1, 5)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (1, 6)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (1, 7)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (1, 8)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (1, 9)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (1, 10)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (1, 11)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (1, 12)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (1, 13)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (1, 14)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (1, 15)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (1, 16)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (1, 17)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (1, 18)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (1, 19)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (1, 20)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (1, 21)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (1, 22)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (1, 23)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (1, 24)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (1, 25)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (1, 26)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (1, 27)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (1, 28)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (1, 29)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (1, 30)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (4, 1)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (4, 2)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (4, 3)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (4, 4)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (4, 5)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (4, 6)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (4, 7)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (4, 8)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (4, 9)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (4, 10)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (4, 11)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (4, 12)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (4, 13)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (4, 14)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (4, 15)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (4, 16)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (4, 17)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (4, 18)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (4, 19)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (4, 20)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (4, 21)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (4, 22)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (4, 23)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (4, 25)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (4, 26)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (4, 27)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (4, 28)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (4, 29)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (4, 30)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (5, 1)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (5, 2)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (5, 3)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (5, 4)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (5, 5)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (5, 6)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (5, 7)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (5, 8)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (5, 9)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (5, 10)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (5, 11)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (5, 12)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (5, 13)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (5, 14)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (5, 15)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (5, 16)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (5, 17)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (5, 18)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (5, 19)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (5, 20)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (5, 21)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (5, 22)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (5, 23)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (5, 24)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (5, 25)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (5, 26)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (5, 27)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (5, 28)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (5, 29)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (5, 30)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (6, 1)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (6, 2)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (6, 3)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (6, 4)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (6, 5)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (6, 6)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (6, 7)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (6, 8)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (6, 9)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (6, 10)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (6, 11)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (6, 12)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (6, 13)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (6, 14)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (6, 15)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (6, 16)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (6, 17)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (6, 18)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (6, 19)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (6, 20)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (6, 21)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (6, 22)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (6, 23)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (6, 24)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (6, 25)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (6, 26)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (6, 27)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (6, 28)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (6, 29)
GO
INSERT [dbo].[Enroll] ([GroupId], [StudentId]) VALUES (6, 30)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (1, 1)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (1, 2)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (1, 3)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (1, 4)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (1, 5)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (4, 6)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (4, 10)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (4, 8)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (4, 9)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (4, 11)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (1, 12)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (1, 13)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (1, 14)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (1, 15)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (1, 16)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (4, 17)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (4, 18)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (4, 19)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (4, 20)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (4, 21)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (5, 22)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (5, 23)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (6, 24)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (6, 25)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (6, 26)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (6, 27)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (1, 28)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (1, 29)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (1, 30)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (1, 31)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (1, 32)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (4, 33)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (4, 34)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (4, 35)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (4, 36)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (4, 37)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (1, 38)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (1, 39)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (1, 40)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (1, 41)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (1, 42)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (1, 43)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (1, 44)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (1, 45)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (1, 46)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (1, 47)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (4, 48)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (4, 49)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (4, 50)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (1, 51)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (1, 52)
GO
INSERT [dbo].[Group_Course] ([GroupId], [TeachingScheduleId]) VALUES (1, 53)
GO
SET IDENTITY_INSERT [dbo].[Groups] ON 
GO
INSERT [dbo].[Groups] ([GroupId], [GroupCode], [GroupDescription]) VALUES (1, N'SE1620', N'SE1620')
GO
INSERT [dbo].[Groups] ([GroupId], [GroupCode], [GroupDescription]) VALUES (4, N'SE1518', N'SE1518')
GO
INSERT [dbo].[Groups] ([GroupId], [GroupCode], [GroupDescription]) VALUES (5, N'SE1610', N'SE1610')
GO
INSERT [dbo].[Groups] ([GroupId], [GroupCode], [GroupDescription]) VALUES (6, N'SE1509', N'SE1509')
GO
SET IDENTITY_INSERT [dbo].[Groups] OFF
GO
SET IDENTITY_INSERT [dbo].[Lecture] ON 
GO
INSERT [dbo].[Lecture] ([lectureId], [lectureName], [lectureCode], [gender], [dob], [address], [aId]) VALUES (1, N'Nguyễn Thúy Hường', N'HuongNT', 0, CAST(N'1989-06-20' AS Date), N'Hà Nam', 2)
GO
INSERT [dbo].[Lecture] ([lectureId], [lectureName], [lectureCode], [gender], [dob], [address], [aId]) VALUES (2, N'Trần Đình Tiến', N'TienTD', 1, CAST(N'1989-06-20' AS Date), N'Hà Nam', 6)
GO
INSERT [dbo].[Lecture] ([lectureId], [lectureName], [lectureCode], [gender], [dob], [address], [aId]) VALUES (3, N'Ngô Tùng Sơn', N'SonNT', 1, CAST(N'1989-06-20' AS Date), N'Hà Nam', 3)
GO
INSERT [dbo].[Lecture] ([lectureId], [lectureName], [lectureCode], [gender], [dob], [address], [aId]) VALUES (4, N'Đỗ Minh Thu', N'ThuDM', 0, CAST(N'1989-06-20' AS Date), N'Hà Nam', 5)
GO
INSERT [dbo].[Lecture] ([lectureId], [lectureName], [lectureCode], [gender], [dob], [address], [aId]) VALUES (5, N'Trần Đình Trí', N'TriTD', 1, CAST(N'1989-06-20' AS Date), N'Hà Nam', 4)
GO
SET IDENTITY_INSERT [dbo].[Lecture] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 
GO
INSERT [dbo].[Room] ([roomId], [roomName]) VALUES (1, N'BE-213    ')
GO
INSERT [dbo].[Room] ([roomId], [roomName]) VALUES (2, N'DE-303    ')
GO
INSERT [dbo].[Room] ([roomId], [roomName]) VALUES (3, N'DE-202    ')
GO
INSERT [dbo].[Room] ([roomId], [roomName]) VALUES (4, N'DE-401')
GO
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
SET IDENTITY_INSERT [dbo].[Slot] ON 
GO
INSERT [dbo].[Slot] ([slotId], [slotName], [startTime], [endTime]) VALUES (1, N'Slot 1', CAST(N'07:30:00' AS Time), CAST(N'09:00:00' AS Time))
GO
INSERT [dbo].[Slot] ([slotId], [slotName], [startTime], [endTime]) VALUES (2, N'Slot 2', CAST(N'09:10:00' AS Time), CAST(N'10:40:00' AS Time))
GO
INSERT [dbo].[Slot] ([slotId], [slotName], [startTime], [endTime]) VALUES (3, N'Slot 3', CAST(N'10:50:00' AS Time), CAST(N'12:20:00' AS Time))
GO
INSERT [dbo].[Slot] ([slotId], [slotName], [startTime], [endTime]) VALUES (4, N'Slot 4', CAST(N'12:50:00' AS Time), CAST(N'14:20:00' AS Time))
GO
INSERT [dbo].[Slot] ([slotId], [slotName], [startTime], [endTime]) VALUES (5, N'Slot 5', CAST(N'14:30:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[Slot] ([slotId], [slotName], [startTime], [endTime]) VALUES (6, N'Slot 6', CAST(N'16:10:00' AS Time), CAST(N'17:40:00' AS Time))
GO
SET IDENTITY_INSERT [dbo].[Slot] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 
GO
INSERT [dbo].[Student] ([studentId], [rollNumber], [fullName], [gender], [dob], [image], [address], [phoneNumber], [aId]) VALUES (1, N'HE151515', N'Student name', 1, CAST(N'2001-01-10' AS Date), N'assets/img/anhnam.jpg', N'HN', N'0962813919', 1)
GO
INSERT [dbo].[Student] ([studentId], [rollNumber], [fullName], [gender], [dob], [image], [address], [phoneNumber], [aId]) VALUES (2, N'HE159978', N'Thành Hữu Ngân Giang', 0, CAST(N'2001-03-04' AS Date), N'assets/img/anhnu.jpg', N'HN', N'0977865123', 9)
GO
INSERT [dbo].[Student] ([studentId], [rollNumber], [fullName], [gender], [dob], [image], [address], [phoneNumber], [aId]) VALUES (3, N'HE156632', N'Nguyễn Phúc Hưng', 1, CAST(N'2001-09-08' AS Date), N'assets/img/anhnam.jpg', N'HN', N'0988362776', 37)
GO
INSERT [dbo].[Student] ([studentId], [rollNumber], [fullName], [gender], [dob], [image], [address], [phoneNumber], [aId]) VALUES (4, N'HE150907', N'Nguyễn Trà My', 0, CAST(N'2001-09-03' AS Date), N'assets/img/anhnu.jpg', N'HN', N'0332031245', 40)
GO
INSERT [dbo].[Student] ([studentId], [rollNumber], [fullName], [gender], [dob], [image], [address], [phoneNumber], [aId]) VALUES (5, N'HE159983', N'Phạm Hồng Phước', 1, CAST(N'2001-02-12' AS Date), N'assets/img/anhnam.jpg', N'HN', N'0976541234', 12)
GO
INSERT [dbo].[Student] ([studentId], [rollNumber], [fullName], [gender], [dob], [image], [address], [phoneNumber], [aId]) VALUES (6, N'HE157651', N'Phạm Hồng Hạnh', 0, CAST(N'2001-09-18' AS Date), N'assets/img/anhnu.jpg', N'HN', N'0334567888', 13)
GO
INSERT [dbo].[Student] ([studentId], [rollNumber], [fullName], [gender], [dob], [image], [address], [phoneNumber], [aId]) VALUES (7, N'HE157878', N'Hà Anh Tuấm', 1, CAST(N'2001-12-11' AS Date), N'assets/img/anhnam.jpg', N'HN', N'0334987123', 14)
GO
INSERT [dbo].[Student] ([studentId], [rollNumber], [fullName], [gender], [dob], [image], [address], [phoneNumber], [aId]) VALUES (8, N'HE155346', N'Ha Thu An', 0, CAST(N'2000-12-05' AS Date), N'assets/img/anhnu.jpg', N'HN', N'0933456999', 7)
GO
INSERT [dbo].[Student] ([studentId], [rollNumber], [fullName], [gender], [dob], [image], [address], [phoneNumber], [aId]) VALUES (9, N'HE153366', N'Đỗ Anh Dũng', 1, CAST(N'1999-07-03' AS Date), N'assets/img/anhnam.jpg', N'HN', N'0978666333', 15)
GO
INSERT [dbo].[Student] ([studentId], [rollNumber], [fullName], [gender], [dob], [image], [address], [phoneNumber], [aId]) VALUES (10, N'HE159981', N'Bùi Quỳnh Như', 0, CAST(N'2000-07-12' AS Date), N'assets/img/anhnu.jpg', N'HN', N'0978659999', 16)
GO
INSERT [dbo].[Student] ([studentId], [rollNumber], [fullName], [gender], [dob], [image], [address], [phoneNumber], [aId]) VALUES (11, N'HE151892', N'Nguyễn Thu Trà', 0, CAST(N'2001-05-08' AS Date), N'assets/img/anhnu.jpg', N'HN', N'0955123476', 17)
GO
INSERT [dbo].[Student] ([studentId], [rollNumber], [fullName], [gender], [dob], [image], [address], [phoneNumber], [aId]) VALUES (12, N'HE150039', N'Đào Mỹ Anh', 0, CAST(N'2001-01-02' AS Date), N'assets/img/anhnu.jpg', N'HN', N'0977643812', 18)
GO
INSERT [dbo].[Student] ([studentId], [rollNumber], [fullName], [gender], [dob], [image], [address], [phoneNumber], [aId]) VALUES (13, N'HE150102', N'Lê Thùy Trang', 0, CAST(N'2002-03-09' AS Date), N'assets/img/anhnu.jpg', N'HN', N'0934567822', 19)
GO
INSERT [dbo].[Student] ([studentId], [rollNumber], [fullName], [gender], [dob], [image], [address], [phoneNumber], [aId]) VALUES (14, N'HE150892', N'Vũ Ngọc Ánh', 0, CAST(N'1999-02-04' AS Date), N'assets/img/anhnu.jpg', N'HN', N'0977445321', 20)
GO
INSERT [dbo].[Student] ([studentId], [rollNumber], [fullName], [gender], [dob], [image], [address], [phoneNumber], [aId]) VALUES (15, N'HE150081', N'Phạm Thu Hương', 0, CAST(N'2001-07-02' AS Date), N'assets/img/anhnu.jpg', N'HN', N'0334145672', 21)
GO
INSERT [dbo].[Student] ([studentId], [rollNumber], [fullName], [gender], [dob], [image], [address], [phoneNumber], [aId]) VALUES (16, N'HE147791', N'Đỗ Thúy Hường', 0, CAST(N'2001-08-03' AS Date), N'assets/img/anhnu.jpg', N'HN', N'0966321478', 22)
GO
INSERT [dbo].[Student] ([studentId], [rollNumber], [fullName], [gender], [dob], [image], [address], [phoneNumber], [aId]) VALUES (17, N'HE150762', N'Đào Trọng Tiến', 1, CAST(N'2001-01-15' AS Date), N'assets/img/anhnam.jpg', N'HN', N'0334561783', 23)
GO
INSERT [dbo].[Student] ([studentId], [rollNumber], [fullName], [gender], [dob], [image], [address], [phoneNumber], [aId]) VALUES (18, N'HE150984', N'Ngô Viết Cảnh', 1, CAST(N'2001-03-19' AS Date), N'assets/img/anhnam.jpg', N'HN', N'0914667543', 24)
GO
INSERT [dbo].[Student] ([studentId], [rollNumber], [fullName], [gender], [dob], [image], [address], [phoneNumber], [aId]) VALUES (19, N'HE160809', N'Phạm Anh Vinh', 1, CAST(N'2000-09-01' AS Date), N'assets/img/anhnam.jpg', N'HN', N'0334555624', 25)
GO
INSERT [dbo].[Student] ([studentId], [rollNumber], [fullName], [gender], [dob], [image], [address], [phoneNumber], [aId]) VALUES (20, N'HE161032', N'Chu Nguyệt Anh', 0, CAST(N'2001-04-07' AS Date), N'assets/img/anhnu.jpg', N'HN', N'0978788677', 26)
GO
INSERT [dbo].[Student] ([studentId], [rollNumber], [fullName], [gender], [dob], [image], [address], [phoneNumber], [aId]) VALUES (21, N'HE156789', N'Nguyễn Đình Sang', 1, CAST(N'2001-09-03' AS Date), N'assets/img/anhnam.jpg', N'HN', N'0334789888', 27)
GO
INSERT [dbo].[Student] ([studentId], [rollNumber], [fullName], [gender], [dob], [image], [address], [phoneNumber], [aId]) VALUES (22, N'HE145677', N'Phạm Thế Dũng', 1, CAST(N'2001-01-04' AS Date), N'assets/img/anhnam.jpg', N'HN', N'0956123461', 28)
GO
INSERT [dbo].[Student] ([studentId], [rollNumber], [fullName], [gender], [dob], [image], [address], [phoneNumber], [aId]) VALUES (23, N'HE156681', N'Nguyễn Khánh Phương', 1, CAST(N'2001-12-05' AS Date), N'assets/img/anhnam.jpg', N'HN', N'0337861233', 41)
GO
INSERT [dbo].[Student] ([studentId], [rollNumber], [fullName], [gender], [dob], [image], [address], [phoneNumber], [aId]) VALUES (24, N'HE154971', N'Ngô Bá Chung', 1, CAST(N'1999-12-21' AS Date), N'assets/img/anhnam.jpg', N'HN', N'0337666512', 30)
GO
INSERT [dbo].[Student] ([studentId], [rollNumber], [fullName], [gender], [dob], [image], [address], [phoneNumber], [aId]) VALUES (25, N'HE153351', N'Nguyễn Thế Huân', 1, CAST(N'2001-12-04' AS Date), N'assets/img/anhnam.jpg', N'HN', N'0334789876', 31)
GO
INSERT [dbo].[Student] ([studentId], [rollNumber], [fullName], [gender], [dob], [image], [address], [phoneNumber], [aId]) VALUES (26, N'HE150803', N'Phạm Duy Minh', 1, CAST(N'2001-10-17' AS Date), N'assets/img/anhnam.jpg', N'HN', N'0989786542', 32)
GO
INSERT [dbo].[Student] ([studentId], [rollNumber], [fullName], [gender], [dob], [image], [address], [phoneNumber], [aId]) VALUES (27, N'HE150017', N'Trần Anh Hiếu', 1, CAST(N'2001-09-01' AS Date), N'assets/img/anhnam.jpg', N'HN', N'0332187987', 33)
GO
INSERT [dbo].[Student] ([studentId], [rollNumber], [fullName], [gender], [dob], [image], [address], [phoneNumber], [aId]) VALUES (28, N'HE155987', N'Đào Tiến Trung', 1, CAST(N'2001-07-15' AS Date), N'assets/img/anhnam.jpg', N'HN', N'0979666583', 34)
GO
INSERT [dbo].[Student] ([studentId], [rollNumber], [fullName], [gender], [dob], [image], [address], [phoneNumber], [aId]) VALUES (29, N'HE160542', N'Phạm Anh Thư', 1, CAST(N'2000-06-25' AS Date), N'assets/img/anhnam.jpg', N'HN', N'0988556919', 35)
GO
INSERT [dbo].[Student] ([studentId], [rollNumber], [fullName], [gender], [dob], [image], [address], [phoneNumber], [aId]) VALUES (30, N'HE150476', N'Nguyễn Thị Ngọc', 0, CAST(N'2001-03-16' AS Date), N'assets/img/anhnu.jpg', N'HN', N'0988312766', 36)
GO
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[Subject] ON 
GO
INSERT [dbo].[Subject] ([subjectId], [subjectCode], [subjectName]) VALUES (1, N'PRJ301', N'Java Web Application Development')
GO
INSERT [dbo].[Subject] ([subjectId], [subjectCode], [subjectName]) VALUES (2, N'WED201c', N'Web Design')
GO
INSERT [dbo].[Subject] ([subjectId], [subjectCode], [subjectName]) VALUES (3, N'PRN211', N'Basic Cross-Platform Application Programming With .NET')
GO
INSERT [dbo].[Subject] ([subjectId], [subjectCode], [subjectName]) VALUES (4, N'DBI202', N'Introduction to Databases')
GO
INSERT [dbo].[Subject] ([subjectId], [subjectCode], [subjectName]) VALUES (5, N'LAB211', N'OOP with Java Lab')
GO
INSERT [dbo].[Subject] ([subjectId], [subjectCode], [subjectName]) VALUES (6, N'SWP391', N'Application development project')
GO
INSERT [dbo].[Subject] ([subjectId], [subjectCode], [subjectName]) VALUES (7, N'SWE201c', N'Introduction to Software Engineering')
GO
SET IDENTITY_INSERT [dbo].[Subject] OFF
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Course] FOREIGN KEY([TeachingScheduleId])
REFERENCES [dbo].[Course] ([TeachingScheduleId])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Course]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([studentId])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Student]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Lecture] FOREIGN KEY([lectureId])
REFERENCES [dbo].[Lecture] ([lectureId])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Lecture]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([roomId])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Room]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Slot] FOREIGN KEY([SlotId])
REFERENCES [dbo].[Slot] ([slotId])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Slot]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Subject] FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Subject]
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD  CONSTRAINT [FK_Enroll_Groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([GroupId])
GO
ALTER TABLE [dbo].[Enroll] CHECK CONSTRAINT [FK_Enroll_Groups]
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD  CONSTRAINT [FK_Enroll_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([studentId])
GO
ALTER TABLE [dbo].[Enroll] CHECK CONSTRAINT [FK_Enroll_Student]
GO
ALTER TABLE [dbo].[Group_Course]  WITH CHECK ADD  CONSTRAINT [FK_Group_Course_Course] FOREIGN KEY([TeachingScheduleId])
REFERENCES [dbo].[Course] ([TeachingScheduleId])
GO
ALTER TABLE [dbo].[Group_Course] CHECK CONSTRAINT [FK_Group_Course_Course]
GO
ALTER TABLE [dbo].[Group_Course]  WITH CHECK ADD  CONSTRAINT [FK_Group_Course_Groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([GroupId])
GO
ALTER TABLE [dbo].[Group_Course] CHECK CONSTRAINT [FK_Group_Course_Groups]
GO
ALTER TABLE [dbo].[Lecture]  WITH CHECK ADD  CONSTRAINT [FK_Lecture_Accounts] FOREIGN KEY([aId])
REFERENCES [dbo].[Accounts] ([aId])
GO
ALTER TABLE [dbo].[Lecture] CHECK CONSTRAINT [FK_Lecture_Accounts]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Accounts] FOREIGN KEY([aId])
REFERENCES [dbo].[Accounts] ([aId])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Accounts]
GO
USE [master]
GO
ALTER DATABASE [Assignment] SET  READ_WRITE 
GO
