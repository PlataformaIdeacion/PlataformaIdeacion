USE [master]
GO
/****** Object:  Database [PlataformaIdeacion]    Script Date: 2/05/2016 9:45:28 p. m. ******/
CREATE DATABASE [PlataformaIdeacion]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PlataformaIdeacion', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PlataformaIdeacion.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PlataformaIdeacion_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PlataformaIdeacion_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PlataformaIdeacion] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PlataformaIdeacion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PlataformaIdeacion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PlataformaIdeacion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PlataformaIdeacion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PlataformaIdeacion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PlataformaIdeacion] SET ARITHABORT OFF 
GO
ALTER DATABASE [PlataformaIdeacion] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PlataformaIdeacion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PlataformaIdeacion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PlataformaIdeacion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PlataformaIdeacion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PlataformaIdeacion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PlataformaIdeacion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PlataformaIdeacion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PlataformaIdeacion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PlataformaIdeacion] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PlataformaIdeacion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PlataformaIdeacion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PlataformaIdeacion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PlataformaIdeacion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PlataformaIdeacion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PlataformaIdeacion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PlataformaIdeacion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PlataformaIdeacion] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PlataformaIdeacion] SET  MULTI_USER 
GO
ALTER DATABASE [PlataformaIdeacion] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PlataformaIdeacion] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PlataformaIdeacion] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PlataformaIdeacion] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PlataformaIdeacion] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PlataformaIdeacion]
GO
/****** Object:  Table [dbo].[Area_Del_Conocimiento]    Script Date: 2/05/2016 9:45:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area_Del_Conocimiento](
	[id_Area_Del_Conocimiento] [int] NOT NULL,
	[nombre_Area] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_idArea] PRIMARY KEY CLUSTERED 
(
	[id_Area_Del_Conocimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Autores]    Script Date: 2/05/2016 9:45:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autores](
	[Id_Autor] [nvarchar](50) NOT NULL,
	[Id_Idea] [int] NOT NULL,
 CONSTRAINT [PK_Autores] PRIMARY KEY CLUSTERED 
(
	[Id_Autor] ASC,
	[Id_Idea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Calificacion]    Script Date: 2/05/2016 9:45:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calificacion](
	[id_Idea] [int] NOT NULL,
	[id_Usuario] [nvarchar](50) NOT NULL,
	[calificacion] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_Calificacion] PRIMARY KEY CLUSTERED 
(
	[id_Idea] ASC,
	[id_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 2/05/2016 9:45:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentario](
	[id_Idea] [int] NOT NULL,
	[id_Usuario] [nvarchar](50) NOT NULL,
	[id_Comentario] [bigint] NOT NULL,
	[comentario] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Comentario_1] PRIMARY KEY CLUSTERED 
(
	[id_Comentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Idea]    Script Date: 2/05/2016 9:45:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Idea](
	[id_Idea] [int] NOT NULL,
	[hora_Publicacion] [date] NOT NULL,
	[fecha_Publicacion] [date] NOT NULL,
	[titulo] [varchar](250) NOT NULL,
	[resumen] [varchar](250) NOT NULL,
	[id_Usuario] [nvarchar](50) NOT NULL,
	[publicacion] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_idIdea] PRIMARY KEY CLUSTERED 
(
	[id_Idea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Idea_Area]    Script Date: 2/05/2016 9:45:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Idea_Area](
	[id_Idea] [int] NOT NULL,
	[id_Area_Del_Conocimiento] [int] NOT NULL,
 CONSTRAINT [PK_Idea_Area] PRIMARY KEY CLUSTERED 
(
	[id_Idea] ASC,
	[id_Area_Del_Conocimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Identificaciones_Validas]    Script Date: 2/05/2016 9:45:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Identificaciones_Validas](
	[id_Valida] [nvarchar](50) NOT NULL,
	[invitado_Por] [nvarchar](50) NULL,
 CONSTRAINT [PK_Identificaciones_Validas_1] PRIMARY KEY CLUSTERED 
(
	[id_Valida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Persona]    Script Date: 2/05/2016 9:45:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[id_Persona] [nvarchar](50) NOT NULL,
	[telefono] [nvarchar](50) NOT NULL,
	[correo] [nvarchar](50) NOT NULL,
	[nombre_Usuario] [nvarchar](50) NOT NULL,
	[tipo_De_Usuario] [nvarchar](50) NOT NULL,
	[carrera] [nvarchar](50) NULL,
	[diploma] [image] NULL,
	[titulos] [nvarchar](50) NULL,
	[expediente_Laboral] [image] NULL,
	[informacion_Personal] [nvarchar](50) NULL,
 CONSTRAINT [PK_Persona_1] PRIMARY KEY CLUSTERED 
(
	[id_Persona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 2/05/2016 9:45:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id_Usuario] [nvarchar](50) NOT NULL,
	[Contraseña] [nvarchar](16) NOT NULL,
	[Id_Persona] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_id_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Autores]  WITH CHECK ADD  CONSTRAINT [FK_Autores_Idea] FOREIGN KEY([Id_Idea])
REFERENCES [dbo].[Idea] ([id_Idea])
GO
ALTER TABLE [dbo].[Autores] CHECK CONSTRAINT [FK_Autores_Idea]
GO
ALTER TABLE [dbo].[Autores]  WITH CHECK ADD  CONSTRAINT [FK_Autores_Usuario] FOREIGN KEY([Id_Autor])
REFERENCES [dbo].[Usuario] ([Id_Usuario])
GO
ALTER TABLE [dbo].[Autores] CHECK CONSTRAINT [FK_Autores_Usuario]
GO
ALTER TABLE [dbo].[Calificacion]  WITH CHECK ADD  CONSTRAINT [FK_id_idea_Calificacion] FOREIGN KEY([id_Idea])
REFERENCES [dbo].[Idea] ([id_Idea])
GO
ALTER TABLE [dbo].[Calificacion] CHECK CONSTRAINT [FK_id_idea_Calificacion]
GO
ALTER TABLE [dbo].[Calificacion]  WITH CHECK ADD  CONSTRAINT [FK_id_Usuario_Calificacion] FOREIGN KEY([id_Usuario])
REFERENCES [dbo].[Usuario] ([Id_Usuario])
GO
ALTER TABLE [dbo].[Calificacion] CHECK CONSTRAINT [FK_id_Usuario_Calificacion]
GO
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_id_Idea_en_comentario] FOREIGN KEY([id_Idea])
REFERENCES [dbo].[Idea] ([id_Idea])
GO
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_id_Idea_en_comentario]
GO
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_id_Usuario_en_comentario] FOREIGN KEY([id_Usuario])
REFERENCES [dbo].[Usuario] ([Id_Usuario])
GO
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_id_Usuario_en_comentario]
GO
ALTER TABLE [dbo].[Idea]  WITH CHECK ADD  CONSTRAINT [FK_id_Usuario_Propietario_Idea(publicante)] FOREIGN KEY([id_Usuario])
REFERENCES [dbo].[Usuario] ([Id_Usuario])
GO
ALTER TABLE [dbo].[Idea] CHECK CONSTRAINT [FK_id_Usuario_Propietario_Idea(publicante)]
GO
ALTER TABLE [dbo].[Idea_Area]  WITH CHECK ADD  CONSTRAINT [FK_id_Area_Del_Conocimiento] FOREIGN KEY([id_Area_Del_Conocimiento])
REFERENCES [dbo].[Area_Del_Conocimiento] ([id_Area_Del_Conocimiento])
GO
ALTER TABLE [dbo].[Idea_Area] CHECK CONSTRAINT [FK_id_Area_Del_Conocimiento]
GO
ALTER TABLE [dbo].[Idea_Area]  WITH CHECK ADD  CONSTRAINT [FK_id_idea_en_idea_area] FOREIGN KEY([id_Idea])
REFERENCES [dbo].[Idea] ([id_Idea])
GO
ALTER TABLE [dbo].[Idea_Area] CHECK CONSTRAINT [FK_id_idea_en_idea_area]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Identificaciones_Validas] FOREIGN KEY([Id_Persona])
REFERENCES [dbo].[Identificaciones_Validas] ([id_Valida])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Identificaciones_Validas]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Persona] FOREIGN KEY([Id_Persona])
REFERENCES [dbo].[Persona] ([id_Persona])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Persona]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'es la relacion entre Id_Idea de Autores y Id_Idea de Idea' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Autores', @level2type=N'CONSTRAINT',@level2name=N'FK_Autores_Idea'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'es la relacio entre Id-IUsuario y Id_Autor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Autores', @level2type=N'CONSTRAINT',@level2name=N'FK_Autores_Usuario'
GO
USE [master]
GO
ALTER DATABASE [PlataformaIdeacion] SET  READ_WRITE 
GO
