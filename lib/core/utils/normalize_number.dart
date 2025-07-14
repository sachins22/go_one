double normalizeNumber(dynamic value) {
  if (value is double) {
    return value;
  } else if (value is int) {
    return value.toDouble();
  } else if (value is String) {
    return double.tryParse(value) ?? 0.0;
  } else {
    throw ArgumentError('Value cannot be normalized to a double: $value');
  }
}
