import 'package:flutter/material.dart';
import 'package:lyrics_buddy/models/state/song_library.dart';
import 'package:lyrics_buddy/routes/search/search_route.dart';
import 'package:lyrics_buddy/routes/settings/settings_route.dart';
import 'package:lyrics_buddy/ui/lyrics/lyrics_screen.dart';
import 'package:lyrics_buddy/ui/widgets/song_card.dart';
import 'package:lyrics_buddy/utils/constants.dart';
import 'package:provider/provider.dart';

class SongsScreen extends StatefulWidget {
  @override
  _SongsScreenState createState() => _SongsScreenState();
}

class _SongsScreenState extends State<SongsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
            Constants.allSongsScreenName,
          style: TextStyle(
            color: Theme.of(context).accentColor
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, SettingsRoute().routeName()),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => Navigator.pushNamed(context, SearchRoute().routeName()),
          )
        ],
      ),
      body: Consumer<SongLibrary>(
        builder: (_, songLibrary, __ ,) {
          return songLibrary.songs.isEmpty ? Center(child: CircularProgressIndicator(),) :
              Container(
                child: ListView.builder(
                  itemCount: songLibrary.songs.length,
                  itemBuilder: (context, index) {
                    final song = songLibrary.songs[index];

                    return InkWell(
                      child: SongCard(song),
                      onTap: () {
                        songLibrary.fetchSongLyrics(song);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeNotifierProvider.value(
                            value: songLibrary,
                          child: LyricsScreen(),
                        )));
                      }
                    );
                  },
                ),
              );
        }
      ),
    );
  }
}
