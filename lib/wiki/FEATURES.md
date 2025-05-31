# Music data layer text visual
📦 Music Project Data Layer
└── 💾 Database (e.g., Isar Database)
    ├── 🎶 Playlists Collection (e.g., Isar Collection of PlaylistModel objects)
    │   ├── Playlist 1 (PlaylistModel Object)
    │   │   ├── id: ...
    │   │   ├── title: "My Rock Anthems"
    │   │   ├── creator: "Alice"
    │   │   ├── songs: List<SongModel>
    │   │   │   ├── 🎵 Song A (SongModel / IsarSong)
    │   │   │   │   ├── id: ...
    │   │   │   │   ├── title: "Bohemian Rhapsody"
    │   │   │   │   ├── artist: "Queen"
    │   │   │   │   └── audioFilePath: "..."
    │   │   │   ├── 🎵 Song B (SongModel / IsarSong)
    │   │   │   │   ├── id: ...
    │   │   │   │   ├── title: "Stairway to Heaven"
    │   │   │   │   ├── artist: "Led Zeppelin"
    │   │   │   │   └── audioFilePath: "..."
    │   │   │   └── ... (other songs in Playlist 1)
    │   ├── Playlist 2 (PlaylistModel Object)
    │   │   ├── id: ...
    │   │   ├── title: "Morning Chill"
    │   │   ├── creator: "Bob"
    │   │   ├── songs: List<SongModel>
    │   │   │   ├── 🎵 Song X (SongModel / IsarSong)
    │   │   │   │   ├── id: ...
    │   │   │   │   ├── title: "Acoustic Dreams"
    │   │   │   │   ├── artist: "Indie Artist"
    │   │   │   │   └── audioFilePath: "..."
    │   │   │   └── ... (other songs in Playlist 2)
    │   └── ... (other PlaylistModel objects in the collection)
    └── 🎵 Songs Collection (e.g., Isar Collection of IsarSong objects - if songs are also stored independently for lookup/reuse)
        ├── Song A (IsarSong) - The same Song A as in Playlist 1's list
        ├── Song B (IsarSong) - The same Song B as in Playlist 1's list
        ├── Song X (IsarSong) - The same Song X as in Playlist 2's list
        └── ... (all unique songs in your database)

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