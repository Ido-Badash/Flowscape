// Returns the first key found with the value pair
dynamic findKeyByValue(Map map, dynamic value) {
  for (var e in map.entries) {
    if (e.value == value) {
      return e.key;
    }
  }
  return null;
}
