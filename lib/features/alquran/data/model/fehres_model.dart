class SwarModel {
  final int id;
  final String name;
  // final int startPage;
  // final int numOfayat = 0;
  // final int type;

  SwarModel({
    required this.id,
    required this.name,
    // required this.startPage,
    // required this.type,
  });
  factory SwarModel.fromJson(json) {
    return SwarModel(
      id: json['id'],
      name: json['name'],
      // startPage: json['start_page'],
      // //?if type==0 so suura is mekka || if type==1 surah is madina
      // type: json['type'],
    );
  }
}
