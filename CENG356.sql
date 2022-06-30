--Basak Cavusdag 201711014
USE master
GO
IF	NOT EXISTS (
		SELECT [name]
			FROM sys.databases
			WHERE [name] = N'CENG356'
			)
CREATE DATABASE CENG356
GO

USE CENG356
IF OBJECT_ID ('[dbo].[Artist]','U') IS NOT NULL
DROP TABLE [dbo].[Artist]
GO
CREATE TABLE [dbo].[Artist]
(
	[ArtistId] INT NOT NULL PRIMARY KEY,
	[ArtistName] NVARCHAR(50) NOT NULL,
);
GO

USE CENG356
IF OBJECT_ID ('[dbo].[Song]','U') IS NOT NULL
DROP TABLE [dbo].[Song]
GO
CREATE TABLE [dbo].[Song]
(
	[SongId] INT NOT NULL PRIMARY KEY,
	[SongName] NVARCHAR(50) NOT NULL,
	[duration] FLOAT NOT NULL,
	[AlbumID] INT NOT NULL,
	[AlbumName] NVARCHAR(50) NOT NULL,
	[ArtistName] NVARCHAR(50) NOT NULL,
	[Style] NVARCHAR(25) NOT NULL,
);
GO

USE CENG356
IF OBJECT_ID ('[dbo].[Album]','U') IS NOT NULL
DROP TABLE [dbo].[Album]
GO
CREATE TABLE [dbo].[Album]
(
	[AlbumId] INT NOT NULL PRIMARY KEY,
	[AlbumName] NVARCHAR(50) NOT NULL,
	[ArtistID] INT NOT NULL,
	[ArtistName] NVARCHAR(50) NOT NULL,
	[year] INT NOT NULL,
);
GO


--Write necessary SQL commands to add a few records to each table
INSERT INTO Artist (ArtistId,ArtistName) VALUES (12,'Dua Lipa');
INSERT INTO Artist (ArtistId,ArtistName) VALUES (15,'Tarkan');
INSERT INTO Artist (ArtistId,ArtistName) VALUES (45,'Maroon 5');
INSERT INTO Artist (ArtistId,ArtistName) VALUES (2,'Bon Jovi');
INSERT INTO Album (AlbumId,AlbumName,ArtistID,ArtistName,year) VALUES (3,'Dua Lipa:Complete Edition',12,'Dua Lipa','2018');
INSERT INTO Album (AlbumId,AlbumName,ArtistID,ArtistName,year) VALUES (4,'Karma',15,'Tarkan','2001');
INSERT INTO Album (AlbumId,AlbumName,ArtistID,ArtistName,year) VALUES (5,'V',45,'Maroon 5','2014');
INSERT INTO Album (AlbumId,AlbumName,ArtistID,ArtistName,year) VALUES (6,'Crush',2,'Bon Jovi','2000');
INSERT INTO Song (SongId,SongName,duration,AlbumID,AlbumName,ArtistName,Style) VALUES (25,'New Rules',3.16,3,'Dua Lipa:Complete Edition','Dua Lipa','Pop');
INSERT INTO Song (SongId,SongName,duration,AlbumID,AlbumName,ArtistName,Style) VALUES (38,'Kuzu Kuzu',3.03,4,'Karma','Tarkan','Pop');
INSERT INTO Song (SongId,SongName,duration,AlbumID,AlbumName,ArtistName,Style) VALUES (56,'Sen Baskasýn',2.59,4,'Karma','Tarkan','Pop');
INSERT INTO Song (SongId,SongName,duration,AlbumID,AlbumName,ArtistName,Style) VALUES (13,'Maps',3.50,5,'V','Maroon 5','Pop');
INSERT INTO Song (SongId,SongName,duration,AlbumID,AlbumName,ArtistName,Style) VALUES (28,'Animals',3.60,5,'V','Maroon 5','Pop');
INSERT INTO Song (SongId,SongName,duration,AlbumID,AlbumName,ArtistName,Style) VALUES (8,'Its My Life',2.45,5,'Crush','Bon Jovi','Rock');
SELECT *FROM Artist;
SELECT *FROM Album;
SELECT *FROM Song;


-- Find all albums belonging to an artist given his/her name
SELECT AlbumName
FROM Album
WHERE ArtistName='Dua Lipa';


--Given the name of a song, find the album name and the artist
SELECT AlbumName,
       ArtistName
FROM Album
WHERE AlbumId IN (SELECT AlbumId
    FROM Song
    WHERE SongName = 'Maps');


--Find out how many songs have been included in an album given the album name
SELECT SongName
FROM Song
WHERE AlbumName='V'


--Find out the total number of songs of an artist given his/her name
SELECT SongName
FROM Song
WHERE ArtistName='Tarkan'


--Add an attribute to the song table named genre. Update the values of all records giving meaningful genre attribute values to songs
UPDATE Song
SET SongName = 'Be the One'
WHERE SongId = 25;
SELECT *FROM Song;


--Find all songs having a given genre type. Print the song name, album name, and artist’s name
SELECT SongName,
	   AlbumName,
       ArtistName
FROM Song
WHERE Style = 'Rock';


--Delete an album given its name
DELETE FROM Album WHERE AlbumName='Crush';
SELECT *FROM Album;


--Delete an artist and all his/her albums
DELETE FROM Artist WHERE ArtistName='Tarkan';
DELETE FROM Album WHERE ArtistName='Tarkan';
DELETE FROM Song WHERE ArtistName='Tarkan';
SELECT *FROM Artist;
SELECT *FROM Album;
SELECT *FROM Song;