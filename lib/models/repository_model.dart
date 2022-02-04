class RepositoryModel {
  int id;
  String title;
  String avatarUrl;
  DateTime createdAt;
  int watchersCount;
  int star;
  int forksCount;

  RepositoryModel({
    required this.title,
    required this.id,
    required this.avatarUrl,
    required this.createdAt,
    required this.watchersCount,
    required this.star,
    required this.forksCount,
  });

  factory RepositoryModel.fromJson(Map<String, dynamic> json) =>
      RepositoryModel(
        id: json["id"],
        title: json["full_name"],
        avatarUrl: json["owner"]["avatar_url"],
        createdAt: DateTime.parse(json["created_at"]),
        watchersCount: json["watchers_count"],
        star: json["stargazers_count"],
        forksCount: json["forks_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": title,
        "avatar_url": avatarUrl,
        "created_at": createdAt,
        "watchers_count": watchersCount,
        "stargazers_count": star,
        "forks_count": forksCount,
      };
}
