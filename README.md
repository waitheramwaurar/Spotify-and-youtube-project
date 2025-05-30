## Introduction

Recently, YouTube has become a bit more frustrating for people who enjoy streaming music — especially with the increase in the number and frequency of ads. It now feels like you can't go two minutes without an interruption unless you're on the premium plan. Compared to Spotify, YouTube's premium pricing is a bit higher, which makes sense since YouTube is a visual platform while Spotify is mainly for audio.

## Problem Statement

Spotify has noticed that people might be shifting their listening habits due to these changes on YouTube. This has sparked an internal conversation: what if Spotify started offering more music videos on the platform? Some songs already have videos, but the majority don’t. Before jumping into full-scale video integration, Spotify would need to be sure it makes business sense — and that’s where this analysis comes in.

## Research Questions

To explore this possibility, I focused on answering a few key questions:

**1. What are the top 10 most-streamed songs and artists on Spotify, and how are they performing on YouTube?**

This gives insight into whether the most-listened to songs on Spotify also attract views on YouTube basically, is there an audience overlap?

**2. What are the top 10 most-viewed songs on YouTube, and how do they perform on Spotify?**

This tells us whether videos that are popular on YouTube have a listener base on Spotify — helpful to know if YouTube users would actually shift apps if their favorite content were to be offered on Spotify, which is lower-priced compared to YouTube.

**3. What’s the “shape” or makeup of the top songs on each platform?**

I looked at audio features like danceability, energy, valence, etc., to compare the musical profiles of top tracks on both platforms. If users enjoy similar types of songs on both apps, then Spotify wouldn’t have to tweak its algorithm too much when adding videos.

**4. What’s the average duration of the top 50 songs on both platforms?**

This helps Spotify estimate the cost of hosting videos. Longer durations mean higher hosting costs, so this comparison is key for understanding the financial implications.

## About the Data

The dataset combines information from both Spotify and YouTube as follows:

- **Track:** name of the song, as visible on the Spotify platform.
- **Artist:** name of the artist.
- **Url_spotify:** the Url of the artist.
- **Album:** the album in wich the song is contained on Spotify.
- **Album_type:** indicates if the song is relesead on Spotify as a single or contained in an album.
- **Uri:** a spotify link used to find the song through the API.
- **Danceability:** describes how suitable a track is for dancing based on a combination of musical elements including tempo, rhythm stability, beat strength, and overall regularity. A value of 0.0 is least danceable and 1.0 is most danceable.
- **Energy:** is a measure from 0.0 to 1.0 and represents a perceptual measure of intensity and activity. Typically, energetic tracks feel fast, loud, and noisy. For example, death metal has high energy, while a Bach prelude scores low on the scale. Perceptual features contributing to this attribute include dynamic range, perceived loudness, timbre, onset rate, and general entropy.
- **Key:** the key the track is in. Integers map to pitches using standard Pitch Class notation. E.g. 0 = C, 1 = C♯/D♭, 2 = D, and so on. If no key was detected, the value is -1.
- **Loudness:** the overall loudness of a track in decibels (dB). Loudness values are averaged across the entire track and are useful for comparing relative loudness of tracks. Loudness is the quality of a sound that is the primary psychological correlate of physical strength (amplitude). Values typically range between -60 and 0 db.
- **Speechiness:** detects the presence of spoken words in a track. The more exclusively speech-like the recording (e.g. talk show, audio book, poetry), the closer to 1.0 the attribute value. Values above 0.66 describe tracks that are probably made entirely of spoken words. Values between 0.33 and 0.66 describe tracks that may contain both music and speech, either in sections or layered, including such cases as rap music. Values below 0.33 most likely represent music and other non-speech-like tracks.
- **Acousticness:** a confidence measure from 0.0 to 1.0 of whether the track is acoustic. 1.0 represents high confidence the track is acoustic.
- **Instrumentalness:** predicts whether a track contains no vocals. "Ooh" and "aah" sounds are treated as instrumental in this context. Rap or spoken word tracks are clearly "vocal". The closer the instrumentalness value is to 1.0, the greater likelihood the track contains no vocal content. Values above 0.5 are intended to represent instrumental tracks, but confidence is higher as the value approaches 1.0.
- **Liveness:** detects the presence of an audience in the recording. Higher liveness values represent an increased probability that the track was performed live. A value above 0.8 provides strong likelihood that the track is live.
- **Valence:** a measure from 0.0 to 1.0 describing the musical positiveness conveyed by a track. Tracks with high valence sound more positive (e.g. happy, cheerful, euphoric), while tracks with low valence sound more negative (e.g. sad, depressed, angry).
- **Tempo:** the overall estimated tempo of a track in beats per minute (BPM). In musical terminology, tempo is the speed or pace of a given piece and derives directly from the average beat duration.
- **Duration_ms:** the duration of the track in milliseconds.
- **Stream:** number of streams of the song on Spotify.
- **Url_youtube:** url of the video linked to the song on Youtube, if it have any.
- **Title:** title of the videoclip on youtube.
- **Channel:** name of the channel that have published the video.
- **Views:** number of views.
- **Likes:** number of likes.
- **Comments:** number of comments.
- **Description:** description of the video on Youtube.
- **Licensed:** Indicates whether the video represents licensed content, which means that the content was uploaded to a channel linked to a YouTube content partner and then claimed by that partner.
official_video: boolean value that indicates if the video found is the official video of the song.

