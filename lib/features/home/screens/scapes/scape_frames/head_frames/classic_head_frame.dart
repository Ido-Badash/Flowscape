import 'package:flutter/material.dart';
import '../../scape_utils.dart';
import 'package:flowscape/core/helpers/helpers.dart';

/// Frame for the child in ScapePage class
class ClassicHeadFrame extends StatelessWidget with ScapeUtils {
  final String? title;
  final String? creator;
  final String? date;
  final Color? textColor;
  final Widget child;
  final bool titleUnderline;

  const ClassicHeadFrame({
    super.key,
    this.creator,
    this.date,
    this.title,
    this.textColor,
    this.child = const SizedBox.shrink(),
    this.titleUnderline = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        child,
        Positioned(
          top: 5,
          child: Text(
            title ?? "",
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 26,
              shadows: [TextUtils.textOutlineShadow()],
              decoration:
                  titleUnderline
                      ? TextDecoration.underline
                      : TextDecoration.none,
              decorationColor: Color.fromARGB(150, 255, 255, 255),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 10,
          child: Text(
            creator ?? "",
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 16,
              fontFamily: "NotoSans",
              fontStyle: FontStyle.italic,
              shadows: [TextUtils.textOutlineShadow()],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 10,
          child: Text(
            date ?? "",
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 16,
              fontStyle: FontStyle.italic,
              shadows: [TextUtils.textOutlineShadow()],
            ),
          ),
        ),
      ],
    );
  }
}
