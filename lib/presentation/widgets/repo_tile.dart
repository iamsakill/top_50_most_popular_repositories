import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/models/github_repo_model.dart';
import '../pages/repo_details_page.dart';

class RepoTile extends StatelessWidget {
  final GithubRepoModel repo;

  const RepoTile({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    final formattedDate =
        DateFormat("dd MMM yyyy 'at' hh:mm a").format(repo.updatedAt);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(repo.avatar),
        ),
        title: Text(
          repo.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Owner: ${repo.owner}'),
            const SizedBox(height: 4),
            Text(
              'Last Updated: $formattedDate',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.star, size: 16),
            Text(repo.stars.toString()),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => RepoDetailsPage(repo: repo),
            ),
          );
        },
      ),
    );
  }
}
