class Shrdtasks {
  String? shared;
  DateTime? reminder;
  String? name;
  String? checked;
  String? description;
  int? id;
  String? category;

  Shrdtasks({
    this.shared,
    this.reminder,
    this.name,
    this.checked,
    this.description,
    this.id,
    this.category,
  });

  factory Shrdtasks.fromJson(Map<String, dynamic> json) => Shrdtasks(
        shared: json['shared'] as String?,
        reminder: json['reminder'] == null
            ? null
            : DateTime.parse(json['reminder'] as String),
        name: json['name'] as String?,
        checked: json['checked'] as String?,
        description: json['description'] as String?,
        id: json['id'] as int?,
        category: json['category'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'shared': shared,
        'reminder': reminder?.toIso8601String(),
        'name': name,
        'checked': checked,
        'description': description,
        'id': id,
        'category': category,
      };
}
