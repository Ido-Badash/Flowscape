// Returns the first key found with the value pair
dynamic findKeyByValue(Map map, int value) {
  for (var entry in map.entries) {
    if (entry.value == value) {
      return entry.key;
    }
  }
  return null;
}