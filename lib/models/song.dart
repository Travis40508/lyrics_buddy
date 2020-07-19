
class Song {
  final String _title;
  final String _artistName;
  final String _artistImage;
  final String _albumImage;
  final String _lyrics;

  Song(this._title, this._artistName, this._artistImage, this._albumImage,
      this._lyrics);

  String get lyrics => _lyrics;

  String get albumImage => _albumImage;

  String get artistImage => _artistImage;

  String get artistName => _artistName;

  String get title => _title;
}