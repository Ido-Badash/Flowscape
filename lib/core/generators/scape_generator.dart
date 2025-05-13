// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flowscape/features/home/screens/scapes/widgets/scape.dart';
import 'package:flowscape/features/home/screens/scapes/widgets/scape_page.dart';
import 'package:flowscape/features/home/screens/scapes/widgets/scape_style.dart';

/// Creates scapes and stores them in memory.
///
/// Parameters:
/// - `pagesAmount`: Determines the number of pages in the scape.
/// - `crowdLevel`: Specifies how compact the scape is, with levels ranging from 1 to 5.
/// - `theme`: Defines the theme of the scape, either "dark" or "light".
/// - `images`: If `true`, the scape will include images; otherwise, it will not.
/// - `videos`: If `true`, the scape will include videos; otherwise, it will not.
class ScapeGenerator extends StatelessWidget {
  final int pagesAmount;
  final int crowdLevel;
  final String theme;
  final bool images;
  final bool videos;

  const ScapeGenerator({
    super.key,
    this.pagesAmount = 4,
    this.crowdLevel = 5,
    this.theme = "dark",
    this.images = true,
    this.videos = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scape(
      creator: buildCreatorText(),
      date: buildDateText(),
      title: buildTitleText(),
      style: buildScapeStyle(),
      children: buildScapeChildren(),
    );
  }

  //* --- Creator ---
  Text buildCreatorText() {
    return Text(creatorTextScout(), style: buildCreatorTextStyle());
  }

  String creatorTextScout() {
    return "";
  }

  TextStyle buildCreatorTextStyle() {
    return const TextStyle();
  }

  //* --- Date ---
  Text buildDateText() {
    return Text(dateTextScout(), style: buildDateTextStyle());
  }

  String dateTextScout() {
    return "";
  }

  TextStyle buildDateTextStyle() {
    return const TextStyle();
  }

  //* --- Title ---
  Text buildTitleText() {
    return Text(titleTextScout(), style: buildTitleTextStyle());
  }

  String titleTextScout() {
    return "";
  }

  TextStyle buildTitleTextStyle() {
    return const TextStyle();
  }

  //* --- Style ---
  ScapeStyle buildScapeStyle() {
    return const ScapeStyle();
  }

  //* --- Children ---
  List<Widget> buildScapeChildren() {
    return List.generate(pagesAmount, (idx) => scapeChildrenGenerator(idx));
  }

  Widget scapeChildrenGenerator(int idx) {
    return SizedBox.shrink();
  }
}
