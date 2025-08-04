class Search {
  String id;

  String title;
  String content;
  String write;
  String imageUrl;
  DateTime createdAt;

  Search({
    required this.id,
    required this.title,
    required this.content,
    required this.write,
    required this.imageUrl,
    required this.createdAt,
  });
  //
  Search.fromJson(Map<String, dynamic> map)
    : this(
        id: map['id'],
        title: map['title'],
        content: map['content'],
        write: map['write'],
        imageUrl: map['imageUrl'],
        createdAt: DateTime.parse('createdAt'),
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'write': write,
      'imageUrl': imageUrl,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
