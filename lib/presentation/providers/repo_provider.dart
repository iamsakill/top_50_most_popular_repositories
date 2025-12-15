import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../core/network/api_client.dart';
import '../../data/models/github_repo_model.dart';
import '../../data/repositories/github_repository.dart';

final repoProvider = FutureProvider<List<GithubRepoModel>>((ref) async {
  final repo = GithubRepository(
    ApiClient(),
    Hive.box<GithubRepoModel>('repos'),
  );
  return repo.fetchRepos();
});
