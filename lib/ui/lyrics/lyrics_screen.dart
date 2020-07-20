import 'package:flutter/material.dart';
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
        actions: <Widget>[
          Consumer<SongLibrary>(
            builder: (_, songLibrary, __) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: InkWell(
                    onTap: () => songLibrary.isSongInLibrary() ? _editSong() : _saveSong(),
                    child: Text(
                      songLibrary.isSongInLibrary() ? 'Edit' : 'Save',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
      body: _buildBody(),
    );
  }

  void _editSong() {

  }

  void _saveSong() {
    
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
