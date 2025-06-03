import 'package:flutter/material.dart';

class FeatureBullet extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color textColor;

  const FeatureBullet({
    super.key,
    this.title = "Feature Title",
    this.description = "This is a brief description of the feature.",
    this.icon = Icons.check_circle_outline,
    this.textColor = const Color.fromARGB(200, 230, 240, 239),
  });

  @override
  Widget build(BuildContext context) {
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
                    style: const TextStyle(
                      color: Color.fromARGB(200, 200, 190, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: " $description"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
