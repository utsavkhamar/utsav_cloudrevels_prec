import 'dart:convert';
import '../models/Blogs.dart';
import 'package:http/http.dart' as http;
import 'Utils/app_urls.dart';

class ListViewData {
  String title, url, description, categories, createdAt;
  int UserId;

  ListViewData(
      {required this.title,
      required this.url,
      required this.UserId,
      required this.description,
      required this.categories,
        required this.createdAt
      });
}

class StatesService {
  Future<Blogs> fetchBlogData() async {
    var data;

    final response = await http.get(Uri.parse(AppUrls.detailViewApi));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Error');
    }
  }
}
