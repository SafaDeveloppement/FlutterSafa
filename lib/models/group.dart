
import 'dart:convert';

Group groupFromJson(String str) => Group.fromJson(json.decode(str));

String groupToJson(Group data) => json.encode(data.toJson());

class Group {
    String groupName;
    String imageGroup;
    String ownerGroup;
    String id;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    Group({
        required this.groupName,
        required this.imageGroup,
        required this.ownerGroup,
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory Group.fromJson(Map<String, dynamic> json) => Group(
        groupName: json["groupName"],
        imageGroup: json["image_group"],
        ownerGroup: json["ownerGroup"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "groupName": groupName,
        "image_group": imageGroup,
        "ownerGroup": ownerGroup,
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
