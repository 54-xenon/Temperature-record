// 自動生成さされるファイル
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TemperatureDataAdapter extends TypeAdapter<TemperatureData> {
  @override
  final int typeId = 0;

  @override
  TemperatureData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TemperatureData(
      fields[0] as DateTime,
      fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, TemperatureData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.temperature);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TemperatureDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
