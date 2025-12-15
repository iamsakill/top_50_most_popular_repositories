import 'package:hive/hive.dart';

part 'github_repo_model.g.dart';

@HiveType(typeId: 1)
class GithubRepoModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final int stars;

  @HiveField(4)
  final DateTime updatedAt;

  @HiveField(5)
  final String owner;

  @HiveField(6)
  final String avatar;

  GithubRepoModel({
    required this.id,
    required this.name,
    required this.description,
    required this.stars,
    required this.updatedAt,
    required this.owner,
    required this.avatar,
  });

  factory GithubRepoModel.fromJson(Map<String, dynamic> json) {
    return GithubRepoModel(
      id: json['id'],
      name: json['name'],
      description: json['description'] ?? '',
      stars: json['stargazers_count'],
      updatedAt: DateTime.parse(json['updated_at']),
      owner: json['owner']['login'],
      avatar: json['owner']['avatar_url'],
    );
  }
}
