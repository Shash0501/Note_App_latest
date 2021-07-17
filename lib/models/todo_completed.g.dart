// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_completed.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class todoscompletedAdapter extends TypeAdapter<todos_completed> {
  @override
  final int typeId = 2;

  @override
  todos_completed read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return todos_completed(
      title: fields[0] as String,
      description: fields[1] as String,
    )
      ..date = fields[2] as String
      ..status = fields[3] as bool;
  }

  @override
  void write(BinaryWriter writer, todos_completed obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is todoscompletedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
