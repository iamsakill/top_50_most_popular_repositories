import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/repo_provider.dart';
import '../providers/sort_provider.dart';
import '../widgets/repo_tile.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reposAsync = ref.watch(repoProvider);
    final sort = ref.watch(sortProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Repositories'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () => ref.read(sortProvider.notifier).toggle(),
          ),
        ],
      ),
      body: reposAsync.when(
        data: (repos) {
          repos.sort((a, b) => sort == SortType.stars
              ? b.stars.compareTo(a.stars)
              : b.updatedAt.compareTo(a.updatedAt));

          return ListView.builder(
            itemCount: repos.length,
            itemBuilder: (_, i) => RepoTile(repo: repos[i]),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const Center(child: Text('Failed to load data')),
      ),
    );
  }
}
