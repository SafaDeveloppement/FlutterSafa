import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
    String imagePost;
    String? description;
    String ?postCountry;
    DateTime date;
    String owner;

    Post({
        required this.imagePost,
         this.description,
         this.postCountry,
        required this.date,
        required this.owner,
    });

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        imagePost: json["image_post"],
        description: json["description"],
        postCountry: json["post_country"],
        date: DateTime.parse(json["date"]),
        owner: json["owner"],
    );

    Map<String, dynamic> toJson() => {
        "image_post": imagePost,
        "description": description,
        "post_country": postCountry,
        "date": date.toIso8601String(),
        "owner": owner,
    };
}
