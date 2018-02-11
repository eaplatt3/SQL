select ArtistID, ArtistFirstName
from ARTIST;

SELECT *
FROM SONG
ORDER BY SongTime

SELECT RecordCompanyID, RecordCompName
FROM RECORDCOMPANY
WHERE RecordCompName LIKE '%um%';

SELECT DISTINCT ArtistFirstName, ArtistLastName, RecordCompName
FROM artist, recordcompany, album
WHERE RECORDCOMPANY.AlbumID = Album.AlbumID AND Album.ArtistID = Artist.ArtistID
GROUP BY ArtistFirstName, ArtistLastName, RecordCompName

SELECT DISTINCT ArtistFirstName, ArtistLastName, BandName
FROM ARTIST, BAND, BANDARTIST
WHERE BANDARTIST.ArtistID = ARTIST.ArtistID AND BANDARTIST.BandID = BAND.BandID
GROUP BY ArtistFirstName, ArtistLastName, BandName

SELECT BandName, SongName
FROM BAND, SONG
WHERE BAND.bandID = SONG.bandID
GROUP BY BandName, SongName 

SELECT ArtistFirstName, ArtistLastName, SongName
FROM ARTIST, SONG
WHERE ARTIST.ArtistID = SONG.ArtistID
GROUP BY ArtistFirstName, ArtistLastName, SongName 

SELECT DISTINCT SongName, GenreName
FROM SONG, GENRE
WHERE SONG.GenreID = GENRE.GenreID
GROUP BY SongName, GenreName

SELECT DISTINCT BandName, SongName, GenreName
FROM BAND, SONG, GENRE
WHERE SONG.GenreID = GENRE.GenreID AND SONG.BandID = BAND.BandID
GROUP BY BandName, SongName, GenreName

SELECT DISTINCT BandName, SongName, GenreName
FROM BAND, SONG, GENRE
WHERE SONG.GenreID = GENRE.GenreID AND SONG.BandID = BAND.BandID AND GenreName LIKE '%ALT%'
GROUP BY BandName, SongName, GenreName

SELECT DISTINCT BandName, SongName, AlbumName, GenreName
FROM BAND, SONG, GENRE, Album
WHERE SONG.GenreID = GENRE.GenreID AND SONG.BandID = BAND.BandID AND ALBUM.BandID = BAND.BandID
GROUP BY BandName, SongName, AlbumName, GenreName

SELECT DISTINCT ArtistFirstName, ArtistLastName, SongName, GenreName
FROM SONG, GENRE, ARTIST
WHERE SONG.GenreID = GENRE.GenreID AND SONG.ArtistID = ARTIST.ArtistID AND GenreName LIKE '%Co%'
GROUP BY ArtistFirstName, ArtistLastName, SongName, GenreName

SELECT DISTINCT BandName, AlbumName
FROM SONG, BAND, ALBUM
WHERE Album.BandID = SONG.BandID AND BAND.BandID = SONG.BandID
GROUP BY BandName, SongName, AlbumName

SELECT DISTINCT BandName, SongName, AlbumName, RecordCompName
FROM SONG, BAND, ALBUM, RECORDCOMPANY
WHERE BAND.BandID = SONG.BandID AND ALBUM.BandID = SONG.SongID AND ALBUM.AlbumID = RECORDCOMPANY.AlbumID 
GROUP BY BandName, SongName, AlbumName, RecordCompNames

SELECT DISTINCT AlbumName, RecordCompName 
FROM RECORDCOMPANY, ALBUM, ALBUMRECORD
WHERE ALBUM.ALbumID = RECORDCOMPANY.ALbumID AND ALBUMRECORD.AlbumID = RECORDCOMPANY.AlbumID
GROUP BY AlbumName, RecordCompName