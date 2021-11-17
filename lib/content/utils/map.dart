extension MapPathExtension on Map {
  Object? valueFor(String path, [String? segregator]) {
    final keys = path.split(segregator ?? '.');
    final thisKey = keys.removeAt(0);
    final thisValue = this[thisKey];
    if (keys.isEmpty) {
      return thisValue;
    } else if (thisValue is Map) {
      return thisValue.valueFor(keys.join(segregator ?? '.'));
    }
  }
}
