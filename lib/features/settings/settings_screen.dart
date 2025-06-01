/*
Displays the settings screen
*/

import 'package:flowscape/features/settings/appearance/theme_select.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Widget? currentBody;
  bool settingsCollapsed = false;
  IconData currentCollapseIconData = Icons.arrow_back;
  final IconData leftCollapseIconData = Icons.arrow_back;
  final IconData rightCollapseIconData = Icons.arrow_forward;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!settingsCollapsed) settingsCards(),
        if (!settingsCollapsed)
          VerticalDivider(
            color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            thickness: 4.0,
            width: 4.0,
          ),
        Flexible(
          flex: 5, // Scale double to int for finer control
          child: Scaffold(
            appBar: AppBar(leading: buildCollapseIconButton()),
            body: currentBody ?? buildNullCaseCurrentBody(),
          ),
        ),
      ],
    );
  }

  void toggleSettingsCollapse() {
    settingsCollapsed = !settingsCollapsed;
    currentCollapseIconData =
        currentCollapseIconData ==
                leftCollapseIconData // if opened
            ? currentCollapseIconData =
                rightCollapseIconData // then make it close
            : currentCollapseIconData =
                leftCollapseIconData; // otherwise make it open
  }

  Widget buildNullCaseCurrentBody() {
    return const Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(":)", style: TextStyle(fontSize: 30)),
            Text("have a blessed day", style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget buildCollapseIconButton() {
    return IconButton(
      onPressed: () {
        setState(() {
          toggleSettingsCollapse();
        });
      },
      tooltip:
          // toggels the tooltip msg
          currentCollapseIconData == leftCollapseIconData ? "Collapse" : "Open",
      icon: Icon(size: 15, currentCollapseIconData),
    );
  }

  Widget settingsCards() {
    return Flexible(
      flex: 4, // Scale double to int for finer control
      child: ListView(children: [buildAppearanceExpansionTile()]),
    );
  }

  Widget buildAppearanceExpansionTile() {
    return ExpansionTile(
      title: Text('Appearance', softWrap: false),
      children: [
        ListTile(
          title: Text("Theme"),
          onTap: () {
            setState(() {
              currentBody = ThemeSelectScreen();
            });
          },
        ),
      ],
    );
  }
}
