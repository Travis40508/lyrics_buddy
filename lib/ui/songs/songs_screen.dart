import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('All Songs'),
        centerTitle: true,
        backgroundColor: Colors.black,
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
