class QuranImagesServices {
  final String baseUrl =
      'https://raw.githubusercontent.com/Mohamed-Nagdy/Quran-App-Data/main/quran_images/';
  // var surahNames = List<String>.generate(604, (index) => '${index + 1}.png');

  String getSurahImageUrl(int pageNum) {
    return '$baseUrl$pageNum.png';
  }
}
