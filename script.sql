USE [master]
GO
/****** Object:  Database [BankingSystem]    Script Date: 21.11.2022 20:16:56 ******/
CREATE DATABASE [BankingSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BankingSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BankingSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BankingSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BankingSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BankingSystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BankingSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BankingSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BankingSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BankingSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BankingSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BankingSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [BankingSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BankingSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BankingSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BankingSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BankingSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BankingSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BankingSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BankingSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BankingSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BankingSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BankingSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BankingSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BankingSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BankingSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BankingSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BankingSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BankingSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BankingSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BankingSystem] SET  MULTI_USER 
GO
ALTER DATABASE [BankingSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BankingSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BankingSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BankingSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BankingSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BankingSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BankingSystem] SET QUERY_STORE = OFF
GO
USE [BankingSystem]
GO
/****** Object:  User [user1]    Script Date: 21.11.2022 20:16:57 ******/
CREATE USER [user1] FOR LOGIN [user1] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [BSLogin]    Script Date: 21.11.2022 20:16:57 ******/
CREATE USER [BSLogin] FOR LOGIN [BSLogin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [user1]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [user1]
GO
ALTER ROLE [db_owner] ADD MEMBER [BSLogin]
GO
ALTER ROLE [db_datareader] ADD MEMBER [BSLogin]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [BSLogin]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 21.11.2022 20:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[PaymentId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[BranchId] [int] NOT NULL,
	[OrganizationName] [nvarchar](50) NOT NULL,
	[PaymentNumber] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountRequisites]    Script Date: 21.11.2022 20:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountRequisites](
	[RequisitesId] [int] NOT NULL,
	[PersonalAccount] [nvarchar](50) NOT NULL,
	[PaymentAccount] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AccountRequisites] PRIMARY KEY CLUSTERED 
(
	[RequisitesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bank]    Script Date: 21.11.2022 20:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank](
	[BankId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[License] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Bank] PRIMARY KEY CLUSTERED 
(
	[BankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 21.11.2022 20:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[BranchId] [int] NOT NULL,
	[BankId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[BankIdentificationCode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[BranchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 21.11.2022 20:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ClientId] [int] NOT NULL,
	[BranchId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NOT NULL,
	[ClientName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Sum] [int] NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JuridicalPerson]    Script Date: 21.11.2022 20:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JuridicalPerson](
	[UserId] [int] NOT NULL,
	[BranchId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NOT NULL,
	[PersonName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Sum] [int] NOT NULL,
 CONSTRAINT [PK_JuridicalPerson] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 21.11.2022 20:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PurposeId] [int] NOT NULL,
	[PaymentId] [int] NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[Sum] [int] NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[PurposeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purpose]    Script Date: 21.11.2022 20:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purpose](
	[PurposeId] [int] NOT NULL,
	[PurposeName] [nchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 21.11.2022 20:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] NOT NULL,
	[Name] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 21.11.2022 20:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[RoleId] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Client] FOREIGN KEY([UserId])
REFERENCES [dbo].[Client] ([ClientId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Client]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_JuridicalPerson] FOREIGN KEY([UserId])
REFERENCES [dbo].[JuridicalPerson] ([UserId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_JuridicalPerson]
GO
ALTER TABLE [dbo].[AccountRequisites]  WITH CHECK ADD  CONSTRAINT [FK_AccountRequisites_Account] FOREIGN KEY([RequisitesId])
REFERENCES [dbo].[Account] ([PaymentId])
GO
ALTER TABLE [dbo].[AccountRequisites] CHECK CONSTRAINT [FK_AccountRequisites_Account]
GO
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD  CONSTRAINT [FK_Branch_Bank] FOREIGN KEY([BankId])
REFERENCES [dbo].[Bank] ([BankId])
GO
ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [FK_Branch_Bank]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Branch]
GO
ALTER TABLE [dbo].[JuridicalPerson]  WITH CHECK ADD  CONSTRAINT [FK_JuridicalPerson_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[JuridicalPerson] CHECK CONSTRAINT [FK_JuridicalPerson_Branch]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Account] FOREIGN KEY([PaymentId])
REFERENCES [dbo].[Account] ([PaymentId])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Account]
GO
ALTER TABLE [dbo].[Purpose]  WITH CHECK ADD  CONSTRAINT [FK_Purpose_Payment] FOREIGN KEY([PurposeId])
REFERENCES [dbo].[Payment] ([PurposeId])
GO
ALTER TABLE [dbo].[Purpose] CHECK CONSTRAINT [FK_Purpose_Payment]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_BankStaff_Bank] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Bank] ([BankId])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_BankStaff_Bank]
GO
USE [master]
GO
ALTER DATABASE [BankingSystem] SET  READ_WRITE 
GO
