// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskHiveAdapter extends TypeAdapter<TaskHive> {
  @override
  final int typeId = 0;

  @override
  TaskHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskHive(
      id: fields[0] as int?,
      text: fields[1] as String,
      isComplete: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TaskHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.isComplete);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
