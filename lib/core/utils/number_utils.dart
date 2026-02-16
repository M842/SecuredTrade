class NumberUtils {
  NumberUtils._(); // private constructor

  static String toOrdinal(int number) {
    if (number <= 0) return number.toString();

    final mod100 = number % 100;
    if (mod100 >= 11 && mod100 <= 13) {
      return '${number}th';
    }

    switch (number % 10) {
      case 1:
        return '${number}st';
      case 2:
        return '${number}nd';
      case 3:
        return '${number}rd';
      default:
        return '${number}th';
    }
  }
}
