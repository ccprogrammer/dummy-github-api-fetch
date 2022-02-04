class IssuesModel {
  int id;
  String title;
  String avatarUrl;
  String updatedAt;
  String state;

  IssuesModel({
    required this.title,
    required this.id,
    required this.avatarUrl,
    required this.updatedAt,
    required this.state,
  });

  factory IssuesModel.fromJson(Map<String, dynamic> json) => IssuesModel(
        id: json["id"],
        title: json["title"],
        avatarUrl: json["user"]["avatar_url"],
        updatedAt: json["updated_at"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "avatar_url": avatarUrl,
        "updated_at": updatedAt,
        "state": state,
      };
}
