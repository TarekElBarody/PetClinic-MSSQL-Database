USE [master]
GO
/****** Object:  Database [PetClinic]    Script Date: 20/12/2022 06:15:48 م ******/
CREATE DATABASE [PetClinic]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PetClinic', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\PetClinic.mdf' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PetClinic_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\PetClinic_log.ldf' , SIZE = 2560KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PetClinic] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PetClinic].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [PetClinic] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PetClinic] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PetClinic] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PetClinic] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PetClinic] SET ARITHABORT OFF 
GO
ALTER DATABASE [PetClinic] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PetClinic] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PetClinic] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PetClinic] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PetClinic] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PetClinic] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PetClinic] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PetClinic] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PetClinic] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PetClinic] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PetClinic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PetClinic] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PetClinic] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PetClinic] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PetClinic] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PetClinic] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PetClinic] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PetClinic] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PetClinic] SET  MULTI_USER 
GO
ALTER DATABASE [PetClinic] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PetClinic] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PetClinic] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PetClinic] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PetClinic] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PetClinic] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PetClinic', N'ON'
GO
ALTER DATABASE [PetClinic] SET QUERY_STORE = OFF
GO
USE [PetClinic]
GO
/****** Object:  FullTextCatalog [FullTextCatalog]    Script Date: 20/12/2022 06:15:49 م ******/
CREATE FULLTEXT CATALOG [FullTextCatalog] WITH ACCENT_SENSITIVITY = ON
GO
/****** Object:  Table [dbo].[Animals]    Script Date: 20/12/2022 06:15:49 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animals](
	[Animal_ID] [int] IDENTITY(1,1) NOT NULL,
	[Animal_Owner_ID] [int] NULL,
	[Animal_Name] [nvarchar](200) NOT NULL,
	[Animal_Type] [nvarchar](50) NOT NULL,
	[Animal_Species] [nvarchar](50) NULL,
	[Animal_Gender] [nvarchar](50) NOT NULL,
	[Animal_Color] [nvarchar](50) NOT NULL,
	[Animal_BrithDate] [date] NOT NULL,
	[Animal_Status] [nvarchar](50) NULL,
	[Animal_Admited] [int] NOT NULL,
	[Animal_Info] [nvarchar](max) NULL,
	[Animal_Created] [datetime] NOT NULL,
 CONSTRAINT [PK_Animals] PRIMARY KEY CLUSTERED 
(
	[Animal_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Procedures]    Script Date: 20/12/2022 06:15:49 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Procedures](
	[Procedure_ID] [int] IDENTITY(1,1) NOT NULL,
	[Procedure_Visit_ID] [int] NOT NULL,
	[Procedure_Code] [nvarchar](50) NOT NULL,
	[Procedure_Service] [nvarchar](250) NOT NULL,
	[Procedure_Disc] [nvarchar](max) NULL,
	[Procedure_Cost] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Procedures] PRIMARY KEY CLUSTERED 
(
	[Procedure_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clinics]    Script Date: 20/12/2022 06:15:49 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clinics](
	[Clinic_ID] [int] IDENTITY(1,1) NOT NULL,
	[Clinic_Name] [nvarchar](50) NOT NULL,
	[Clinic_Country] [nvarchar](50) NULL,
	[Clinic_City] [nvarchar](50) NULL,
	[Clinic_State] [nvarchar](max) NULL,
	[Clinic_Address] [nvarchar](max) NULL,
	[Clinic_Created] [datetime] NOT NULL,
 CONSTRAINT [PK_Clinics] PRIMARY KEY CLUSTERED 
(
	[Clinic_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visits]    Script Date: 20/12/2022 06:15:49 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visits](
	[Visit_ID] [int] IDENTITY(1,1) NOT NULL,
	[Visit_Animal_ID] [int] NOT NULL,
	[Visit_Clinic_ID] [int] NOT NULL,
	[Visit_Physician1_ID] [int] NOT NULL,
	[Visit_Physician2_ID] [int] NULL,
	[Visit_Date] [datetime] NOT NULL,
	[Visit_Status] [int] NOT NULL,
	[Visit_Info] [nvarchar](max) NULL,
 CONSTRAINT [PK_Visits] PRIMARY KEY CLUSTERED 
(
	[Visit_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Physicians]    Script Date: 20/12/2022 06:15:49 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Physicians](
	[Physician_ID] [int] IDENTITY(1,1) NOT NULL,
	[Physician_Clinic_ID] [int] NOT NULL,
	[Physician_FName] [nvarchar](50) NULL,
	[Physician_LName] [nvarchar](50) NOT NULL,
	[Physician_Gender] [nvarchar](50) NOT NULL,
	[Physician_Title] [nvarchar](250) NULL,
	[Physician_Role] [nvarchar](50) NULL,
	[Physician_Created] [datetime] NOT NULL,
 CONSTRAINT [PK_Physicians] PRIMARY KEY CLUSTERED 
(
	[Physician_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Physicians2_Report]    Script Date: 20/12/2022 06:15:49 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- (0 + Convert(Char(8),GETDATE(),112) - Convert(Char(8),Animals.Animal_BrithDate,112))  / 10000 
-- =============================================
CREATE FUNCTION [dbo].[fn_Physicians2_Report]
(	
   	@YearStart DATE,
	 @YearEnd DATE,
	 @Age INT
)
RETURNS TABLE 
AS
RETURN 
(

SELECT      Physicians.Physician_ID, Physicians.Physician_FName, Physicians.Physician_LName, CONCAT(dbo.Physicians.Physician_FName, ' ', dbo.Physicians.Physician_LName) AS Physician_Name
			,Physicians.Physician_Gender, Physicians.Physician_Title, Physicians.Physician_Role, 
			Clinics.Clinic_ID, Clinics.Clinic_Name, Clinics.Clinic_Country, 
			COUNT(DISTINCT(Animals.Animal_ID)) AS Animal_Volume, 
			COUNT(Visits.Visit_Physician1_ID) AS Visit_Frequancy, 
			ISNULL(SUM(Procedures.Procedure_Cost),0) AS Procedure_Sum_Cost, 
			@YearStart AS Year_Start ,@YearEnd AS Year_End , @Age AS Pet_Under_Age
FROM            Physicians LEFT OUTER JOIN
                         Clinics ON Physicians.Physician_Clinic_ID = Clinics.Clinic_ID LEFT OUTER JOIN
                         Visits ON Physicians.Physician_ID = Visits.Visit_Physician2_ID LEFT OUTER JOIN
                         Procedures ON Visits.Visit_ID = Procedures.Procedure_Visit_ID LEFT OUTER JOIN
                         Animals ON Visits.Visit_Animal_ID = Animals.Animal_ID

WHERE Visits.Visit_Date >= @YearStart AND Visits.Visit_Date <= @YearEnd 
AND DATEDIFF(YEAR, Animals.Animal_BrithDate, GETDATE()) < @Age
AND Visits.Visit_Physician2_ID NOT IN (SELECT Visit_Physician1_ID FROM Visits)

GROUP BY Physicians.Physician_ID, Physicians.Physician_FName, Physicians.Physician_LName, Physicians.Physician_Gender, Physicians.Physician_Title, Physicians.Physician_Role, Physicians.Physician_Created, Clinics.Clinic_ID, Clinics.Clinic_Name, 
                         Clinics.Clinic_Country


)
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Physicians1_Report]    Script Date: 20/12/2022 06:15:49 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- (0 + Convert(Char(8),GETDATE(),112) - Convert(Char(8),Animals.Animal_BrithDate,112))  / 10000 
-- =============================================
CREATE FUNCTION [dbo].[fn_Physicians1_Report]
(	
   	@YearStart DATE,
	 @YearEnd DATE,
	 @Age INT
)
RETURNS TABLE 
AS
RETURN 
(

SELECT      Physicians.Physician_ID, Physicians.Physician_FName, Physicians.Physician_LName, CONCAT(dbo.Physicians.Physician_FName, ' ', dbo.Physicians.Physician_LName) AS Physician_Name
			,Physicians.Physician_Gender, Physicians.Physician_Title, Physicians.Physician_Role, 
			Clinics.Clinic_ID, Clinics.Clinic_Name, Clinics.Clinic_Country, 
			COUNT(DISTINCT(Animals.Animal_ID)) AS Animal_Volume, 
			COUNT(Visits.Visit_Physician1_ID) AS Visit_Frequancy, 
			ISNULL(SUM(Procedures.Procedure_Cost),0) AS Procedure_Sum_Cost, 
			@YearStart AS Year_Start ,@YearEnd AS Year_End , @Age AS Pet_Under_Age
FROM            Physicians LEFT OUTER JOIN
                         Clinics ON Physicians.Physician_Clinic_ID = Clinics.Clinic_ID LEFT OUTER JOIN
                         Visits ON Physicians.Physician_ID = Visits.Visit_Physician1_ID LEFT OUTER JOIN
                         Procedures ON Visits.Visit_ID = Procedures.Procedure_Visit_ID LEFT OUTER JOIN
                         Animals ON Visits.Visit_Animal_ID = Animals.Animal_ID

WHERE Visits.Visit_Date >= @YearStart AND Visits.Visit_Date <= @YearEnd 
AND DATEDIFF(YEAR, Animals.Animal_BrithDate, GETDATE()) < @Age
AND Visits.Visit_Physician1_ID NOT IN (SELECT Visit_Physician2_ID FROM Visits)

GROUP BY Physicians.Physician_ID, Physicians.Physician_FName, Physicians.Physician_LName, Physicians.Physician_Gender, Physicians.Physician_Title, Physicians.Physician_Role, Physicians.Physician_Created, Clinics.Clinic_ID, Clinics.Clinic_Name, 
                         Clinics.Clinic_Country


)
GO
/****** Object:  Table [dbo].[Owners]    Script Date: 20/12/2022 06:15:49 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Owners](
	[Owner_ID] [int] IDENTITY(1,1) NOT NULL,
	[Owner_FName] [nvarchar](50) NOT NULL,
	[Owner_LName] [nvarchar](50) NOT NULL,
	[Owner_Phone] [nvarchar](50) NOT NULL,
	[Owner_Email] [nvarchar](50) NULL,
	[Owner_License_Num] [nvarchar](50) NULL,
	[Owner_License_Type] [nvarchar](50) NULL,
	[Owner_Country] [nvarchar](50) NULL,
	[Owner_City] [nvarchar](50) NULL,
	[Owner_Address] [nvarchar](max) NULL,
	[Owner_Payment_Type] [nvarchar](50) NULL,
	[Owner_Created] [datetime] NOT NULL,
 CONSTRAINT [PK_Owners] PRIMARY KEY CLUSTERED 
(
	[Owner_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[AnimalFullView]    Script Date: 20/12/2022 06:15:49 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AnimalFullView]
AS
SELECT       Animals.Animal_ID, Animals.Animal_Owner_ID, 
                         Animals.Animal_Name, Animals.Animal_Type, Animals.Animal_Species, Animals.Animal_Gender, Animals.Animal_Color, Animals.Animal_BrithDate, Animals.Animal_Status, Animals.Animal_Admited, Animals.Animal_Info, 
                         Animals.Animal_Created,
						 Owners.Owner_FName, Owners.Owner_LName, Owners.Owner_Phone, Owners.Owner_Payment_Type, Owners.Owner_City, Owners.Owner_Country, Owners.Owner_Address
FROM            Animals INNER JOIN
                         Owners ON Animals.Animal_Owner_ID = Owners.Owner_ID
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Physicians_Report]    Script Date: 20/12/2022 06:15:49 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- (0 + Convert(Char(8),GETDATE(),112) - Convert(Char(8),Animals.Animal_BrithDate,112))  / 10000 
-- =============================================
CREATE FUNCTION [dbo].[fn_Physicians_Report]
(	
   	@YearStart DATE,
	 @YearEnd DATE,
	 @Age INT
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT      Physicians.Physician_ID, Physicians.Physician_FName, Physicians.Physician_LName, CONCAT(dbo.Physicians.Physician_FName, ' ', dbo.Physicians.Physician_LName) AS Physician_Name, 'P1' AS Physician_Posstion
			,Physicians.Physician_Gender, Physicians.Physician_Title, Physicians.Physician_Role, 
			Clinics.Clinic_ID, Clinics.Clinic_Name, Clinics.Clinic_Country, 
			COUNT(DISTINCT(Animals.Animal_ID)) AS Animal_Volume, 
			COUNT(Visits.Visit_Physician1_ID) AS Visit_Frequancy, 
			ISNULL(SUM(Procedures.Procedure_Cost),0) AS Procedure_Sum_Cost, 
			@YearStart AS Year_Start ,@YearEnd AS Year_End , @Age AS Pet_Under_Age
FROM            Physicians LEFT OUTER JOIN
                         Clinics ON Physicians.Physician_Clinic_ID = Clinics.Clinic_ID LEFT OUTER JOIN
                         Visits ON Physicians.Physician_ID = Visits.Visit_Physician1_ID LEFT OUTER JOIN
                         Procedures ON Visits.Visit_ID = Procedures.Procedure_Visit_ID LEFT OUTER JOIN
                         Animals ON Visits.Visit_Animal_ID = Animals.Animal_ID

WHERE Visits.Visit_Date >= @YearStart AND Visits.Visit_Date <= @YearEnd 
AND DATEDIFF(YEAR, Animals.Animal_BrithDate, GETDATE()) < @Age

GROUP BY Physicians.Physician_ID, Physicians.Physician_FName, Physicians.Physician_LName, Physicians.Physician_Gender, Physicians.Physician_Title, Physicians.Physician_Role, Physicians.Physician_Created, Clinics.Clinic_ID, Clinics.Clinic_Name, 
                         Clinics.Clinic_Country
UNION ALL 

SELECT      Physicians.Physician_ID, Physicians.Physician_FName, Physicians.Physician_LName, CONCAT(dbo.Physicians.Physician_FName, ' ', dbo.Physicians.Physician_LName) AS Physician_Name, 'P2' AS Physician_Posstion
			,Physicians.Physician_Gender, Physicians.Physician_Title, Physicians.Physician_Role, 
			Clinics.Clinic_ID, Clinics.Clinic_Name, Clinics.Clinic_Country, 
			COUNT(DISTINCT(Animals.Animal_ID)) AS Animal_Volume, 
			COUNT(Visits.Visit_Physician1_ID) AS Visit_Frequancy, 
			ISNULL(SUM(Procedures.Procedure_Cost),0) AS Procedure_Sum_Cost, 
			@YearStart AS Year_Start ,@YearEnd AS Year_End , @Age AS Pet_Under_Age
FROM            Physicians LEFT OUTER JOIN
                         Clinics ON Physicians.Physician_Clinic_ID = Clinics.Clinic_ID LEFT OUTER JOIN
                         Visits ON Physicians.Physician_ID = Visits.Visit_Physician2_ID LEFT OUTER JOIN
                         Procedures ON Visits.Visit_ID = Procedures.Procedure_Visit_ID LEFT OUTER JOIN
                         Animals ON Visits.Visit_Animal_ID = Animals.Animal_ID

WHERE Visits.Visit_Date >= @YearStart AND Visits.Visit_Date <= @YearEnd 
AND DATEDIFF(YEAR, Animals.Animal_BrithDate, GETDATE()) < @Age


GROUP BY Physicians.Physician_ID, Physicians.Physician_FName, Physicians.Physician_LName, Physicians.Physician_Gender, Physicians.Physician_Title, Physicians.Physician_Role, Physicians.Physician_Created, Clinics.Clinic_ID, Clinics.Clinic_Name, 
                         Clinics.Clinic_Country


)
GO
/****** Object:  View [dbo].[View_Visits_Costs]    Script Date: 20/12/2022 06:15:49 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_Visits_Costs]
AS
SELECT       TOP (100) PERCENT dbo.Procedures.Procedure_ID, dbo.Procedures.Procedure_Code, dbo.Procedures.Procedure_Service, dbo.Procedures.Procedure_Cost, dbo.Visits.Visit_ID, dbo.Visits.Visit_Date, dbo.Visits.Visit_Status, 
                         dbo.Visits.Visit_Info, dbo.Animals.Animal_ID, dbo.Animals.Animal_Name, dbo.Animals.Animal_Type, dbo.Animals.Animal_Species, dbo.Animals.Animal_Gender, dbo.Animals.Animal_Color, dbo.Animals.Animal_BrithDate, 
                         dbo.Animals.Animal_Status, dbo.Animals.Animal_Admited, dbo.Animals.Animal_Info, dbo.Animals.Animal_Created, dbo.Owners.Owner_FName, dbo.Owners.Owner_LName, CONCAT(dbo.Owners.Owner_FName, ' ', dbo.Owners.Owner_LName) AS Owner_Name,  dbo.Owners.Owner_Country, dbo.Owners.Owner_Address, 
                         dbo.Owners.Owner_Phone, dbo.Physicians.Physician_ID, dbo.Physicians.Physician_FName, dbo.Physicians.Physician_LName, CONCAT(dbo.Physicians.Physician_FName, ' ', dbo.Physicians.Physician_LName) AS Physician_Name, 
                         dbo.Physicians.Physician_Gender, dbo.Physicians.Physician_Title, dbo.Clinics.Clinic_ID, dbo.Clinics.Clinic_Name, dbo.Clinics.Clinic_Country, dbo.Clinics.Clinic_City, dbo.Clinics.Clinic_Address
FROM            dbo.Procedures LEFT JOIN
                         dbo.Visits ON dbo.Procedures.Procedure_Visit_ID = dbo.Visits.Visit_ID LEFT OUTER JOIN
                         dbo.Animals ON dbo.Visits.Visit_Animal_ID = dbo.Animals.Animal_ID LEFT OUTER JOIN
                         dbo.Physicians ON dbo.Visits.Visit_Physician1_ID = dbo.Physicians.Physician_ID LEFT OUTER JOIN
                         dbo.Clinics ON dbo.Visits.Visit_Clinic_ID = dbo.Clinics.Clinic_ID LEFT OUTER JOIN
                         dbo.Owners ON dbo.Animals.Animal_Owner_ID = dbo.Owners.Owner_ID

GO
/****** Object:  Index [IX_Animals]    Script Date: 20/12/2022 06:15:49 م ******/
CREATE NONCLUSTERED INDEX [IX_Animals] ON [dbo].[Animals]
(
	[Animal_Owner_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Animals_1]    Script Date: 20/12/2022 06:15:49 م ******/
CREATE NONCLUSTERED INDEX [IX_Animals_1] ON [dbo].[Animals]
(
	[Animal_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Animals_2]    Script Date: 20/12/2022 06:15:49 م ******/
CREATE NONCLUSTERED INDEX [IX_Animals_2] ON [dbo].[Animals]
(
	[Animal_Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Animals_3]    Script Date: 20/12/2022 06:15:49 م ******/
CREATE NONCLUSTERED INDEX [IX_Animals_3] ON [dbo].[Animals]
(
	[Animal_Species] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Animals_4]    Script Date: 20/12/2022 06:15:49 م ******/
CREATE NONCLUSTERED INDEX [IX_Animals_4] ON [dbo].[Animals]
(
	[Animal_BrithDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Owners]    Script Date: 20/12/2022 06:15:49 م ******/
CREATE NONCLUSTERED INDEX [IX_Owners] ON [dbo].[Owners]
(
	[Owner_FName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Owners_1]    Script Date: 20/12/2022 06:15:49 م ******/
CREATE NONCLUSTERED INDEX [IX_Owners_1] ON [dbo].[Owners]
(
	[Owner_LName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Owners_2]    Script Date: 20/12/2022 06:15:49 م ******/
CREATE NONCLUSTERED INDEX [IX_Owners_2] ON [dbo].[Owners]
(
	[Owner_FName] ASC,
	[Owner_LName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Owners_3]    Script Date: 20/12/2022 06:15:49 م ******/
CREATE NONCLUSTERED INDEX [IX_Owners_3] ON [dbo].[Owners]
(
	[Owner_License_Num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Owners_4]    Script Date: 20/12/2022 06:15:49 م ******/
CREATE NONCLUSTERED INDEX [IX_Owners_4] ON [dbo].[Owners]
(
	[Owner_Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Physicians]    Script Date: 20/12/2022 06:15:49 م ******/
CREATE NONCLUSTERED INDEX [IX_Physicians] ON [dbo].[Physicians]
(
	[Physician_FName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Physicians_1]    Script Date: 20/12/2022 06:15:49 م ******/
CREATE NONCLUSTERED INDEX [IX_Physicians_1] ON [dbo].[Physicians]
(
	[Physician_LName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Procedures]    Script Date: 20/12/2022 06:15:49 م ******/
CREATE NONCLUSTERED INDEX [IX_Procedures] ON [dbo].[Procedures]
(
	[Procedure_Cost] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Procedures_1]    Script Date: 20/12/2022 06:15:49 م ******/
CREATE NONCLUSTERED INDEX [IX_Procedures_1] ON [dbo].[Procedures]
(
	[Procedure_Service] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Visits]    Script Date: 20/12/2022 06:15:49 م ******/
CREATE NONCLUSTERED INDEX [IX_Visits] ON [dbo].[Visits]
(
	[Visit_Animal_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Visits_1]    Script Date: 20/12/2022 06:15:49 م ******/
CREATE NONCLUSTERED INDEX [IX_Visits_1] ON [dbo].[Visits]
(
	[Visit_Clinic_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Visits_2]    Script Date: 20/12/2022 06:15:49 م ******/
CREATE NONCLUSTERED INDEX [IX_Visits_2] ON [dbo].[Visits]
(
	[Visit_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Visits_3]    Script Date: 20/12/2022 06:15:49 م ******/
CREATE NONCLUSTERED INDEX [IX_Visits_3] ON [dbo].[Visits]
(
	[Visit_Physician1_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Visits_4]    Script Date: 20/12/2022 06:15:49 م ******/
CREATE NONCLUSTERED INDEX [IX_Visits_4] ON [dbo].[Visits]
(
	[Visit_Physician2_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Animals] ADD  CONSTRAINT [DF_Animals_Animal_Admited]  DEFAULT ((0)) FOR [Animal_Admited]
GO
ALTER TABLE [dbo].[Animals] ADD  CONSTRAINT [DF_Animals_Animal_Created]  DEFAULT (getdate()) FOR [Animal_Created]
GO
ALTER TABLE [dbo].[Clinics] ADD  CONSTRAINT [DF_Clinics_Clinic_Created]  DEFAULT (getdate()) FOR [Clinic_Created]
GO
ALTER TABLE [dbo].[Owners] ADD  CONSTRAINT [DF_Owners_Owner_Created]  DEFAULT (getdate()) FOR [Owner_Created]
GO
ALTER TABLE [dbo].[Physicians] ADD  CONSTRAINT [DF_Physicians_Physician_Created]  DEFAULT (getdate()) FOR [Physician_Created]
GO
ALTER TABLE [dbo].[Visits] ADD  CONSTRAINT [DF_Visits_Visit_Status]  DEFAULT ((1)) FOR [Visit_Status]
GO
ALTER TABLE [dbo].[Animals]  WITH CHECK ADD  CONSTRAINT [FK_Animals_Owners] FOREIGN KEY([Animal_Owner_ID])
REFERENCES [dbo].[Owners] ([Owner_ID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Animals] CHECK CONSTRAINT [FK_Animals_Owners]
GO
ALTER TABLE [dbo].[Physicians]  WITH CHECK ADD  CONSTRAINT [FK_Physicians_Clinics] FOREIGN KEY([Physician_Clinic_ID])
REFERENCES [dbo].[Clinics] ([Clinic_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Physicians] CHECK CONSTRAINT [FK_Physicians_Clinics]
GO
ALTER TABLE [dbo].[Procedures]  WITH CHECK ADD  CONSTRAINT [FK_Procedures_Visits] FOREIGN KEY([Procedure_Visit_ID])
REFERENCES [dbo].[Visits] ([Visit_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Procedures] CHECK CONSTRAINT [FK_Procedures_Visits]
GO
ALTER TABLE [dbo].[Visits]  WITH CHECK ADD  CONSTRAINT [FK_Visits_Animals] FOREIGN KEY([Visit_Animal_ID])
REFERENCES [dbo].[Animals] ([Animal_ID])
GO
ALTER TABLE [dbo].[Visits] CHECK CONSTRAINT [FK_Visits_Animals]
GO
ALTER TABLE [dbo].[Visits]  WITH CHECK ADD  CONSTRAINT [FK_Visits_Clinics] FOREIGN KEY([Visit_Clinic_ID])
REFERENCES [dbo].[Clinics] ([Clinic_ID])
GO
ALTER TABLE [dbo].[Visits] CHECK CONSTRAINT [FK_Visits_Clinics]
GO
ALTER TABLE [dbo].[Visits]  WITH CHECK ADD  CONSTRAINT [FK_Visits_Physicians] FOREIGN KEY([Visit_Physician1_ID])
REFERENCES [dbo].[Physicians] ([Physician_ID])
GO
ALTER TABLE [dbo].[Visits] CHECK CONSTRAINT [FK_Visits_Physicians]
GO
ALTER TABLE [dbo].[Visits]  WITH CHECK ADD  CONSTRAINT [FK_Visits_Physicians1] FOREIGN KEY([Visit_Physician2_ID])
REFERENCES [dbo].[Physicians] ([Physician_ID])
GO
ALTER TABLE [dbo].[Visits] CHECK CONSTRAINT [FK_Visits_Physicians1]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Animals"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 327
               Right = 221
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Owners"
            Begin Extent = 
               Top = 6
               Left = 259
               Bottom = 335
               Right = 465
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AnimalFullView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AnimalFullView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Procedures"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 230
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Visits"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 225
               Right = 450
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Animals"
            Begin Extent = 
               Top = 6
               Left = 488
               Bottom = 289
               Right = 671
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Physicians"
            Begin Extent = 
               Top = 6
               Left = 709
               Bottom = 233
               Right = 899
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Clinics"
            Begin Extent = 
               Top = 6
               Left = 937
               Bottom = 224
               Right = 1107
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Owners"
            Begin Extent = 
               Top = 6
               Left = 1145
               Bottom = 286
               Right = 1351
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Visits_Costs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Visits_Costs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Visits_Costs'
GO
USE [master]
GO
ALTER DATABASE [PetClinic] SET  READ_WRITE 
GO
