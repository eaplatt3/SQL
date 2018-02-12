CREATE TABLE SONG(           
	 SongID        Int   		NOT NULL IDENTITY (1,1),
	 SongName      VarChar(50)  NOT NULL,
	 SongTime      Time         NOT NULL,
	 ArtistID      Int          NOT NULL,
	 BandID        Int          NOT NULL,
	 GenreID       Int          NOT NULL,
	 CONSTRAINT      SONG_PK PRIMARY KEY (SongID),
	 CONSTRAINT      SONG_ARTIST_FK FOREIGN KEY (ArtistID)
						REFERENCES ARTIST(ArtistID),
	 CONSTRAINT      SONG_BAND_FK FOREIGN KEY (BandID)
						REFERENCES BAND(BandID),
	 CONSTRAINT      SONG_GENRE_FK FOREIGN KEY (GenreID)
						REFERENCES GENRE(GenreID),
);

CREATE TABLE ALBUM(
	 AlbumID        Int           NOT NULL IDENTITY (1,1),
	 AlbumName      VarChar(50)   NOT NULL,
	 ArtistID       Int           NOT NULL,
	 BandID         Int           NOT NULL,
	 CONSTRAINT      ALBUM_PK PRIMARY KEY (AlbumID),
	 CONSTRAINT      ALBUM_ARTIST_FK FOREIGN KEY (ArtistID)  
						REFERENCES ARTIST(ArtistID),
	 CONSTRAINT      ALBUM_BAND_FK FOREIGN KEY (BandID)
						REFERENCES BAND(BandID), 
);

CREATE TABLE ALBUMSONG(
     AlbumID			Int 	  NOT NULL,
	 SongID             Int       NOT NULL,
	 CONSTRAINT     A_S_PK PRIMARY KEY (AlbumID,SongID),
	 CONSTRAINT		A_S_ALBUM_FK FOREIGN KEY(AlbumID)
						REFERENCES ALBUM(AlbumID),
	 CONSTRAINT		A_S_SONG_FK FOREIGN KEY(SongID)
						REFERENCES SONG(SongID),
);

CREATE TABLE RECORDCOMPANY(
	 RecordCompanyID        Int    		 NOT NULL IDENTITY (1,1),
	 RecordCompName			VarChar(50)  NOT NULL,
	 AlbumID                Int          NOT NULL,
	 SongID					Int          NOT NULL,
	 CONSTRAINT     RECORDCOMPANY_PK PRIMARY KEY (RecordCompanyID),
	 CONSTRAINT		RECORDCOMPANY_ALBUM_FK FOREIGN KEY(AlbumID)
						REFERENCES ALBUM(AlbumID),
	 CONSTRAINT		RECORDCOMPANY_SONG_FK FOREIGN KEY(SongID)
						REFERENCES SONG(SongID),
);
