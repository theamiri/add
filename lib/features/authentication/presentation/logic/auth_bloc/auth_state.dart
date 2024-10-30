part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitialState extends AuthState {}

final class AuthenticatingState extends AuthState {}

final class AuthenticationFailureState extends AuthState {
  final Failure failure;
  const AuthenticationFailureState({required this.failure});
}

class AuthenticatedState extends AuthState {
  final UserModel user;
  const AuthenticatedState({required this.user});
}

class UnauthenticatedState extends AuthState {}

class NoUserCredentialsFoundState extends AuthState {}

class UserCredentialsLoadedState extends AuthState {
  final CredentialsModel credentials;
  const UserCredentialsLoadedState({required this.credentials});
}
