class AppFormFieldValidator {
  /// Field empty +  min 2 caracters
  static String? basic(String? val) {
    if (val == null || val.isEmpty) {
      return '\u24d8  Ce champs est requis';
    } else if (val.length < 2) {
      return '\u24d8  Minimum 2 caratères';
    }
    return null;
  }
}
