import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lyrics_buddy/models/song.dart';
import 'package:lyrics_buddy/models/state/settings.dart';
import 'package:lyrics_buddy/models/state/song_library.dart';
import 'package:lyrics_buddy/ui/widgets/song_card.dart';
import 'package:lyrics_buddy/utils/constants.dart';
import 'package:provider/provider.dart';

class LyricsScreen extends StatefulWidget {
  @override
  _LyricsScreenState createState() => _LyricsScreenState();
}

class _LyricsScreenState extends State<LyricsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          Constants.lyricsScreenName,
          style: TextStyle(
            color: Theme.of(context).accentColor
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Consumer<SongLibrary>(
      builder: (_, songLibrary, __) {
        return ListView(
          children: <Widget>[
            SongCard(songLibrary.selectedSong),
            Text(
              songLibrary.selectedSong.lyrics,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold,
                fontSize: Provider.of<Settings>(context).fontSizePreference
              ),
              textAlign: TextAlign.center,
            )
          ],
        );
      },
    );
  }
}
