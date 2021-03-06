USE [master]
GO
/****** Object:  Database [Coelsa]    Script Date: 21/9/2021 19:26:33 ******/
CREATE DATABASE [Coelsa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Coelsa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Coelsa.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Coelsa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Coelsa_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Coelsa] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Coelsa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Coelsa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Coelsa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Coelsa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Coelsa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Coelsa] SET ARITHABORT OFF 
GO
ALTER DATABASE [Coelsa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Coelsa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Coelsa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Coelsa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Coelsa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Coelsa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Coelsa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Coelsa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Coelsa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Coelsa] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Coelsa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Coelsa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Coelsa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Coelsa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Coelsa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Coelsa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Coelsa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Coelsa] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Coelsa] SET  MULTI_USER 
GO
ALTER DATABASE [Coelsa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Coelsa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Coelsa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Coelsa] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Coelsa] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Coelsa] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Coelsa] SET QUERY_STORE = OFF
GO
USE [Coelsa]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 21/9/2021 19:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Company] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([Id], [FirstName], [LastName], [Company], [Email], [PhoneNumber]) VALUES (1, N'Martin ', N'Perez', N'Google ', N'ma@a.a', N'11-1111-1112')
INSERT [dbo].[Contact] ([Id], [FirstName], [LastName], [Company], [Email], [PhoneNumber]) VALUES (2, N'Pedro', N'Suarez', N'Empire Google', N'sa@asssa', N'11-1111-1113')
INSERT [dbo].[Contact] ([Id], [FirstName], [LastName], [Company], [Email], [PhoneNumber]) VALUES (3, N'Raul', N'Gimenez', N'Empire Google', N'sa@asssa', N'11-1111-1113')
INSERT [dbo].[Contact] ([Id], [FirstName], [LastName], [Company], [Email], [PhoneNumber]) VALUES (4, N'Gonzalo', N'Gonzalez', N'Google', N'sa@asssa', N'11-1111-1113')
INSERT [dbo].[Contact] ([Id], [FirstName], [LastName], [Company], [Email], [PhoneNumber]) VALUES (5, N'Ignacio', N'Lopez', N'Google', N'sa@asssa', N'11-1111-1113')
INSERT [dbo].[Contact] ([Id], [FirstName], [LastName], [Company], [Email], [PhoneNumber]) VALUES (6, N'Martín', N'AAAA', N'asdasd', N'Martín@a.a', N'')
INSERT [dbo].[Contact] ([Id], [FirstName], [LastName], [Company], [Email], [PhoneNumber]) VALUES (7, N'Martín', N'AAAA', N'asdasd', N'Martín@a.a', N'')
INSERT [dbo].[Contact] ([Id], [FirstName], [LastName], [Company], [Email], [PhoneNumber]) VALUES (8, N'Martín', N'AAAA', N'asdasd', N'Martín@a.a', N'')
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
USE [master]
GO
ALTER DATABASE [Coelsa] SET  READ_WRITE 
GO
