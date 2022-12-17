import 'dart:convert';

class Pet {
  final int? id;
  final String title;
  final String content;
  final String date;
  Pet({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
  });

  Pet copyWith({
    int? id,
    String? title,
    String? content,
    String? date,
  }) {
    return Pet(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'date': date,
    };
  }

  factory Pet.fromMap(Map<String, dynamic> map) {
    return Pet(
      id: map['id']?.toInt(),
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      date: map['date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Pet.fromJson(String source) => Pet.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Pet(id: $id, title: $title, content: $content, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Pet &&
        other.id == id &&
        other.title == title &&
        other.content == content &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ content.hashCode ^ date.hashCode;
  }

  factory Pet.empty(id) {
    return Pet(
      id: 0,
      title: '',
      content: '',
      date: '',
    );
  }
}
