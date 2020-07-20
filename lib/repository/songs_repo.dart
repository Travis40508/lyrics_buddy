
import 'package:lyrics_buddy/models/song.dart';

abstract class SongsRepo {
  Future<List<Song>> fetchAllSongs();
  Future<List<Song>> searchForSongs(final String query);
  bool saveSong(Song selectedSong);
}