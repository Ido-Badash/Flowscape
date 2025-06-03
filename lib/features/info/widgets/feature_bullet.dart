import 'package:flutter/material.dart';

class FeatureBullet extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color? textColor;

  const FeatureBullet({
    super.key,
    this.title = "Feature Title",
    this.description = "This is a brief description of the feature.",
    this.icon = Icons.check_circle_outline,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color newTxtColor =
        textColor ?? Theme.of(context).colorScheme.onTertiary;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24),
          const SizedBox(width: 12.0),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 250),
            child: RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 17, height: 1.5, color: textColor),
                children: [
                  TextSpan(
                    text: title,
                    style: TextStyle(
                      color:
                          Theme.of(context).colorScheme.brightness ==
                                  Brightness.dark
                              ? Color.fromARGB(200, 200, 190, 255)
                              : Color.fromARGB(200, 100, 80, 127),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: " $description",
                    style: TextStyle(color: newTxtColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
