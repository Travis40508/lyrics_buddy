
import 'package:flutter/material.dart';
import 'package:lyrics_buddy/models/song.dart';
import 'package:lyrics_buddy/repository/songs_repo.dart';

class SongLibrary extends ChangeNotifier {
  final List<Song> _songs = <Song>[];
  List<Song> get songs => _songs;
  final SongsRepo _repo;

  SongLibrary(this._repo) {
   fetchAllSongs();
  }

  void fetchAllSongs() async {
    final songs = await _repo.fetchAllSongs();
    _songs.addAll(songs);

    notifyListeners();
  }
}