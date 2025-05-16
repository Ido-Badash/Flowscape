import 'package:flutter/material.dart';
import 'package:flowscape/features/home/scapes/scape_lib.dart';
import 'package:flowscape/core/helpers/helpers.dart';

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
    return GeneralWidgetUtils.buildAClipRRPage(
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
