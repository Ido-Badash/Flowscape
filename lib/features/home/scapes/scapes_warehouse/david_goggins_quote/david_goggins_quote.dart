import 'package:flutter/material.dart';
import 'package:flowscape/features/home/scapes/scape_lib.dart';
import 'package:flowscape/core/helpers/helpers.dart';

class DavidGogginsQuoteScape extends StatelessWidget with ScapeUtils {
  const DavidGogginsQuoteScape({super.key});

  @override
  Widget build(BuildContext context) {
    return Scape(removePageIndicator: true, children: [buildHeadPage()]);
  }

  Widget buildHeadPage() {
    return buildHeadPageMainBody();
  }

  Widget buildHeadPageMainBody() {
    return GeneralWidgetUtils.buildAClipRRPage(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          QuoteHeadFrame(
            creator: "Flowscape",
            date: "31/05/2025",
            quote: "\"Don't stop when you're tired, stop when you're done.\"",
            quoter: "David Goggins",
            quoteColor: Color.fromARGB(255, 210, 65, 65),
            quoterColor: Colors.white.withAlpha(150),
            quoteShadowColor: Colors.black,
            textColor: Colors.white.withAlpha(75),
            child: buildQuoteContent(),
          ),
        ],
      ),
    );
  }

  Widget buildQuoteContent() {
    return Image.asset(
      "assets/images/scapes/david_goggins_quote/bg.jpg",
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      gaplessPlayback: true,
    );
  }
}
