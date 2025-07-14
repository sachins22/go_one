class NumberCheck {
  static String stringToInt(String? value) {
    if (value == null) {
      return "0";
    }
    return int.tryParse(value).toString() ?? "0";
  }
  
}