The original dataset had over 20,000 songs, but I focused on the top-performing ones to keep the analysis relevant and actionable.

I also dropped the Title and Description columns, because the rest of the columns could be relevant for futher analysis.

## Methods Used

1. Python (Jupyter Notebook) - to clean the data (mostly handling missing values)
2. MySQL - to query the data
3. Feature engineering - creating a calculated field that converts duration from milliseconds to minutes.
4. Ranking of the songs and artists.
5. Reshaping the dataset to visualize the features of each song (top 20 songs).

## Findings
### What are the top 10 most-streamed songs on Spotify, and how are they performing on YouTube?
#### Top Artists on Spotify
![image](https://github.com/user-attachments/assets/3073fd9c-8408-4aa9-9347-65105f702a0a)

#### Performance of Spotify's Top Artists on YouTube
![image](https://github.com/user-attachments/assets/ee4b75ad-8aba-47f4-ac5c-b6d0b607e13c)

From the data, we can see that most of the top artists on Spotify are doing relatively well on YouTube. It can be inferred that, people go to YouTube to watch the videos of the songs that they have liked on Spotify.

### What are the top 10 most-viewed songs on YouTube, and how do they perform on Spotify?
#### Top Artists on YouTube
![image](https://github.com/user-attachments/assets/f32a19da-6926-4df8-b464-5858bff55146)

#### Perfomance of YouTube Top Artists on Spotify
![image](https://github.com/user-attachments/assets/84af4789-86cd-44bd-b3c2-0f4b57849baf)

From the data, we can see that the top YouTube artists are not doing on too bad on Spotify but they're also not doing very good compared to how Spotify artists performed on YouTube.

### What’s the “shape” or makeup of the top songs on each platform?
![image](https://github.com/user-attachments/assets/177863a1-1113-43ab-bf29-e9035665cb3a)

![image](https://github.com/user-attachments/assets/38ac0606-53d5-43d8-b224-534d5568b861)


### What’s the average duration of the top 50 songs on both platforms?**
![image](https://github.com/user-attachments/assets/5f95b34f-8260-4460-9513-8a1ddc981f9e)

![image](https://github.com/user-attachments/assets/a82b62e5-6196-4de9-a695-b5f30571ffec)






## Dashboard
![image](https://github.com/user-attachments/assets/dacfcb15-0f37-4cac-a1d0-6f4bdcfe056e)
