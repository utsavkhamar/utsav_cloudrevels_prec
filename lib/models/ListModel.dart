import 'Blogs.dart';

class ListModel {
  ListModel({
      required this.success,
      required this.totalBlogs,
      required this.message,
      required this.offset,
      required this.limit,
      required this.blogs,});

  ListModel.fromJson(dynamic json) {
    success = json['success'];
    totalBlogs = json['total_blogs'];
    message = json['message'];
    offset = json['offset'];
    limit = json['limit'];
    if (json['blogs'] != null) {
      blogs = [];
      json['blogs'].forEach((v) {
        blogs!.add(Blogs.fromJson(v));
      });
    }
  }
  bool ?success;
  int ?totalBlogs;
  String ?message;
  int ?offset;  int ?limit;
  List<Blogs> ?blogs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['total_blogs'] = totalBlogs;
    map['message'] = message;
    map['offset'] = offset;
    map['limit'] = limit;
    return map;
  }

}