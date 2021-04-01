import 'dart:convert';

UserModel userModelFromMap(String str) => UserModel.fromMap(json.decode(str));

String userModelToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
  final String name;
  final String login;
  final String avatarUrl;
  final String bio;
  final String location;
  final String email;
  final String url;
  final StarredRepositories starredRepositories;

  UserModel({
    this.name,
    this.login,
    this.avatarUrl,
    this.bio,
    this.location,
    this.email,
    this.url,
    this.starredRepositories,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        name: json["name"] == null ? "" : json["name"],
        login: json["login"] == null ? "" : json["login"],
        avatarUrl: json["avatarUrl"] == null ? "" : json["avatarUrl"],
        bio: json["bio"] == null ? "" : json["bio"],
        location: json["location"] == null ? "" : json["location"],
        email: json["email"] == null ? "" : json["email"],
        url: json["url"] == null ? "" : json["url"],
        starredRepositories: json["starredRepositories"] == null
            ? ""
            : StarredRepositories.fromMap(json["starredRepositories"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name == null ? "" : name,
        "login": login == null ? "" : login,
        "avatarUrl": avatarUrl == null ? "" : avatarUrl,
        "bio": bio == null ? null : bio,
        "location": location == null ? "" : location,
        "email": email == null ? "" : email,
        "url": url == null ? "" : url,
        "starredRepositories":
            starredRepositories == null ? "" : starredRepositories.toMap(),
      };

  @override
  String toString() {
    return this.toMap().toString();
  }
}

class StarredRepositories {
  StarredRepositories({
    this.nodes,
  });

  final List<Node> nodes;

  factory StarredRepositories.fromMap(Map<String, dynamic> json) =>
      StarredRepositories(
        nodes: json["nodes"] == null
            ? null
            : List<Node>.from(json["nodes"].map((x) => Node.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "nodes": nodes == null
            ? null
            : List<dynamic>.from(nodes.map((x) => x.toMap())),
      };

  @override
  String toString() {
    return this.toMap().toString();
  }
}

class Node {
  Node({
    this.name,
    this.description,
    this.url,
  });

  final String name;
  final String description;
  final String url;

  factory Node.fromMap(Map<String, dynamic> json) => Node(
        name: json["name"] == null ? "" : json["name"],
        description: json["description"] == null ? "" : json["description"],
        url: json["url"] == null ? "" : json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name == null ? "" : name,
        "description": description == null ? "" : description,
        "url": url == null ? "" : url,
      };

  @override
  String toString() {
    return this.toMap().toString();
  }
}
