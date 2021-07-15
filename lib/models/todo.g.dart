// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class todosAdapter extends TypeAdapter<todos> {
  @override
  final int typeId = 0;

  @override
  todos read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return todos(
      title: fields[0] as String,
      description: fields[1] as String,
    )
      ..date = fields[2] as String
      ..status = fields[3] as bool;
  }

  @override
  void write(BinaryWriter writer, todos obj) {
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
      other is todosAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
