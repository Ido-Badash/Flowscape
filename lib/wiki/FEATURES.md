# Music data layer text visual
📦 Music Project Data Layer
└── 🎶 Playlists (PlaylistModel)
    ├── id: Unique identifier for the playlist
    ├── title: Name of the playlist
    ├── creator: Creator of the playlist
    ├── description: (Optional) Description of the playlist
    ├── order: How songs are ordered (e.g., normal, by title, by artist)
    ├── shuffle: Whether the playlist is shuffled
    ├── playlistImagePath: (Optional) Path to the playlist's image
    ├── currentSongIdx: Index of the currently playing song within the playlist
    ├── currentSongTime: Current playback position of the song
    └── 🎵 Songs (List<SongModel> - Stored as IsarSong in the database)
        ├── Song 1
        │   ├── id: Unique identifier for the song
        │   ├── title: Title of the song
        │   ├── artist: Artist of the song
        │   ├── audioFilePath: Path to the song's audio file
        │   └── currentSongTime: Current playback position of the song (in seconds)
        ├── Song 2
        │   ├── id: Unique identifier for the song
        │   ├── title: Title of the song
        │   ├── artist: Artist of the song
        │   ├── audioFilePath: Path to the song's audio file
        │   └── currentSongTime: Current playback position of the song (in seconds)
        └── ... (and so on for all songs in the playlist)


# Scapes cards

## Whiteboard (Idea, Design and steps)
https://wbd.ms/share/v2/aHR0cHM6Ly93aGl0ZWJvYXJkLm1pY3Jvc29mdC5jb20vYXBpL3YxLjAvd2hpdGVib2FyZHMvcmVkZWVtLzkyY2U4YzYwNmM3NjQyMmU4YzFmYTAxYjc5NGVhZDI4X0JCQTcxNzYyLTEyRTAtNDJFMS1CMzI0LTVCMTMxRjQyNEUzRF9kZmZhZmM3Yy03Yjc2LTRkNTktYjU1Mi1hY2E3MDg1MTI4OGY=

## Feature time tracking
started - 20/04/2025 14:22
finished - dd/mm/yyyy hh:mm

## Feature progress tracking
- Finished the whiteboard

- Made a new branch named: "home-scapes"

- Created a new folder in the lib/features/home named "widgets"
  and made a "scape.dart" file where im going to create the "Scape" class
  detailed in the whiteboard.

- commited and published branch, commit: `Add scape.dart file and update FEATURES.md for Scape class details`

- made params in the "Scape" class'

- made Scape class bare bones and a scape design

- finished Scape class

- testing Scape class

--- Template ---
# Feature name

## Design


## Functionalty


## Steps
1. 
2. 
3. 

## Feature tracking

## Feature progress tracking