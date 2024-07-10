// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ice_cream_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IceCreamAdapter extends TypeAdapter<IceCream> {
  @override
  final int typeId = 0;

  @override
  IceCream read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IceCream(
      orderImagePath: fields[6] as String,
      isFavorite: fields[4] as bool,
      popularity: fields[5] as int,
      name: fields[0] as String,
      price: fields[1] as double,
      description: fields[2] as String,
      imagePath: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, IceCream obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.imagePath)
      ..writeByte(4)
      ..write(obj.isFavorite)
      ..writeByte(5)
      ..write(obj.popularity)
      ..writeByte(6)
      ..write(obj.orderImagePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IceCreamAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
