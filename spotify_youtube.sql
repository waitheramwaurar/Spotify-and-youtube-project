CREATE DATABASE spotify_and_youtube_data;
USE spotify_and_youtube_data;

CREATE TABLE artists(
	artist_id INT PRIMARY KEY NOT NULL,
    artist_name VARCHAR(255) NOT NULL
);

INSERT INTO artists (artist_id, artist_name)
VALUES 
(0, 'Gorillaz'),
(1, 'Red Hot Chili Peppers'),
(2, '50 Cent');

CREATE TABLE albums (
	album_id INT PRIMARY KEY NOT NULL,
    album_name VARCHAR(255) NOT NULL,
    album_type VARCHAR(255),
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

INSERT INTO albums (album_id, album_name, album_type, artist_id)
VALUES
	(0, 'Demon Days', 'album', 0),
    (1, 'Plastic Beach', 'album', 0),
    (2, 'Californication (Deluxe Edition)', 'album', 1);

CREATE TABLE tracks(
	track_id INT NOT NULL PRIMARY KEY,
    track_name VARCHAR(255) NOT NULL,
    album_id INT NOT NULL,
    artist_id INT NOT NULL,
    danceability FLOAT,
    energy FLOAT,
    track_key FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    acousticness FLOAT,
	instrumentalness FLOAT,
	liveness FLOAT,
	valence FLOAT,
	tempo FLOAT,
	duration_ms INT,
    streams INT,
    FOREIGN KEY (album_id) REFERENCES albums(album_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

INSERT INTO tracks (track_id, track_name, album_id, artist_id, danceability, energy, track_key, loudness, speechiness, acousticness, instrumentalness, liveness, valence, tempo, duration_ms, streams)
VALUES
	(0, 'Feel Good Inc.', 0, 0, 0.818, 0.705, 6, -6.679, 0.177, 0.00836, 0.00233, 0.613, 0.772, 138.559, 222640, 1040234854),
    (1, 'On Melancholy Hill', 1, 0, 0.689, 0.739, 2, -5.81, 0.026, 0.0000151, 0.509, 0.064, 0.578, 120.223, 233867, 434663559),
    (2, 'Californication', 2, 1, 0.592, 0.767, 9, -2.788, 0.027, 0.0021, 0.00165, 0.127, 0.328, 96.483, 329733, 1055738398);
    
CREATE TABLE videos (
	video_id INT PRIMARY KEY NOT NULL,
    track_id INT NOT NULL,
    url_youtube VARCHAR(255),
    title VARCHAR(255),
    yt_channel VARCHAR(255),
    views INT,
    likes INT,
    comments INT,
    licensed BOOLEAN,
    official_vid BOOLEAN,
    FOREIGN KEY (track_id) REFERENCES tracks(track_id)
);

INSERT INTO videos (video_id, track_id, url_youtube, title, yt_channel, views, likes, comments, licensed, official_vid)
VALUES
	(0, 0, 'https://www.youtube.com/watch?v=HyHNuVaZJ-k', 'Gorillaz - Feel Good Inc. (Official Video)', 'Gorillaz', 693555221, 6220896, 169907, True, True),
    (1, 1, 'https://www.youtube.com/watch?v=1V_xRb0x9aw', 'Gorillaz - On Melancholy Hill (Official Video)', 'Gorillaz', 211754952, 1788577, 55229, True, True),
    (2, 2, 'https://www.youtube.com/watch?v=YlUKcNNmywk', 'Gorillaz - On Melancholy Hill (Official Video)', 'Red Hot Chili Peppers', 1018811259, 4394471, 121452, True, True);
	

