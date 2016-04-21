/*
		Internal system procedure with Tot_RecreateAllVarTables

		Yakovlev P.V.   21.04.2016  - created this procedure

*/

USE [TotDB]
GO
IF OBJECT_ID('dbo.Tot_RecreateAllVarTables', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[Tot_RecreateAllVarTables]
GO 
CREATE PROCEDURE [dbo].[Tot_RecreateAllVarTables] 
AS 
BEGIN

	DROP TABLE [dbo].[Tot_var1]
	CREATE TABLE [dbo].[Tot_var1]
		(
		  [id] [INT] IDENTITY(1, 1)
					 NOT NULL ,
		  [n] [NVARCHAR](10) NULL ,
		  [tirag] [INT] NULL
		)
	ON  [PRIMARY]


	DROP TABLE [dbo].[Tot_var2]

	CREATE TABLE [dbo].[Tot_var2]
		(
		  [id] [INT] IDENTITY(1, 1)
					 NOT NULL ,
		  [n] [NVARCHAR](10) NULL ,
		  [tirag] [INT] NULL
		)
	ON  [PRIMARY]

	DROP TABLE [dbo].[Tot_var3]
	CREATE TABLE [dbo].[Tot_var3]
		(
		  [id] [INT] IDENTITY(1, 1)
					 NOT NULL ,
		  [n] [NVARCHAR](10) NULL ,
		  [tirag] [INT] NULL
		)
	ON  [PRIMARY];
	DROP TABLE [dbo].[Tot_var4]

	CREATE TABLE [dbo].[Tot_var4]
		(
		  [id] [INT] IDENTITY(1, 1)
					 NOT NULL ,
		  [n] [NVARCHAR](10) NULL ,
		  [tirag] [INT] NULL
		)
	ON  [PRIMARY];

	DROP TABLE [dbo].[Tot_var5]
	CREATE TABLE [dbo].[Tot_var5]
		(
		  [id] [INT] IDENTITY(1, 1)
					 NOT NULL ,
		  [n] [NVARCHAR](10) NULL ,
		  [tirag] [INT] NULL
		)
	ON  [PRIMARY];


	DROP TABLE [dbo].[Tot_var6];
	CREATE TABLE [dbo].[Tot_var6]
		(
		  [id] [INT] IDENTITY(1, 1)
					 NOT NULL ,
		  [n] [NVARCHAR](10) NULL ,
		  [tirag] [INT] NULL
		)
	ON  [PRIMARY];

	DROP TABLE [dbo].[Tot_var7];
	CREATE TABLE [dbo].[Tot_var7]
		(
		  [id] [INT] IDENTITY(1, 1)
					 NOT NULL ,
		  [n] [NVARCHAR](10) NULL ,
		  [tirag] [INT] NULL
		)
	ON  [PRIMARY];

	DROP TABLE [dbo].[Tot_var8];
	CREATE TABLE [dbo].[Tot_var8]
		(
		  [id] [INT] IDENTITY(1, 1)
					 NOT NULL ,
		  [n] [NVARCHAR](10) NULL ,
		  [tirag] [INT] NULL
		)
	ON  [PRIMARY];

END
GO