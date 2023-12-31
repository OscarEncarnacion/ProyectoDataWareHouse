USE [master]
GO
/****** Object:  Database [Fit4Love]    Script Date: 16/11/2023 10:37:28 p. m. ******/
CREATE DATABASE [Fit4Love]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Fit4Love', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVERWAREHOUSE\MSSQL\DATA\Fit4Love.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Fit4Love_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVERWAREHOUSE\MSSQL\DATA\Fit4Love_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Fit4Love] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Fit4Love].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Fit4Love] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Fit4Love] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Fit4Love] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Fit4Love] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Fit4Love] SET ARITHABORT OFF 
GO
ALTER DATABASE [Fit4Love] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Fit4Love] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Fit4Love] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Fit4Love] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Fit4Love] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Fit4Love] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Fit4Love] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Fit4Love] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Fit4Love] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Fit4Love] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Fit4Love] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Fit4Love] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Fit4Love] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Fit4Love] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Fit4Love] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Fit4Love] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Fit4Love] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Fit4Love] SET RECOVERY FULL 
GO
ALTER DATABASE [Fit4Love] SET  MULTI_USER 
GO
ALTER DATABASE [Fit4Love] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Fit4Love] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Fit4Love] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Fit4Love] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Fit4Love] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Fit4Love] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Fit4Love', N'ON'
GO
ALTER DATABASE [Fit4Love] SET QUERY_STORE = ON
GO
ALTER DATABASE [Fit4Love] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Fit4Love]
GO
/****** Object:  Table [dbo].[Formulario]    Script Date: 16/11/2023 10:37:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Formulario](
	[idPregunta] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[tipoPregunta] [nvarchar](25) NULL,
	[pregunta] [nvarchar](200) NULL,
 CONSTRAINT [PK_Formulario] PRIMARY KEY CLUSTERED 
(
	[idPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatchPerfiles]    Script Date: 16/11/2023 10:37:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchPerfiles](
	[idMatch] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[idUsuarioUno] [numeric](18, 0) NOT NULL,
	[idUsuarioDos] [numeric](18, 0) NOT NULL,
	[compatibilidad] [int] NULL,
 CONSTRAINT [PK_MatchPerfiles] PRIMARY KEY CLUSTERED 
(
	[idMatch] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pasatiempo]    Script Date: 16/11/2023 10:37:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pasatiempo](
	[idPasatiempo] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[idUsuario] [numeric](18, 0) NOT NULL,
	[pasatiempo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Pasatiempo] PRIMARY KEY CLUSTERED 
(
	[idPasatiempo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 16/11/2023 10:37:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfil](
	[idPerfil] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[idUsuario] [numeric](18, 0) NOT NULL,
	[signoZodiacal] [nvarchar](20) NULL,
	[fotoPerfil] [varbinary](max) NULL,
	[descripcion] [nvarchar](256) NULL,
	[deporte] [nvarchar](50) NULL,
	[mascotas] [nvarchar](50) NULL,
	[hijos] [int] NULL,
	[tipoRelacion] [nvarchar](50) NULL,
	[idPasatiempo] [numeric](18, 0) NULL,
	[religion] [nvarchar](50) NULL,
	[escolaridad] [nvarchar](20) NULL,
	[estadoCivil] [nvarchar](20) NULL,
	[nombre] [nvarchar](50) NULL,
	[orientacion] [nvarchar](20) NULL,
	[edad] [int] NULL,
	[genero] [char](1) NULL,
	[ocupacion] [nvarchar](30) NULL,
 CONSTRAINT [PK_Perfil] PRIMARY KEY CLUSTERED 
(
	[idPerfil] ASC,
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RespuestaFormulario]    Script Date: 16/11/2023 10:37:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RespuestaFormulario](
	[idRespuestaFormulario] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[idUsuario] [numeric](18, 0) NOT NULL,
	[idPregunta] [numeric](18, 0) NOT NULL,
	[respuesta] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_RespuestaFormulario] PRIMARY KEY CLUSTERED 
(
	[idRespuestaFormulario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 16/11/2023 10:37:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[nombreUsuario] [nvarchar](50) NOT NULL,
	[password] [varchar](64) NOT NULL,
	[fechaRegistro] [date] NOT NULL,
	[numeroTelefono] [varchar](10) NOT NULL,
	[region] [nvarchar](60) NOT NULL,
	[rangoEdades] [varchar](5) NULL,
	[radioKm] [int] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Formulario] ON 

INSERT [dbo].[Formulario] ([idPregunta], [tipoPregunta], [pregunta]) VALUES (CAST(1 AS Numeric(18, 0)), N'Abierta', N'¿Qué opinas del feminismo?')
INSERT [dbo].[Formulario] ([idPregunta], [tipoPregunta], [pregunta]) VALUES (CAST(2 AS Numeric(18, 0)), N'Abierta', N'¿Qué opinas sobre dar nombres de humanos a las mascotas?')
INSERT [dbo].[Formulario] ([idPregunta], [tipoPregunta], [pregunta]) VALUES (CAST(3 AS Numeric(18, 0)), N'Abierta', N'¿Qué opinas sobre el calentamiento global?')
SET IDENTITY_INSERT [dbo].[Formulario] OFF
GO
SET IDENTITY_INSERT [dbo].[MatchPerfiles] ON 

INSERT [dbo].[MatchPerfiles] ([idMatch], [idUsuarioUno], [idUsuarioDos], [compatibilidad]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), 100)
SET IDENTITY_INSERT [dbo].[MatchPerfiles] OFF
GO
SET IDENTITY_INSERT [dbo].[Pasatiempo] ON 

INSERT [dbo].[Pasatiempo] ([idPasatiempo], [idUsuario], [pasatiempo]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'Programar')
INSERT [dbo].[Pasatiempo] ([idPasatiempo], [idUsuario], [pasatiempo]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'Leer un buen libro')
SET IDENTITY_INSERT [dbo].[Pasatiempo] OFF
GO
SET IDENTITY_INSERT [dbo].[Perfil] ON 

INSERT [dbo].[Perfil] ([idPerfil], [idUsuario], [signoZodiacal], [fotoPerfil], [descripcion], [deporte], [mascotas], [hijos], [tipoRelacion], [idPasatiempo], [religion], [escolaridad], [estadoCivil], [nombre], [orientacion], [edad], [genero], [ocupacion]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'Sagitario', NULL, N'Agradable, gracioso, inteligente y feliz', N'Aggressive roller', N'Perro', 0, N'Formal y seria', CAST(1 AS Numeric(18, 0)), NULL, N'Esclavizado en CUCEI', N'Soltero', N'Oscar Encarnacion', N'Heterosexual', 27, N'1', N'Estudiante')
INSERT [dbo].[Perfil] ([idPerfil], [idUsuario], [signoZodiacal], [fotoPerfil], [descripcion], [deporte], [mascotas], [hijos], [tipoRelacion], [idPasatiempo], [religion], [escolaridad], [estadoCivil], [nombre], [orientacion], [edad], [genero], [ocupacion]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'Escorpio', NULL, N'Hermosa, diosa griega y perfecta', N'Enamorar mortales', N'Gato', 0, N'Formal y seria', CAST(2 AS Numeric(18, 0)), NULL, NULL, N'Soltera', N'Emma Stone', N'Heterosexual', 35, N'2', N'Actriz')
SET IDENTITY_INSERT [dbo].[Perfil] OFF
GO
SET IDENTITY_INSERT [dbo].[RespuestaFormulario] ON 

INSERT [dbo].[RespuestaFormulario] ([idRespuestaFormulario], [idUsuario], [idPregunta], [respuesta]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), N'Esta muy mal y debemos de hacer algo para frenarlo')
INSERT [dbo].[RespuestaFormulario] ([idRespuestaFormulario], [idUsuario], [idPregunta], [respuesta]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'Increible caray')
SET IDENTITY_INSERT [dbo].[RespuestaFormulario] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([idUsuario], [nombreUsuario], [password], [fechaRegistro], [numeroTelefono], [region], [rangoEdades], [radioKm]) VALUES (CAST(1 AS Numeric(18, 0)), N'Alex Er', N'12345', CAST(N'2023-11-16' AS Date), N'3318048340', N'Guadalajara, Jalisco, Mexico', N'25-45', 10)
INSERT [dbo].[Usuario] ([idUsuario], [nombreUsuario], [password], [fechaRegistro], [numeroTelefono], [region], [rangoEdades], [radioKm]) VALUES (CAST(2 AS Numeric(18, 0)), N'Emma Stone', N'54321', CAST(N'2023-11-16' AS Date), N'3304188340', N'Scottsdale, Arizona, Estados Unidos', N'25-35', 3000)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UN_nombreUsuario_Usuario]    Script Date: 16/11/2023 10:37:28 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UN_nombreUsuario_Usuario] ON [dbo].[Usuario]
(
	[nombreUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UN_numeroTelefono_Usuario]    Script Date: 16/11/2023 10:37:28 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UN_numeroTelefono_Usuario] ON [dbo].[Usuario]
(
	[numeroTelefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MatchPerfiles]  WITH CHECK ADD  CONSTRAINT [FK_MatchPerfiles_UsuarioDos] FOREIGN KEY([idUsuarioDos])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[MatchPerfiles] CHECK CONSTRAINT [FK_MatchPerfiles_UsuarioDos]
GO
ALTER TABLE [dbo].[MatchPerfiles]  WITH CHECK ADD  CONSTRAINT [FK_MatchPerfiles_UsuarioUno] FOREIGN KEY([idUsuarioUno])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[MatchPerfiles] CHECK CONSTRAINT [FK_MatchPerfiles_UsuarioUno]
GO
ALTER TABLE [dbo].[Pasatiempo]  WITH CHECK ADD  CONSTRAINT [FK_Pasatiempo_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Pasatiempo] CHECK CONSTRAINT [FK_Pasatiempo_Usuario]
GO
ALTER TABLE [dbo].[Perfil]  WITH CHECK ADD  CONSTRAINT [FK_Perfil_Pasatiempo] FOREIGN KEY([idPasatiempo])
REFERENCES [dbo].[Pasatiempo] ([idPasatiempo])
GO
ALTER TABLE [dbo].[Perfil] CHECK CONSTRAINT [FK_Perfil_Pasatiempo]
GO
ALTER TABLE [dbo].[Perfil]  WITH CHECK ADD  CONSTRAINT [FK_Perfil_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Perfil] CHECK CONSTRAINT [FK_Perfil_Usuario]
GO
ALTER TABLE [dbo].[RespuestaFormulario]  WITH CHECK ADD  CONSTRAINT [FK_RespuestaFormulario_Formulario] FOREIGN KEY([idPregunta])
REFERENCES [dbo].[Formulario] ([idPregunta])
GO
ALTER TABLE [dbo].[RespuestaFormulario] CHECK CONSTRAINT [FK_RespuestaFormulario_Formulario]
GO
ALTER TABLE [dbo].[RespuestaFormulario]  WITH CHECK ADD  CONSTRAINT [FK_RespuestaFormulario_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[RespuestaFormulario] CHECK CONSTRAINT [FK_RespuestaFormulario_Usuario]
GO
USE [master]
GO
ALTER DATABASE [Fit4Love] SET  READ_WRITE 
GO
