part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

//initial
final class AuthInitialState extends AuthState {}

//loading
final class AuthenticatingState extends AuthState {}

//failure
final class AuthenticationFailureState extends AuthState {
  final Failure failure;
  const AuthenticationFailureState({required this.failure});
}

class AuthenticatedState extends AuthState {
  final UserModel user;
  const AuthenticatedState({required this.user});
}

class UnauthenticatedState extends AuthState {}
