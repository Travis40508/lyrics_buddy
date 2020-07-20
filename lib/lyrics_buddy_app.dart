import 'package:flutter/material.dart';
import 'package:lyrics_buddy/models/state/settings.dart';
import 'package:lyrics_buddy/models/state/song_library.dart';
import 'package:lyrics_buddy/repository/songs_repo_impl.dart';
import 'package:lyrics_buddy/routes/lyrics/lyrics_route.dart';
import 'package:lyrics_buddy/routes/search/search_route.dart';
import 'package:lyrics_buddy/routes/settings/settings_route.dart';
import 'package:lyrics_buddy/routes/songs/all_songs_route.dart';
import 'package:lyrics_buddy/ui/lyrics/lyrics_screen.dart';
import 'package:lyrics_buddy/ui/search/search_screen.dart';
import 'package:lyrics_buddy/ui/settings/settings_screen.dart';
import 'package:lyrics_buddy/ui/songs/songs_screen.dart';
import 'package:lyrics_buddy/utils/constants.dart';
import 'package:provider/provider.dart';

class LyricsBuddyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Settings(),
        ),
        ChangeNotifierProvider(
          create: (context) => SongLibrary(SongsRepoImpl()),
        ),
      ],
      child: Consumer<Settings>(
        builder: (_, settings, __) {
          return MaterialApp(
            title: Constants.appTitle,
            debugShowCheckedModeBanner: false,
            initialRoute: AllSongsRoute().routeName(),

            routes: {
              SearchRoute().routeName(): (context) => SearchScreen(),
              AllSongsRoute().routeName(): (context) => SongsScreen(),
              SettingsRoute().routeName(): (context) => SettingsScreen(),
              LyricsRoute().routeName(): (context) => LyricsScreen()
            },
            theme: settings.currentTheme.getThemeData(),
          );
        },
      ),
    );
  }
}
