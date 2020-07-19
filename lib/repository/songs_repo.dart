
import 'package:lyrics_buddy/models/song.dart';

abstract class SongsRepo {
  Future<List<Song>> fetchAllSongs();
}