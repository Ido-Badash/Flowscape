import 'package:flutter/material.dart';

// widgets
import 'package:like_button/like_button.dart';

class ScapeActions extends StatelessWidget {
  const ScapeActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: SizedBox()),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [LikeButton(size: 40)],
        ),
      ],
    );
  }
}
