class RatingModel {
  final String userName;
  final double rateValue;
  final String describe;
  final String image;
  final String uid;
  final String documentId;
  final DateTime date;
  RatingModel._(
      {required this.userName,
      required this.documentId,
      required this.date,
      required this.uid,
      required this.rateValue,
      required this.describe,
      required this.image});
  factory RatingModel.fromjson({required Map<String, dynamic> rate}) {
    return RatingModel._(
        describe: rate[kDescribeRating],
        userName: rate[kUserName],
        rateValue: double.parse(rate[kRateValue]),
        image: rate[kImage],
        uid: rate["uid"],
        date: rate['dateTime'].toDate(),
        documentId: rate['documentId']);
  }
}

const String kDescribeRating = "describeRating";
const String kUserName = "userName";
const String kRateValue = "rateValue";
const String kImage = "image";
