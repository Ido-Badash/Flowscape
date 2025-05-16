import 'package:flutter/material.dart';
import 'package:flowscape/features/home/screens/scapes/scape_lib.dart';

class AssetFrame extends ClassicFrame with ScapeUtils {
  final List<Widget> children;
  final String bgImage;
  final AlignmentGeometry stackAlignment;

  const AssetFrame({
    super.key,
    Color? color,
    this.children = const [],
    this.bgImage = "",
    this.stackAlignment = AlignmentDirectional.center,
  });

  @override
  Widget build(BuildContext context) {
    return buildAClipRRPage(
      child: Stack(
        alignment: stackAlignment,
        children: [
          Image.asset(
            bgImage,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            gaplessPlayback: true,
          ),
          ...children,
        ],
      ),
    );
  }
}
