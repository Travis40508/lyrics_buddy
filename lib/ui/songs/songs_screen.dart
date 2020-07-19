import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lyrics_buddy/models/state/song_library.dart';
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

                    return Container(
                      height: MediaQuery.of(context).size.height / 3,
                      child: Card(
                        color: Colors.black,
                        elevation: 4.0,
                        child: Stack(
                          fit: StackFit.passthrough,
                          children: <Widget>[
                            Opacity(
                              opacity: .5,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image: CachedNetworkImageProvider(
                                        song.artistImage
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image: CachedNetworkImageProvider(
                                          song.albumImage
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              top: 10.0,
                              left: 5.0,
                              child: Stack(
                                fit: StackFit.loose,
                                children: <Widget>[
                                  Positioned.fill(
                                    child: Opacity(
                                      opacity: .5,
                                      child: Card(
                                        elevation: 4.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      song.artistName,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ),
                            Positioned(
                                bottom: 10.0,
                                right: 5.0,
                                child: Stack(
                                  fit: StackFit.loose,
                                  children: <Widget>[
                                    Positioned.fill(
                                      child: Opacity(
                                        opacity: .5,
                                        child: Card(
                                          elevation: 4.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        song.title,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
        }
      ),
    );
  }
}
