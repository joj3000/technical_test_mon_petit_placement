extension StringExtensions on String {
  /// the quick brown fox  => The quick brown fox
  String capitalize() {
    if (isEmpty) {
      return '';
    } else {
      return "${this[0].toUpperCase()}${substring(1)}";
    }
  }

  /// the quick-brown fox => The Quick-Brown Fox
  ///
  /// You can add separators
  ///
  /// If Separators is empty, does nothing
  String titleCase({List<String> separators = const [' ', '-']}) {
    if (isEmpty) {
      return '';
    } else {
      var text = toLowerCase();

      for (final sep in separators) {
        text = text.trim().split(sep).map((word) {
          if (word.trim().isNotEmpty) {
            final String firstLetter =
                word.trim().substring(0, 1).toUpperCase();
            final String remainingLetters = word.trim().substring(1);
            return '$firstLetter$remainingLetters';
          }
          return '';
        }).join(sep);
      }

      return text;
    }
  }
}
