class Note {
  String title;
  String content;
  DateTime date;

  Note({required this.title, required this.content, required this.date});
}

final Map<String, int> categories = {
  'Notes': 4,
};

final List<Note> notes = [
  Note(
    title: 'Lecture Notes',
    content: 'Why people walk at the Park',
    date: DateTime(2022, 10, 29, 3, 30),
  ),
  Note(
    title: 'Math',
    content: 'y=mx+b',
    date: DateTime(2022, 10, 30, 3, 30),
  ),
];
