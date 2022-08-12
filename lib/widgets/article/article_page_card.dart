// ignore_for_file: unnecessary_this, prefer_collection_literals

class ArticleList {
  String? title = '';
  String? description = '';
  String? mainDes = '';
  // String? timestamp = '';
  // late bool? paymentStatus;
  // int? mealPrice = 10;

  ArticleList({
    required this.title,
    required this.description,
    required this.mainDes,
    // required this.timestamp,
    // required this.paymentStatus,
    // required this.mealPrice
  });

  ArticleList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];

    mainDes = json['mainDes'];
    // timestamp = json['timestamp'];
    // paymentStatus = json['paymentStatus'];
    // mealPrice = json['mealPrice'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;

    data['mainDes'] = this.mainDes;
    // data['timestamp'] = this.timestamp;
    // data['paymentStatus'] = this.paymentStatus;
    // data['mealPrice'] = this.mealPrice;
    return data;
  }
}
