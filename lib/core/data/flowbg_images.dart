import 'dart:math';

final Random _random = Random();

List<String> _buildImagePaths(String basePath, int count) {
  List<String> paths = [];
  for (int i = 0; i < count; i++) {
    paths.add("$basePath${i + 1}.jpg");
  }
  return paths;
}

List<String> getRandomImages(String basePath, int count) {
  final images = _buildImagePaths(basePath, count);
  images.shuffle(_random);
  return images;
}

const String lightBasePath = "assets/images/flowbgs_light/flowbg_";
const String darkBasePath = "assets/images/flowbgs_dark/flowbg_";

List<String> getRandomLightImages(int count) => getRandomImages(lightBasePath, count);
List<String> getRandomDarkImages(int count) => getRandomImages(darkBasePath, count);
