USE spotify_and_youtube_data;

CREATE TABLE spotify_youtube_full (
    Artist VARCHAR(255) NOT NULL,
    Url_spotify TEXT,
    Track VARCHAR(255) NOT NULL,
    Album VARCHAR(255),
    Album_type VARCHAR(100),
    Uri VARCHAR(255),
    Danceability FLOAT,
    Energy FLOAT,
    `Key` FLOAT,
    Loudness FLOAT,
    Speechiness FLOAT,
    Acousticness FLOAT,
    Instrumentalness FLOAT,
    Liveness FLOAT,
    Valence FLOAT,
    Tempo FLOAT,
    Duration_ms BIGINT,
    Url_youtube TEXT,
    Channel TEXT,
    Views BIGINT,
    Likes BIGINT,
    Comments BIGINT,
    Licensed VARCHAR(10),
    official_video VARCHAR(10),
    Stream BIGINT
);

SELECT COUNT(*) FROM spotify_youtube_full;
SELECT * FROM spotify_youtube_full;

-- Top Artists on Spotify  
SELECT Artist, SUM(Stream) AS Total_streams
FROM spotify_youtube_full
GROUP BY Artist
ORDER BY Total_streams DESC
LIMIT 10;

-- Top Artists on Youtube
SELECT Artist, SUM(Views) AS Total_views
FROM spotify_youtube_full
GROUP BY Artist
ORDER BY Total_views DESC
LIMIT 10;

-- Top Songs on Spotify
SELECT Track, SUM(Stream) AS Total_streams
FROM spotify_youtube_full
GROUP BY Track
ORDER BY Total_streams DESC
LIMIT 10;

-- Top Songs on Youtube
SELECT Track, SUM(Views) AS Total_views
FROM spotify_youtube_full
GROUP BY Track
ORDER BY Total_views DESC
LIMIT 10;

-- Top 10 by Stream
SELECT Artist, Track, Danceability, Energy, `Key`, Loudness, Speechiness, Acousticness, Instrumentalness, Liveness, Valence, Tempo
FROM spotify_youtube_full
WHERE Track IN (
  SELECT Track FROM (
    SELECT Track
    FROM spotify_youtube_full
    GROUP BY Track
    ORDER BY SUM(Stream) DESC
	LIMIT 10 
  ) AS top_streams);
  
-- UNION DISTINCT
-- Top 10 by Views
SELECT Artist, Track, Danceability, Energy, `Key`, Loudness, Speechiness, Acousticness, Instrumentalness, Liveness, Valence, Tempo
FROM spotify_youtube_full
WHERE Track IN (
  SELECT Track FROM (
    SELECT Track
    FROM spotify_youtube_full
    GROUP BY Track
    ORDER BY SUM(Views) DESC
    LIMIT 10
  ) AS top_views
);


-- What are the durations of the top songs.
SELECT Track, Artist, Duration_mins 
FROM spotify_youtube_full
WHERE Track IN (
  SELECT Track FROM (
    SELECT Track
    FROM spotify_youtube_full
    GROUP BY Track
    ORDER BY SUM(Stream) DESC
    LIMIT 10
  ) AS top_streams
);

ALTER TABLE spotify_youtube_full
ADD COLUMN Duration_mins FLOAT;

SET SQL_SAFE_UPDATES = 0;

UPDATE spotify_youtube_full
SET Duration_mins = ROUND(((Duration_ms/1000)/60), 2);

-- Average durations of the top  songs
SELECT ROUND(AVG(Duration_mins), 2) AS average_song_duration_spotify
FROM spotify_youtube_full
WHERE Track IN (
  SELECT Track FROM (
    SELECT Track
    FROM spotify_youtube_full
    GROUP BY Track
    ORDER BY SUM(Stream) DESC
    LIMIT 50
  ) AS top_streams
);

SELECT ROUND(AVG(Duration_mins), 2) AS average_song_duration_youtube
FROM spotify_youtube_full
WHERE Track IN (
  SELECT Track FROM (
    SELECT Track
    FROM spotify_youtube_full
    GROUP BY Track
    ORDER BY SUM(Views) DESC
    LIMIT 50
  ) AS top_views
);

SET SQL_SAFE_UPDATES = 1;

-- Do listeners have a preferred type of music? (album, single, compilation)
SELECT Track, Artist, Album_type
FROM spotify_youtube_full
WHERE Track IN (
  SELECT Track FROM (
    SELECT Track
    FROM spotify_youtube_full
    GROUP BY Track
    ORDER BY SUM(Stream) DESC
    LIMIT 10
  ) AS top_streams
);

SELECT Track, 'Danceability' AS Feature, Danceability AS Value
FROM spotify_youtube_full
WHERE Track IN (
  SELECT Track
  FROM (
    SELECT Track
    FROM spotify_youtube_full
    GROUP BY Track
    ORDER BY SUM(Stream) DESC
    LIMIT 20
  ) AS top_tracks
)

UNION ALL

