import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lyrics_buddy/models/song.dart';
import 'package:lyrics_buddy/utils/constants.dart';

class SongCard extends StatelessWidget {
  
  final Song _song;
  SongCard(this._song);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Hero(
                    tag: '${_song.artistName}${_song.title}',
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25.0),
                      ),
                      child: Container(
                        color: Colors.black,
                        child: Opacity(
                          opacity: Constants.cardOpacity,
                          child: Image(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                                _song.artistImage
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Hero(
                    tag: '${_song.title}${_song.artistName} ',
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Constants.borderRadius),
                      ),
                      child: Container(
                        color: Colors.black,
                        child: Opacity(
                          opacity: Constants.cardOpacity,
                          child: Image(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                                _song.albumImage
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Positioned(
                top: 10.0,
                left: 5.0,
                child: Stack(
                  fit: StackFit.loose,
                  children: <Widget>[
                    Positioned.fill(
                      child: Opacity(
                        opacity: .7,
                        child: Card(
                          elevation: 4.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _song.artistName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
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
                        opacity: .7,
                        child: Card(
                          elevation: 4.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _song.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
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
  }
}
