// ignore_for_file: unnecessary_this

class RegisterTodo {
  int? id;
  String? title;
  String? description;
  bool? completed;
  String? color;
  User? user;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;

  RegisterTodo(
      {this.id,
      this.title,
      this.description,
      this.completed,
      this.color,
      this.user,
      this.publishedAt,
      this.createdAt,
      this.updatedAt});

  RegisterTodo.fromJson(Map<String, dynamic> json) {
    // ignore: unnecessary_this
    this.id = json["id"];
    this.title = json["title"];
    // ignore: unnecessary_this
    this.description = json["description"];
    this.completed = json["completed"];
    this.color = json["color"];
    this.user = json["user"] == null ? null : User.fromJson(json["user"]);
    this.publishedAt = json["published_at"];
    this.createdAt = json["created_at"];
    this.updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["title"] = this.title;
    data["description"] = this.description;
    data["completed"] = this.completed;
    data["color"] = this.color;
    if (this.user != null)
      // ignore: curly_braces_in_flow_control_structures
      data["user"] = this.user?.toJson();
    data["published_at"] = this.publishedAt;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}

class User {
  User();

  // ignore: empty_constructor_bodies
  User.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals, unnecessary_new
    final Map<String, dynamic> data = new Map<String, dynamic>();

    return data;
  }
}
