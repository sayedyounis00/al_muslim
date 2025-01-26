import 'package:al_muslim/features/athkar/data/models/zkr_item.dart';

class AzkarModel {
  final int id;
  final String category;
  final String audio;
  final String filename;
  final List<ZkrItem> azkarList;

  AzkarModel({
    required this.id,
    required this.category,
    required this.audio,
    required this.filename,
    required this.azkarList,
  });

  factory AzkarModel.fromJson(Map<String, dynamic> json) {
    return AzkarModel(
      id: json['id'],
      category: json['category'],
      audio: json['audio'],
      filename: json['filename'],
      azkarList: (json['array'] as List)
          .map((item) => ZkrItem.fromJson(item))
          .toList(),
    );
  }


}
