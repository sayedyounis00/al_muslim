class QuranImagesServices {
  final String baseUrl =
      'https://raw.githubusercontent.com/Mohamed-Nagdy/Quran-App-Data/main/quran_images/';

  String getSurahImageUrl(int pageNum) {
    return '$baseUrl$pageNum.png';
  }
}
