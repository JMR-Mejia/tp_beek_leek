import 'dart:convert';

Photo albumFromJson(String str) => Photo.fromJson(json.decode(str));

String albumToJson(Photo data) => json.encode(data.toJson());

class Photo {
    Photo({
        required this.id,
        required this.title,
        required this.url,
    });

    int id;
    String title;
    String url;

    factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        title: json["title"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "url": url,
    };
}
