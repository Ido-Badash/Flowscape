import 'dart:math';

const String baseFlowBgImagePath = "assets/images/flowbgs/flowbg_";
final Random randomGenerator = Random();

List<String> flowBgImages = [];
List<String> randomFlowBgImages = [];

void _buildFlowBgImages(int imagesCount) {
  for (int i = 1; i <= imagesCount; i++) {
    flowBgImages.add("$baseFlowBgImagePath$i.jpg");
  }
}

List<String> getRandomImagesList(int imagesCount) {
  _buildFlowBgImages(imagesCount);
  randomFlowBgImages = [...flowBgImages];
  randomFlowBgImages.shuffle(randomGenerator);
  return randomFlowBgImages;
}
