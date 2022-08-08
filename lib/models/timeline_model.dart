// ignore_for_file: unnecessary_this

class TimeLineList {
  String? title = '';
  String? timeline = '';

  TimeLineList({
    required this.title,
    required this.timeline,
  });

  TimeLineList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    timeline = json['timeline'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['timeline'] = this.timeline;

    return data;
  }
}
