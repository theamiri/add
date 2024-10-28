import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String? accessToken;

  @HiveField(1)
  String? expireDate;

  @HiveField(2)
  int? id;

  @HiveField(3)
  String? email;

  @HiveField(4)
  String? password;

  @HiveField(5)
  String? firstName;

  @HiveField(6)
  String? lastName;

  @HiveField(7)
  String? phone;

  @HiveField(8)
  String? image;

  @HiveField(9)
  CurrencyModel? currency;

  UserModel(
      {this.accessToken,
      this.expireDate,
      this.id,
      this.email,
      this.password,
      this.firstName,
      this.lastName,
      this.phone,
      this.image,
      this.currency});

  UserModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    expireDate = json['expire_date'];
    id = json['id'];
    email = json['email'];
    password = json['password'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    image = json['image'];
    currency = json['currency'] != null
        ? CurrencyModel.fromJson(json['currency'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['expire_date'] = expireDate;
    data['id'] = id;
    data['email'] = email;
    data['password'] = password;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone'] = phone;
    data['image'] = image;
    if (currency != null) {
      data['currency'] = currency!.toJson();
    }
    return data;
  }
}

@HiveType(typeId: 1)
class CurrencyModel extends HiveObject {
  @HiveField(0)
  String? sign;

  @HiveField(1)
  String? value;

  CurrencyModel({this.sign, this.value});

  CurrencyModel.fromJson(Map<String, dynamic> json) {
    sign = json['sign'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sign'] = sign;
    data['value'] = value;
    return data;
  }
}
