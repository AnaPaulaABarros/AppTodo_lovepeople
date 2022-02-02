class ListTodo {
    int? id;
    String? title;
    String? description;
    bool? completed;
    String? color;
    String? publishedAt;
    String? createdAt;
    String? updatedAt;

    ListTodo({this.id, this.title, this.description, this.completed, this.color, this.publishedAt, this.createdAt, this.updatedAt});

    ListTodo.fromJson(Map<String, dynamic> json) {
        this.id = json["id"];
        this.title = json["title"];
        this.description = json["description"];
        this.completed = json["completed"];
        this.color = json["color"];
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
        data["published_at"] = this.publishedAt;
        data["created_at"] = this.createdAt;
        data["updated_at"] = this.updatedAt;
        return data;
    }
}