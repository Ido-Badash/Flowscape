import 'package:flutter/material.dart';

// ListTile bodys
import 'appearrance_tile/theme_select.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Widget currentBody = SizedBox();
  bool settingsCollapsed = false;
  IconData currentCollapseIconData = Icons.arrow_back;
  IconData ogCollapseIconData = Icons.arrow_back;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        actions: [],
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.displaySmall?.fontSize,
          ),
        ),
        toolbarHeight: 45.0,
      ),
      body: Row(
        children: [
          if (!settingsCollapsed)
            Expanded(flex: 1, child: Container(child: settingsCards())),
          VerticalDivider(
            color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            thickness: 4.0,
            width: 4.0,
          ),
          Expanded(
            flex: 1,
            child: Scaffold(
              appBar: AppBar(leading: buildCollapseIconButton()),
              body: currentBody,
            ),
          ),
        ],
      ),
    );
  }

  void toggleSettingsCollapse() {
    settingsCollapsed = !settingsCollapsed;
    if (currentCollapseIconData == ogCollapseIconData) { // if the arrow if facing left (open)
      currentCollapseIconData = Icons.arrow_forward;
    } else { // if the arrow if facing right (collapsed)
      currentCollapseIconData = ogCollapseIconData;
    }
  }

  IconButton buildCollapseIconButton() {
    return IconButton(
      onPressed: () {
        setState(() {
          toggleSettingsCollapse();
        });
      },
      tooltip: currentCollapseIconData == ogCollapseIconData ? "Collapse" : "Open",
      icon: Icon(size: 15, currentCollapseIconData),
    );
  }

  Column settingsCards() {
    return Column(
      children: [buildAccountExpansionTile(), buildAppearanceExpansionTile()],
    );
  }

  ExpansionTile buildAccountExpansionTile() {
    return ExpansionTile(
      title: Text('Account', softWrap: false),
      textColor: Theme.of(context).expansionTileTheme.textColor,
      children: [
        ListTile(title: Text('Edit')),
        ListTile(title: Text('Info')),
        ListTile(title: Text('Sign out')),
      ],
    );
  }

  ExpansionTile buildAppearanceExpansionTile() {
    return ExpansionTile(
      textColor: Theme.of(context).expansionTileTheme.textColor,
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
        ListTile(title: Text("Flow Backgrounds")),
      ],
    );
  }
}
