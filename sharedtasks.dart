import 'dart:convert';

import 'package:collection/collection.dart';

class Sharedtasks {
  String? shared;
  DateTime? reminder;
  String? name;
  String? checked;
  String? description;
  int? id;
  String? category;

  Sharedtasks({
    this.shared,
    this.reminder,
    this.name,
    this.checked,
    this.description,
    this.id,
    this.category,
  });

  @override
  String toString() {
    return 'Sharedtasks(shared: $shared, reminder: $reminder, name: $name, checked: $checked, description: $description, id: $id, category: $category)';
  }

  factory Sharedtasks.fromMap(Map<String, dynamic> data) => Sharedtasks(
        shared: data['shared'] as String?,
        reminder: data['reminder'] == null
            ? null
            : DateTime.parse(data['reminder'] as String),
        name: data['name'] as String?,
        checked: data['checked'] as String?,
        description: data['description'] as String?,
        id: data['id'] as int?,
        category: data['category'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'shared': shared,
        'reminder': reminder?.toIso8601String(),
        'name': name,
        'checked': checked,
        'description': description,
        'id': id,
        'category': category,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Sharedtasks].
  factory Sharedtasks.fromJson(String data) {
    return Sharedtasks.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Sharedtasks] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Sharedtasks) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      shared.hashCode ^
      reminder.hashCode ^
      name.hashCode ^
      checked.hashCode ^
      description.hashCode ^
      id.hashCode ^
      category.hashCode;
}
