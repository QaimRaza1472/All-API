import 'dart:convert';
import 'dart:convert';


List<GetData> getDataFromJson(var str) => List<GetData>.from(json.decode(str).map((x) => GetData.fromJson(x)));

String getDataToJson(List<GetData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetData {
  int? userId;
  int? id;
  String? title;

  GetData({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory GetData.fromJson(Map<String, dynamic> json) => GetData(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
  };
}
