class StringUtils {
  static String getInitials(String text, {int limitTo = 2}) {
    if (text.isNotEmpty) {
      String initial = '';
      var words = text.split(' ');
      if (words.isNotEmpty) {
        initial = words.map((word) => word[0]).join();
      }
      return initial.length > 1 ? initial.substring(0, 2) : initial;
    }
    return '';
  }
}
