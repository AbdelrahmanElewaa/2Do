import 'dart:convert';

class SharedNote {
  final String? id;
  final String title;
  final String content;
  final String date;
  SharedNote({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
  });

  SharedNote copyWith({
    String? id,
    String? title,
    String? content,
    String? date,
  }) {
    return SharedNote(
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

  factory SharedNote.fromMap(Map<String, dynamic> map) {
    return SharedNote(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      date: map['date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SharedNote.fromJson(String source) => SharedNote.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SharedNote(id: $id, title: $title, content: $content, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SharedNote &&
        other.id == id &&
        other.title == title &&
        other.content == content &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ content.hashCode ^ date.hashCode;
  }

  factory SharedNote.empty(id) {
    return SharedNote(
      id: '',
      title: '',
      content: '',
      date: '',
    );
  }
}
