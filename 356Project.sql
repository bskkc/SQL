USE master
GO
USE stereoHeart
GO
INSERT INTO TblArtist (artistID,artistName,country,style) VALUES (1,'Dua Lipa','England','Pop');
INSERT INTO TblArtist (artistID,artistName,country,style) VALUES (2,'Tarkan','Turkey','Pop');
INSERT INTO TblArtist (artistID,artistName,country,style) VALUES (3,'Maroon 5','America','Rock-Pop');
INSERT INTO TblArtist (artistID,artistName,country,style) VALUES (4,'Bon Jovi','America','Rock');
INSERT INTO TblArtist (artistID,artistName,country,style) VALUES (5,'Enrique Iglesias','Spain','Pop');
INSERT INTO TblArtist (artistID,artistName,country,style) VALUES (6,'Rihanna','Barbados','Pop-R&B');
INSERT INTO TblArtist (artistID,artistName,country,style) VALUES (7,'Shakira','Colombia','Latin Pop');
INSERT INTO TblArtist (artistID,artistName,country,style) VALUES (8,'Metallica','America','Rock');
INSERT INTO TblArtist (artistID,artistName,country,style) VALUES (9,'Muse','England','Rock');
INSERT INTO TblArtist (artistID,artistName,country,style) VALUES (10,'Ezhel','Turkey','Rap');
Select *From TblArtist;


INSERT INTO TblAlbum (albumID,AlbumTitle,artistID,artistName,year) VALUES (1,'Dua Lipa:Complete Edition',1,'Dua Lipa','2018');
INSERT INTO TblAlbum (albumID,AlbumTitle,artistID,artistName,year) VALUES (2,'Karma',2,'Tarkan','2001');
INSERT INTO TblAlbum (albumID,AlbumTitle,artistID,artistName,year) VALUES (3,'V',3,'Maroon 5','2014');
INSERT INTO TblAlbum (albumID,AlbumTitle,artistID,artistName,year) VALUES (4,'Crush',4,'Bon Jovi','2000');
INSERT INTO TblAlbum (albumID,AlbumTitle,artistID,artistName,year) VALUES (5,'Insomniac',5,'Enrique Iglesias','2007');
INSERT INTO TblAlbum (albumID,AlbumTitle,artistID,artistName,year) VALUES (6,'Loud',6,'Rihanna','2010');
INSERT INTO TblAlbum (albumID,AlbumTitle,artistID,artistName,year) VALUES (7,'Laundry Service',7,'Shakira','2001');
INSERT INTO TblAlbum (albumID,AlbumTitle,artistID,artistName,year) VALUES (8,'Master of Puppets',8,'Metallica','1986');
INSERT INTO TblAlbum (albumID,AlbumTitle,artistID,artistName,year) VALUES (9,'Drones',9,'Muse','2015');
INSERT INTO TblAlbum (albumID,AlbumTitle,artistID,artistName,year) VALUES (10,'Müptezhel',10,'Ezhel','2017');
Select *From TblAlbum;


Select *From TblTrack;


INSERT INTO TblUser (userID,userName,country,phone,email,address,postaCode) VALUES (1,'Basak','Turkey','4450125','basak@gmail.com','Cankaya,Ankara','06');
INSERT INTO TblUser (userID,userName,country,phone,email,address,postaCode) VALUES (60,'Umut','Turkey','564826','umut@gmail.com','Cankaya,Ankara','06');
INSERT INTO TblUser (userID,userName,country,phone,email,address,postaCode) VALUES (98,'Jack','America','9526848','jack@gmail.com','Brooklyn,NY','99');
INSERT INTO TblUser (userID,userName,country,phone,email,address,postaCode) VALUES (79,'Dexter','America','915956','dexter@gmail.com','Miami,Florida','45');
INSERT INTO TblUser (userID,userName,country,phone,email,address,postaCode) VALUES (52,'Debra','America','89525','debra@gmail.com','Miami,Florida','45');
Select *From TblUser;


INSERT INTO TblPlaylist (playlistID,playlistName,userID) VALUES (35,'My Playlist',1);
INSERT INTO TblPlaylist (playlistID,playlistName,userID) VALUES (92,'For Road',60);
INSERT INTO TblPlaylist (playlistID,playlistName,userID) VALUES (9,'Best',98);
INSERT INTO TblPlaylist (playlistID,playlistName,userID) VALUES (75,'Playlist 1',79);
INSERT INTO TblPlaylist (playlistID,playlistName,userID) VALUES (52,'Favorites',52);
Select *From TblPlaylist;


-- Find all albums belonging to an artist given his/her name
SELECT albumTitle
FROM TblAlbum
WHERE artistName='Enrique Iglesias';


--Given the name of a song, find the album name and the artist
SELECT albumTitle,
       artistName
FROM TblAlbum
WHERE albumId IN (SELECT albumId
    FROM TblTrack
    WHERE trackName = 'Maps');


--Add an attribute to the song table named genre. Update the values of all records giving meaningful genre attribute values to songs
UPDATE TblTrack
SET trackName = 'Dont Start Now'
WHERE trackID = 25;
SELECT *FROM TblTrack;


--Find all songs having a given genre type. Print the song name, album name, and artist’s name
SELECT trackName
FROM TblTrack
WHERE style = 'Rock';
