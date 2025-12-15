import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../data/models/github_repo_model.dart';

class RepoDetailsPage extends StatelessWidget {
  final GithubRepoModel repo;
  const RepoDetailsPage({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    final formattedDate =
        DateFormat("dd MMM yyyy 'at' hh:mm a").format(repo.updatedAt);

    return Scaffold(
      appBar: AppBar(title: Text(repo.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(repo.avatar),
                ),
                const SizedBox(width: 12),
                Text(
                  repo.owner,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(repo.description),
            const SizedBox(height: 16),
            Text('⭐ Stars: ${repo.stars}'),
            const SizedBox(height: 8),
            Text('Last Updated: $formattedDate'),
          ],
        ),
      ),
    );
  }
}
