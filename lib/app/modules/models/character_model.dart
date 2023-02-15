class Character {
  int id;
  String name;
  String description;
  String thumbnailUrl;
  List <String> comics;
  List <String> series;

  Character({required this.id, required this.name, required this.description, required this.thumbnailUrl, required this.comics, required this.series});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      comics: (json['comics']['items'] as List).map((e) => e['name'] as String).toList(),
      series: (json['series']['items'] as List).map((e) => e['name'] as String).toList(),
      thumbnailUrl:
      '${json['thumbnail']['path']}.${json['thumbnail']['extension']}',
    );
  }
}
