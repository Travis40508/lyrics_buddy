import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lyrics_buddy/models/state/lyrics_buddy_theme.dart';
import 'package:lyrics_buddy/models/state/song_library.dart';
import 'package:lyrics_buddy/ui/widgets/song_card.dart';
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
            'All Songs',
          style: TextStyle(
            color: Theme.of(context).accentColor
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          RaisedButton(
            color: Theme.of(context).primaryColor,
            child: Text(
                'Swap Theme',
              style: TextStyle(
                color: Theme.of(context).accentColor
              ),
            ),
            onPressed: () => Provider.of<LyricsBuddyTheme>(context, listen: false).changeTheme(),
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

                    return SongCard(song);
                  },
                ),
              );
        }
      ),
    );
  }
}
