extension StringEx on String {
  String get formatFileName =>
      split('/').last.split('.').first.split('-').map((word) => word[0].toUpperCase() + word.substring(1)).join(' ');
}
