import 'dart:convert';

import 'package:top_repo/home/home_data/top_repositories.dart';
import 'package:top_repo/network/dio_client.dart';

class HomeDataSource {
  final _homeClient = DioClient();

  Future<TopRepositories> getRepos(String topic, int page) async {
    final result = await _homeClient.get(
      path: "https://api.github.com/search/repositories",
      queryParams: {'q': topic, 'per_page': page},
    );
    final topRepositories = TopRepositories.fromJson(jsonDecode(result.data));
    return topRepositories;
  }
}
