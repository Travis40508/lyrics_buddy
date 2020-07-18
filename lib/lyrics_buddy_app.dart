import 'package:flutter/material.dart';
import 'package:lyrics_buddy/routes/search/search_route.dart';
import 'package:lyrics_buddy/ui/search/search_screen.dart';
import 'package:lyrics_buddy/utils/constants.dart';

class LyricsBuddyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appTitle,
      debugShowCheckedModeBanner: false,
      initialRoute: SearchRoute().routeName(),

      routes: {
        SearchRoute().routeName(): (context) => SearchScreen()
      },
    );
  }
}
