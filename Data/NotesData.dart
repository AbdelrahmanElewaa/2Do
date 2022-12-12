import '../Model/note_model.dart';

final Map<String, int> categories = {
  'Notes': 4,
};

final List<Note> notes = [
  Note(
    title: 'Lecture new',
    content: 'Why people wadhasjdgashjdgasjhdgashjgdasjhdgajhsdgajhdgasjhdgasjhdgasjhdgasjhdgashjdgahjdgajhsgdasjhgdahsjdgajshgda',
    date: DateTime(2022, 10, 29, 3, 30),
  ),
  Note(
    title: 'Math',
    content: 'y=mx+b',
    date: DateTime(2022, 10, 30, 3, 30),
  ),
];
