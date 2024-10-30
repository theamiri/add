part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignInEvent extends AuthEvent {
  final SignInRequestEntity reqEntity;
  const SignInEvent({required this.reqEntity});
}

class SignOutEvent extends AuthEvent {}

class LoadCurrentUserEvent extends AuthEvent {}

class LoadUserCredentialsEvent extends AuthEvent {}
