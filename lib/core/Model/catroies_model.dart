class CatroiesModel {
  String? text;
  String? uId;
  String? catoiesImage;
  String? dateTime;

  CatroiesModel({
    required this.text,
    required this.uId,
    required this.catoiesImage,
    required this.dateTime,
  });
  CatroiesModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    catoiesImage = json['catoiesImage'];
    uId = json['uId'];
    dateTime = json['dateTime'];
  }
  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'text': text,
      'catoiesImage': catoiesImage,
      'dateTime': dateTime,
    };
  }
}
