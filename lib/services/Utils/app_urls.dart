class AppUrls {
  static const String baseUrl =
      'https://api.slingacademy.com/v1/sample-data/blog-posts?';

  static const int offset = 5;
  static const int limit = 30;
  static const int page = 1;

  static const String listApi = '${baseUrl}offset=$offset&limit=$limit';
  static const String detailViewApi = 'https://api.slingacademy.com/v1/sample-data/blog-posts/1';
}
