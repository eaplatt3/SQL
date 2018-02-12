CREATE TABLE ARTIST(
	 ArtistID		 Int      NOT NULL IDENTITY (1,1),
	 ArtistFirstName Char(50) NOT NULL,
	 ArtistLastName  Char(50) NOT NULL,
	 CONSTRAINT		ARTIST_PK PRIMARY KEY(ArtistID), 
);

CREATE TABLE BAND(
	 BandID		   Int        NOT NULL IDENTITY (1,1),
	 BandName	   Char(50)   NOT NULL,
	 CONSTRAINT		BAND_PK PRIMARY KEY(BandID),
);

CREATE TABLE BANDARTIST(
	 ArtistID            Int  NOT NULL,
	 BandID              Int  NOT NULL, 
	 CONSTRAINT		B_A_PK PRIMARY KEY(ArtistID, BandID),
	 CONSTRAINT		B_A_ARTIST_FK FOREIGN KEY(ArtistID),
						REFERENCES ARTIST(ArtistID),
	 CONSTRAINT		B_A_BAND_FK FOREIGN KEY(BandID),
						REFERENCES BAND(BandID),
);

CREATE TABLE GENRE(
	 GenreID        Int       NOT NULL IDENTITY (1,1),
	 GenreName		Char(50)  NOT NULL,
);

CREATE TABLE SONG(           //ask about BANDARTIST in song 
	 SongID        Int   		NOT NULL IDENTITY (1,1),
	 SongName      VarChar(50)  NOT NULL,
	 SongTime      Time         NOT NULL,
	 ArtistID      Int          NOT NULL,
	 BandID        Int          NOT NULL,
	 GenreID       Int          NOT NULL,
	 CONSTRAINT      SONG_PK PRIMARY KEY (SongID),
	 CONSTRAINT      SONG_ARTIST_FK FOREIGN KEY (ArtistID),
						REFERENCES ARTIST(ArtistID),
	 CONSTRAINT      SONG_BAND_FK FOREIGN KEY (BandID),
						REFERENCES BAND(BandID),
	 CONSTRAINT      SONG_GENRE_FK FOREIGN KEY (GenreID),
						REFERENCES GENRE(GenreID),
);

CREATE TABLE ALBUM(
	 AlbumID        Int           NOT NULL IDENTITY (1,1),
	 AlbumName      VarChar(50)   NOT NULL,
	 ArtistID       Int           NOT NULL,
	 BandID         Int           NOT NULL,
	 CONSTRAINT      ALBUM_PK PRIMARY KEY (AlbumID),
	 CONSTRAINT      SONG_ARTIST_FK FOREIGN KEY (ArtistID),
						REFERENCES ARTIST(ArtistID),
	 CONSTRAINT      SONG_BAND_FK FOREIGN KEY (BandID),
						REFERENCES BAND(BandID), 
);

CREATE TABLE ALBUMSONG(
     AlbumID			Int 	  NOT NULL,
	 SongID             Int       NOT NULL,
	 CONSTRAINT     A_S_PK PRIMARY KEY (AlbumID,SongID),
	 CONSTRAINT		A_S_ALBUM_FK FOREIGN KEY(AlbumID),
						REFERENCES ALBUM(AlbumID),
	 CONSTRAINT		A_S_SONG_FK FOREIGN KEY(SongID),
						REFERENCES SONG(SongID),
);

CREATE TABLE RECORDCOMPANY(
	 RecordCompanyID        Int    		 NOT NULL IDENTITY (1,1),
	 RecordCompName			VarChar(50)  NOT NULL,
	 AlbumID                Int          NOT NULL,
	 SongID					Int          NOT NULL,
	 CONSTRAINT     RECORDCOMPANY_PK PRIMARY KEY (RecordCompanyID),
	 CONSTRAINT		RECORDCOMPANY_ALBUM_FK FOREIGN KEY(AlbumID),
						REFERENCES ALBUM(AlbumID),
	 CONSTRAINT		RECORDCOMPANY_SONG_FK FOREIGN KEY(SongID),
						REFERENCES SONG(SongID),
);

