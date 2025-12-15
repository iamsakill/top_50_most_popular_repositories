import 'package:hive/hive.dart';
import '../../core/network/api_client.dart';
import '../models/github_repo_model.dart';

class GithubRepository {
  final ApiClient api;
  final Box<GithubRepoModel> box;

  GithubRepository(this.api, this.box);

  Future<List<GithubRepoModel>> fetchRepos() async {
    try {
      final response = await api.getFlutterRepos();
      final items = response.data['items'] as List;

      final repos = items.map((e) => GithubRepoModel.fromJson(e)).toList();

      await box.clear();
      await box.addAll(repos);

      return repos;
    } catch (_) {
      return box.values.toList();
    }
  }
}
