class Blogs {
  Blogs({
      required this.userId,
      required this.title,
      required this.contentText,
      required this.photoUrl,
      required this.createdAt,
      required this.id,
      required this.description,
      required this.contentHtml,
      required this.category,
      required this.updatedAt,});

  Blogs.fromJson(dynamic json) {
    userId = json['user_id'];
    title = json['title'];
    contentText = json['content_text'];
    photoUrl = json['photo_url'];
    createdAt = json['created_at'];
    id = json['id'];
    description = json['description'];
    contentHtml = json['content_html'];
    category = json['category'];
    updatedAt = json['updated_at'];
  }
  int ?userId;
  String ?title;
  String ?contentText;
  String ?photoUrl;
  String ?createdAt;
  int ?id;
  String ?description;
  String ?contentHtml;
  String ?category;
  String ?updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['title'] = title;
    map['content_text'] = contentText;
    map['photo_url'] = photoUrl;
    map['created_at'] = createdAt;
    map['id'] = id;
    map['description'] = description;
    map['content_html'] = contentHtml;
    map['category'] = category;
    map['updated_at'] = updatedAt;
    return map;
  }

}