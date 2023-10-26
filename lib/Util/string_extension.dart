import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String camelCase() {
    String formattedText = toLowerCase()
        .split(' ')
        .map((element) => toBeginningOfSentenceCase(element))
        .toList()
        .join(' ');

    return formattedText;
  }
}
