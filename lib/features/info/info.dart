import "package:flowscape/features/info/widgets/feature_bullet.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  Color get textColor => const Color.fromARGB(200, 230, 240, 239);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            _buildSectionTitle(),
            const SizedBox(height: 30.0),
            _buildIntroText(),
            const SizedBox(height: 30.0),
            ..._buildFeatureList(),
            const SizedBox(height: 50.0),
            _buildSupportSection(),
            const SizedBox(height: 50.0),
            _buildSourceSection(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }

  // AppBar builder
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      title: Text(
        "Info",
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.displaySmall?.fontSize,
        ),
      ),
      toolbarHeight: 45.0,
    );
  }

  // Section title ("About")
  Widget _buildSectionTitle() {
    return Center(
      child: Column(
        children: [
          const Icon(Icons.info_outline, size: 40),
          const SizedBox(height: 10),
          const Text(
            "About",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Intro text
  Widget _buildIntroText() {
    return Text(
      "Flowscape is a focus and learning app designed for productivity, featuring:",
      textAlign: TextAlign.center,
      style: TextStyle(color: textColor, fontSize: 17, height: 1.6),
    );
  }

  // Features list
  List<Widget> _buildFeatureList() {
    return [
      FeatureBullet(
        icon: Icons.rss_feed,
        title: "Scroll Feed:",
        description: "Curated news (health, books & more).",
      ),
      FeatureBullet(
        icon: Icons.checklist,
        title: "Task:",
        description: "To-do list with completion tracking.",
      ),
      FeatureBullet(
        icon: Icons.hourglass_empty,
        title: "Flow:",
        description: "Focus timer with breaks for improved productivity.",
      ),
      FeatureBullet(
        icon: Icons.settings,
        title: "Settings:",
        description: "Personalized app experience.",
      ),
    ];
  }

  // Support section
  Widget _buildSupportSection() {
    return Center(
      child: Column(
        children: [
          const Icon(Icons.support_agent, size: 40),
          const SizedBox(height: 10),
          const Text(
            "Support",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          SelectableText(
            "idoba12012011@gmail.com",
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }

  // Source section
  Widget _buildSourceSection() {
    return Center(
      child: Column(
        children: [
          const Icon(CupertinoIcons.wrench_fill, size: 40),
          const SizedBox(height: 10),
          const Text(
            "Source",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          SelectableText(
            "Version 1.0.0",
            style: TextStyle(color: textColor, fontSize: 18),
          ),
          const SelectableText(
            "https://github.com/Ido-Badash/Flowscape.git",
            style: TextStyle(color: Colors.blue, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
