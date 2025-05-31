import 'package:flutter/material.dart';
import '../../scape_utils.dart';
import 'package:flowscape/core/helpers/helpers.dart';

/// Frame for the child in ScapePage class
class QuoteHeadFrame extends StatelessWidget with ScapeUtils {
  final String? creator;
  final String? date;
  final String? quote;
  final String? quoter;
  final Color? quoteColor;
  final Color? textColor;
  final Widget child;

  const QuoteHeadFrame({
    super.key,
    this.creator,
    this.date,
    this.quote,
    this.quoter,
    this.quoteColor,
    this.textColor,
    this.child = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        child,
        Positioned(
          bottom: 0,
          left: 10,
          child: Text(
            creator ?? "",
            style: TextStyle(
              color: textColor ?? Color.fromARGB(150, 255, 255, 255),
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
              color: textColor ?? Color.fromARGB(150, 255, 255, 255),
              fontSize: 16,
              fontStyle: FontStyle.italic,
              shadows: [TextUtils.textOutlineShadow()],
            ),
          ),
        ),
        Center(
          child: Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  quote ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: quoteColor ?? Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: "NotoSans",
                    shadows: [TextUtils.textOutlineShadow()],
                  ),
                ),
                if (quoter != null && quoter!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "- $quoter",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withAlpha(150),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: "NotoSans",
                        shadows: [TextUtils.textOutlineShadow()],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
