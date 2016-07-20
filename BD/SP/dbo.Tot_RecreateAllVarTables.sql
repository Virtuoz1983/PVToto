/*
		Internal system procedure with Tot_RecreateAllVarTables

		Yakovlev P.V.   21.04.2016  - created this procedure
		Yakovlev P.V.    10.05.2016 - added 
		Tereschenko V.a. 13.05.2016 - changed for using global temporary tables
		Yakovlev P.V.    20.07.2016 - delete using global temporary tables
*/

USE [TotDB]
GO
IF OBJECT_ID('dbo.Tot_RecreateAllVarTables', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[Tot_RecreateAllVarTables]
GO 
CREATE PROCEDURE [dbo].[Tot_RecreateAllVarTables] 
AS 
BEGIN

	IF OBJECT_ID ('[dbo].[Tot_var1]', 'U')
		IS NOT NULL
		TRUNCATE TABLE [dbo].[Tot_var1]
	ELSE
		BEGIN  
			CREATE TABLE [dbo].[Tot_var1]
				(
				  [id] [INT] IDENTITY(1, 1)
							 NOT NULL ,
				  [n] [NVARCHAR](10) NULL ,
				  [tirag] [INT] NULL
				)
				ON  [PRIMARY]
		END

	IF OBJECT_ID ('[dbo].[Tot_var2]', 'U')
		IS NOT NULL
		TRUNCATE TABLE [dbo].[Tot_var2]
	ELSE
		BEGIN  
			CREATE TABLE [dbo].[Tot_var2]
				(
				  [id] [INT] IDENTITY(1, 1)
							 NOT NULL ,
				  [n] [NVARCHAR](10) NULL ,
				  [tirag] [INT] NULL
				)
				ON  [PRIMARY]
		END
	
	IF OBJECT_ID ('[dbo].[Tot_var3]', 'U')
		IS NOT NULL
		TRUNCATE TABLE [dbo].[Tot_var3]
	ELSE
		BEGIN  
			CREATE TABLE [dbo].[Tot_var3]
				(
				  [id] [INT] IDENTITY(1, 1)
							 NOT NULL ,
				  [n] [NVARCHAR](10) NULL ,
				  [tirag] [INT] NULL
				)
				ON  [PRIMARY]
		END
	
	IF OBJECT_ID ('[dbo].[Tot_var4]', 'U')
		IS NOT NULL
		TRUNCATE TABLE [dbo].[Tot_var4]
	ELSE
		BEGIN  
			CREATE TABLE [dbo].[Tot_var4]
				(
				  [id] [INT] IDENTITY(1, 1)
							 NOT NULL ,
				  [n] [NVARCHAR](10) NULL ,
				  [tirag] [INT] NULL
				)
				ON  [PRIMARY]
		END
	
	IF OBJECT_ID ('[dbo].[Tot_var5]', 'U')
		IS NOT NULL
		TRUNCATE TABLE [dbo].[Tot_var5]
	ELSE
		BEGIN  
			CREATE TABLE [dbo].[Tot_var5]
				(
				  [id] [INT] IDENTITY(1, 1)
							 NOT NULL ,
				  [n] [NVARCHAR](10) NULL ,
				  [tirag] [INT] NULL
				)
				ON  [PRIMARY]
		END
	
	IF OBJECT_ID ('[dbo].[Tot_var6]', 'U')
		IS NOT NULL
		TRUNCATE TABLE [dbo].[Tot_var6]
	ELSE
		BEGIN  
			CREATE TABLE [dbo].[Tot_var6]
				(
				  [id] [INT] IDENTITY(1, 1)
							 NOT NULL ,
				  [n] [NVARCHAR](10) NULL ,
				  [tirag] [INT] NULL
				)
				ON  [PRIMARY]
		END
	
	IF OBJECT_ID ('[dbo].[Tot_var7]', 'U')
		IS NOT NULL
		TRUNCATE TABLE [dbo].[Tot_var7]
	ELSE
		BEGIN  
			CREATE TABLE [dbo].[Tot_var7]
				(
				  [id] [INT] IDENTITY(1, 1)
							 NOT NULL ,
				  [n] [NVARCHAR](10) NULL ,
				  [tirag] [INT] NULL
				)
				ON  [PRIMARY]
		END
	
	IF OBJECT_ID ('[dbo].[Tot_var8]', 'U')
		IS NOT NULL
		TRUNCATE TABLE [dbo].[Tot_var8]
	ELSE
		BEGIN  
			CREATE TABLE [dbo].[Tot_var8]
				(
				  [id] [INT] IDENTITY(1, 1)
							 NOT NULL ,
				  [n] [NVARCHAR](10) NULL ,
				  [tirag] [INT] NULL
				)
				ON  [PRIMARY]
		END
	
	END
GO