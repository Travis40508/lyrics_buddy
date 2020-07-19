import 'package:flutter/material.dart';
import 'package:lyrics_buddy/models/state/song_library.dart';
import 'package:lyrics_buddy/ui/widgets/song_card.dart';
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
          'Search',
          style: TextStyle(
            color: Theme.of(context).accentColor
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            cursorColor: Theme.of(context).accentColor,
            decoration: InputDecoration(
              fillColor: Theme.of(context).accentColor,
              filled: true,
              hintText: 'Ex: Eminem',
              hintStyle: TextStyle(
                color: Theme.of(context).primaryColor
              )
            ),
            onChanged: (query) => Provider.of<SongLibrary>(context, listen: false).onSearchQueryChanged(query),
          ),
          Consumer<SongLibrary>(
            builder: (_, songLibrary, __) {
              return Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: songLibrary.searchResults.length,
                  itemBuilder: (context, index) {
                    final song = songLibrary.searchResults[index];

                    return SongCard(song);
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
