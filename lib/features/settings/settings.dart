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
          Expanded(flex: 1, child: settingsCards()),
          VerticalDivider(
            color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            thickness: 5.0,
            width: 5.0,
          ),
          Expanded(flex: 5, child: Container(child: currentBody)),
        ],
      ),
    );
  }

  Column settingsCards() {
    return Column(
      children: [buildAccountExpansionTile(), buildAppearanceExpansionTile()],
    );
  }

  ExpansionTile buildAccountExpansionTile() {
    return ExpansionTile(
      title: Text('Account (future update)'),
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
      title: Text('Appearance'),
      children: [
        ListTile(
          title: Text("Theme"),
          onTap: () {
            setState(() {
              currentBody = ThemeSelectScreen();
            });
          },
        ),
        ListTile(
          title: Text("Flow Backgrounds (future update)")),
      ],
    );
  }
}
