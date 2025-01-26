class LangConverter {
  String convertToArabic(int number) {
    Map<int, String> arabicDigits = {
      0: '٠',
      1: '١',
      2: '٢',
      3: '٣',
      4: '٤',
      5: '٥',
      6: '٦',
      7: '٧',
      8: '٨',
      9: '٩'
    };

    String arabicNumber = '';
    while (number > 0) {
      arabicNumber = arabicDigits[number % 10]! + arabicNumber;
      number ~/= 10;
    }
    return arabicNumber;
  }
}
