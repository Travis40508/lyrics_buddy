import 'package:flutter/material.dart';
import 'package:lyrics_buddy/models/state/settings.dart';
import 'package:lyrics_buddy/utils/constants.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          Constants.settingsScreenName,
          style: TextStyle(
            color: Theme.of(context).accentColor
          ),
        ),
      ),
      body: Consumer<Settings>(
        builder: (_, settings, __) {
          return ListView (
            children: ListTile.divideTiles(
              color: Theme.of(context).accentColor,
                context: context,
                tiles: [
                  ListTile(
                    title: Text(
                      '${Constants.fontSizeLabel} - ${settings.fontSizePreferenceAsWholeNum}',
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: settings.fontSizePreference
                      ),
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Slider(
                      value: settings.fontSizePreference,
                      onChanged: (size) => settings.updatePreferredFontSize(size),
                      min: Constants.minFontSize,
                      max: Constants.maxFontSize,
                      activeColor: Theme.of(context).accentColor,
                      inactiveColor: Theme.of(context).accentColor,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      Constants.themeLabel,
                      style: TextStyle(
                          color: Theme.of(context).accentColor
                      ),
                    ),
                    trailing: Switch(
                      inactiveThumbColor: Theme.of(context).accentColor,
                      onChanged: (_) => settings.changeTheme(),
                      value: settings.currentTheme is DarkTheme,
                    ),
                  ),
                ]
            ).toList(),
          );
        },
      )
    );
  }
}

