import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio = Dio(
    BaseOptions(baseUrl: 'https://api.github.com'),
  );

  Future<Response> getFlutterRepos() async {
    return dio.get(
      '/search/repositories',
      queryParameters: {
        'q': 'Flutter',
        'per_page': 50,
        'sort': 'stars',
        'order': 'desc',
      },
    );
  }
}
