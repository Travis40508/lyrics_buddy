
import 'package:lyrics_buddy/models/song.dart';
import 'package:lyrics_buddy/repository/songs_repo.dart';

class SongsRepoImpl implements SongsRepo {

  final _eminemImage = 'https://cdns-images.dzcdn.net/images/artist/0707267475580b1b82f4da20a1b295c6/250x250-000000-80-0-0.jpg';
  final _loseYourselfAlbumImage = 'https://cdns-images.dzcdn.net/images/cover/e2b36a9fda865cb2e9ed1476b6291a7d/250x250-000000-80-0-0.jpg';

  final _beatlesImage = 'https://cdns-images.dzcdn.net/images/artist/e7f8aad6226980723164ee42e171bd17/250x250-000000-80-0-0.jpg';
  final _letItBeImage = 'https://cdns-images.dzcdn.net/images/cover/fcf05300b7c17ec77a6d01028a4bef61/250x250-000000-80-0-0.jpg';
  final _letItBeLyrics = '''
  When I find myself in times of trouble, Mother Mary comes to me
Speaking words of wisdom, let it be
And in my hour of darkness she is standing right in front of me
Speaking words of wisdom, let it be
Let it be, let it be, let it be, let it be
Whisper words of wisdom, let it be
And when the broken hearted people living in the world agree
There will be an answer, let it be
For though they may be parted, there is still a chance that they will see
There will be an answer, let it be
Let it be, let it be, let it be, let it be
There will be an answer, let it be
Let it be, let it be, let it be, let it be
Whisper words of wisdom, let it be
Let it be, let it be, let it be, let it be
Whisper words of wisdom, let it be
And when the night is cloudy there is still a light that shines on me
Shine until tomorrow, let it be
I wake up to the sound of music, Mother Mary comes to me
Speaking words of wisdom, let it be
Let it be, let it be, let it be, yeah, let it be
There will be an answer, let it be
Let it be, let it be, let it be, yeah, let it be
Whisper words of wisdom, let it be
''';

  final _pinkFloydImage = 'https://cdns-images.dzcdn.net/images/artist/32f4286d3082999df24439308e2d7669/250x250-000000-80-0-0.jpg';
  final _theWallImage = 'https://cdns-images.dzcdn.net/images/cover/7e25330c468696e8bca65050995d2fc7/250x250-000000-80-0-0.jpg';

  final _mgmtImage = 'https://cdns-images.dzcdn.net/images/artist/764288d62afb1c546888d3797930e16c/250x250-000000-80-0-0.jpg';
  final _oracularSpectacularImage = 'https://cdns-images.dzcdn.net/images/cover/d910a6585e4a80f06e6fddce4f6f859d/250x250-000000-80-0-0.jpg';

  final _eltonJohnImage = 'https://e-cdns-images.dzcdn.net/images/artist/89a0b458db72df642ee9065c6d4add31/250x250-000000-80-0-0.jpg';
  final _madAlbumImage = 'https://e-cdns-images.dzcdn.net/images/cover/c2495297d07ca9ce5514bd3444e65f9c/250x250-000000-80-0-0.jpg';

  List<Song> _fetchSongs() {
    return [
      Song('Lose Yourself', 'Eminem', _eminemImage, _loseYourselfAlbumImage, 'Lose yourself lyrics'),
      Song('Tiny Dancer', 'Elton John', _eltonJohnImage, _madAlbumImage, 'Blue jean baby, air lay lady...')
    ];
  }

  @override
  Future<List<Song>> fetchAllSongs() {
    return Future.value(_fetchSongs());
  }

  @override
  Future<List<Song>> searchForSongs(final String query) {
    print('@@@ making call!');
    return Future.value(
      [
        Song('Let it be', 'The Beatles', _beatlesImage, _letItBeImage, _letItBeLyrics),
        Song('Another brick in the wall', 'Pink Floyd', _pinkFloydImage, _theWallImage, "We don't need no education..."),
        Song('Kids', 'MGMT', _mgmtImage, _oracularSpectacularImage, 'Kids lyrics...'),
      ]
    );
  }

}