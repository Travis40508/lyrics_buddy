import 'package:flutter/material.dart';
import 'package:lyrics_buddy/models/state/song_library.dart';
import 'package:lyrics_buddy/ui/lyrics/lyrics_screen.dart';
import 'package:lyrics_buddy/ui/widgets/song_card.dart';
import 'package:lyrics_buddy/utils/constants.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          Constants.searchScreenName,
          style: TextStyle(
            color: Theme.of(context).accentColor
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(
                fontSize: 18.0,
                color: Theme.of(context).primaryColor
              ),
              maxLength: 20,
              maxLines: 1,
              cursorColor: Theme.of(context).accentColor,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(Constants.borderRadius), bottomRight: Radius.circular(Constants.borderRadius))
                ),
                fillColor: Theme.of(context).accentColor,
                filled: true,
                hintText: Constants.searchHint,
                hintStyle: TextStyle(
                  color: Theme.of(context).primaryColor
                )
              ),
              onChanged: (query) => Provider.of<SongLibrary>(context, listen: false).onSearchQueryChanged(query),
            ),
          ),
          Consumer<SongLibrary>(
            builder: (_, songLibrary, __) {
              return Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: songLibrary.searchResults.length,
                  itemBuilder: (context, index) {
                    final song = songLibrary.searchResults[index];

                    return InkWell(
                      child: SongCard(song),
                      onTap: () {
                        songLibrary.fetchSongLyrics(song);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeNotifierProvider.value(
                          value: songLibrary,
                          child: LyricsScreen(),
                        )));
                      },
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
