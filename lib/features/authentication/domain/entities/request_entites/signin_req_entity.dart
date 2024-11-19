class SignInRequestEntity {
  final String email;
  final String password;

  const SignInRequestEntity({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'user_email': email,
      'pass': password,
    };
  }
}
