import 'dart:convert';

import '../models/Blogs.dart';
import '../models/ListModel.dart';
import 'package:http/http.dart' as http;

import 'Utils/app_urls.dart';

class StatesService {
  Future<ListModel> fetchListViewData() async {
    final response = await http.get(Uri.parse(AppUrls.listApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return ListModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

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
