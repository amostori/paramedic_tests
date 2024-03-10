// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_db_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WordDBModelAdapter extends TypeAdapter<WordDBModel> {
  @override
  final int typeId = 1;

  @override
  WordDBModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WordDBModel(
      fields[0] as String,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WordDBModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.question)
      ..writeByte(1)
      ..write(obj.answer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordDBModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
