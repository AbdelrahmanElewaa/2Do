// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TaskDataHive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoHiveAdapter extends TypeAdapter<TodoHive> {
  @override
  final int typeId = 0;

  @override
  TodoHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoHive(
      tods: (fields[0] as List).cast<Todo>(),
    );
  }

  @override
  void write(BinaryWriter writer, TodoHive obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.tods);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
