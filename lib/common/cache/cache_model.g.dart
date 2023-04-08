// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CacheModelAdapter extends TypeAdapter<CacheModel> {
  @override
  final int typeId = 3;

  @override
  CacheModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CacheModel(
      url: fields[0] as String,
      expired: fields[1] as DateTime,
      jsonData: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CacheModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.expired)
      ..writeByte(2)
      ..write(obj.jsonData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CacheModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
