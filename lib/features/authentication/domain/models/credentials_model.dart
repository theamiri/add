import 'dart:convert';

class CredentialsModel {
  final String email;
  final String password;

  CredentialsModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'user_email': email,
      'pass': password,
    };
  }

  factory CredentialsModel.fromJson(Map<String, dynamic> json) {
    return CredentialsModel(
      email: json['user_email'],
      password: json['pass'],
    );
  }

  String toJsonString() => jsonEncode(toJson());

  factory CredentialsModel.fromJsonString(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return CredentialsModel.fromJson(json);
  }

  @override
  String toString() {
    return 'CredentialsModel(user_email: $email, pass: $password)';
  }
}