SELECT Track, 'Energy', Energy
FROM spotify_youtube_full
WHERE Track IN (
  SELECT Track
  FROM (
    SELECT Track
    FROM spotify_youtube_full
    GROUP BY Track
    ORDER BY SUM(Stream) DESC
    LIMIT 20
  ) AS top_tracks
)

UNION ALL

SELECT Track, 'Valence', Valence
FROM spotify_youtube_full
WHERE Track IN (
  SELECT Track
  FROM (
    SELECT Track
    FROM spotify_youtube_full
    GROUP BY Track
    ORDER BY SUM(Stream) DESC
    LIMIT 20
  ) AS top_tracks
)

UNION ALL

SELECT Track, 'Acousticness', Acousticness
FROM spotify_youtube_full
WHERE Track IN (
  SELECT Track
  FROM (
    SELECT Track
    FROM spotify_youtube_full
    GROUP BY Track
    ORDER BY SUM(Stream) DESC
    LIMIT 20
  ) AS top_tracks
)

UNION ALL

SELECT Track, 'Speechiness', Speechiness
FROM spotify_youtube_full
WHERE Track IN (
  SELECT Track
  FROM (
    SELECT Track
    FROM spotify_youtube_full
    GROUP BY Track
    ORDER BY SUM(Stream) DESC
    LIMIT 20
  ) AS top_tracks
)

UNION ALL

SELECT Track, 'Instrumentalness', Instrumentalness
FROM spotify_youtube_full
WHERE Track IN (
  SELECT Track
  FROM (
    SELECT Track
    FROM spotify_youtube_full
    GROUP BY Track
    ORDER BY SUM(Stream) DESC
    LIMIT 20
  ) AS top_tracks
)

UNION ALL

SELECT Track, 'Liveness', Liveness
FROM spotify_youtube_full
WHERE Track IN (
  SELECT Track
  FROM (
    SELECT Track
    FROM spotify_youtube_full
    GROUP BY Track
    ORDER BY SUM(Stream) DESC
    LIMIT 20
  ) AS top_tracks
);

SELECT Track, 'Danceability' AS Feature, Danceability AS Value
FROM spotify_youtube_full
WHERE Track IN (
  SELECT Track
  FROM (
    SELECT Track
    FROM spotify_youtube_full
    GROUP BY Track
    ORDER BY SUM(Views) DESC
    LIMIT 20
  ) AS top_tracks
)

UNION ALL

SELECT Track, 'Energy', Energy
FROM spotify_youtube_full
WHERE Track IN (
  SELECT Track
  FROM (
    SELECT Track
    FROM spotify_youtube_full
    GROUP BY Track
    ORDER BY SUM(Views) DESC
    LIMIT 20
  ) AS top_tracks
)

UNION ALL

SELECT Track, 'Valence', Valence
FROM spotify_youtube_full
WHERE Track IN (
  SELECT Track
  FROM (
    SELECT Track
    FROM spotify_youtube_full
    GROUP BY Track
    ORDER BY SUM(Views) DESC
    LIMIT 20
  ) AS top_tracks
)

UNION ALL

SELECT Track, 'Acousticness', Acousticness
FROM spotify_youtube_full
WHERE Track IN (
  SELECT Track
  FROM (
    SELECT Track
    FROM spotify_youtube_full
    GROUP BY Track
    ORDER BY SUM(Views) DESC
    LIMIT 20
  ) AS top_tracks
)

UNION ALL

SELECT Track, 'Speechiness', Speechiness
FROM spotify_youtube_full
WHERE Track IN (
  SELECT Track
  FROM (
    SELECT Track
    FROM spotify_youtube_full
    GROUP BY Track
    ORDER BY SUM(Views) DESC
    LIMIT 20
  ) AS top_tracks
)

UNION ALL

SELECT Track, 'Instrumentalness', Instrumentalness
FROM spotify_youtube_full
WHERE Track IN (
  SELECT Track
  FROM (
    SELECT Track
    FROM spotify_youtube_full
    GROUP BY Track
    ORDER BY SUM(Views) DESC
    LIMIT 20
  ) AS top_tracks
)

UNION ALL

SELECT Track, 'Liveness', Liveness
FROM spotify_youtube_full
WHERE Track IN (
  SELECT Track
  FROM (
    SELECT Track
    FROM spotify_youtube_full
    GROUP BY Track
    ORDER BY SUM(Views) DESC
    LIMIT 20
  ) AS top_tracks
);

-- Take the top 10 artists on YouTube and Spotify and see how the top artists perform across the platforms
SELECT Artist, SUM(Views) AS youtube_views, SUM(Stream) AS spotify_streams
FROM spotify_youtube_full
GROUP BY Artist
ORDER BY youtube_views DESC
LIMIT 10;

SELECT Artist, SUM(Stream) AS spotify_streams, SUM(Views) AS youtube_views
FROM spotify_youtube_full
GROUP BY Artist
ORDER BY spotify_streams DESC
LIMIT 10;


