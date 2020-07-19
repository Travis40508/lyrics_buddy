
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lyrics_buddy/models/song.dart';
import 'package:lyrics_buddy/repository/songs_repo.dart';
import 'package:rxdart/rxdart.dart';

class SongLibrary extends ChangeNotifier {

  Timer _timer;

  final List<Song> _songs = <Song>[];
  List<Song> get songs => _songs;

  Song _selectedSong;
  Song get selectedSong => _selectedSong;

  List<Song> _searchResults = <Song>[];
  List<Song> get searchResults => _searchResults;

  final SongsRepo _repo;

  SongLibrary(this._repo) {
   fetchAllSongs();
  }

  void fetchAllSongs() async {
    final songs = await _repo.fetchAllSongs();
    _songs.addAll(songs);

    notifyListeners();
  }

  void fetchSongLyrics(final Song song) {
    _selectedSong = song;

    notifyListeners();
  }

  void onSearchQueryChanged(final String query) {
    if (_timer?.isActive ?? false) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: 400), () async {
      final songs = await _repo.searchForSongs(query);

      if (songs.isNotEmpty) {
        _searchResults.clear();
        _searchResults.addAll(songs);

        notifyListeners();
      }
    });
  }
}