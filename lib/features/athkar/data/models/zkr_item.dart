class ZkrItem {
  final int id;
  final String text;
  final int count;
  final String audio;
  final String filename;

  ZkrItem({
    required this.id,
    required this.text,
    required this.count,
    required this.audio,
    required this.filename,
  });

  factory ZkrItem.fromJson(Map<String, dynamic> json) {
    return ZkrItem(
      id: json['id'],
      text: json['text'],
      count: json['count'],
      audio: json['audio'],
      filename: json['filename'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'count': count,
      'audio': audio,
      'filename': filename,
    };
  }
}
