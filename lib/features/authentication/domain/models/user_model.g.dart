// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      accessToken: fields[0] as String?,
      expireDate: fields[1] as String?,
      id: fields[2] as int?,
      email: fields[3] as String?,
      password: fields[4] as String?,
      firstName: fields[5] as String?,
      lastName: fields[6] as String?,
      phone: fields[7] as String?,
      image: fields[8] as String?,
      currency: fields[9] as CurrencyModel?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.accessToken)
      ..writeByte(1)
      ..write(obj.expireDate)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.password)
      ..writeByte(5)
      ..write(obj.firstName)
      ..writeByte(6)
      ..write(obj.lastName)
      ..writeByte(7)
      ..write(obj.phone)
      ..writeByte(8)
      ..write(obj.image)
      ..writeByte(9)
      ..write(obj.currency);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CurrencyModelAdapter extends TypeAdapter<CurrencyModel> {
  @override
  final int typeId = 1;

  @override
  CurrencyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrencyModel(
      sign: fields[0] as String?,
      value: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CurrencyModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.sign)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
