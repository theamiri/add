import 'package:aidra_drive/core/common/use_case.dart';
import 'package:aidra_drive/core/error/failures.dart';
import 'package:aidra_drive/core/services/service_locator.dart';
import 'package:aidra_drive/features/authentication/domain/entities/signin_req_entity.dart';
import 'package:aidra_drive/features/authentication/domain/models/credentials_model.dart';
import 'package:aidra_drive/features/authentication/domain/models/user_model.dart';
import 'package:aidra_drive/features/authentication/domain/use_cases/load_current_user_usecase.dart';
import 'package:aidra_drive/features/authentication/domain/use_cases/load_user_credentials_usecase.dart';
import 'package:aidra_drive/features/authentication/domain/use_cases/signin_usecase.dart';
import 'package:aidra_drive/features/authentication/domain/use_cases/signout_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _signInUseCase = sl<SignInUseCase>();
  final _signOutUseCase = sl<SignOutUseCase>();
  final _loadCurrentUserUseCase = sl<LoadCurrentUserUseCase>();
  final _loadUserCredentialsUseCase = sl<LoadUserCredentialsUseCase>();

  AuthBloc() : super(AuthInitialState()) {
    on<SignInEvent>(_onSignIn);
    on<SignOutEvent>(_onSignOut);
    on<LoadCurrentUserEvent>(_onLoadCurrentUser);
    on<LoadUserCredentialsEvent>(_onLoadUserCredentials);
  }

  Future<void> _onSignIn(SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthenticatingState());
    final results = await _signInUseCase.call(event.reqEntity);
    results.fold(
      (failure) => emit(AuthenticationFailureState(failure: failure)),
      (user) => emit(AuthenticatedState(user: user)),
    );
  }

  Future<void> _onSignOut(SignOutEvent event, Emitter<AuthState> emit) async {
    emit(AuthenticatingState());
    final results = await _signOutUseCase.call(NoParams());
    results.fold(
      (failure) => emit(AuthenticationFailureState(failure: failure)),
      (user) => emit(UnauthenticatedState()),
    );
  }

  Future<void> _onLoadCurrentUser(
      LoadCurrentUserEvent event, Emitter<AuthState> emit) async {
    emit(AuthenticatingState());
    final currentDate = DateTime.now();
    final results = await _loadCurrentUserUseCase.call(NoParams());
    results.fold(
      (failure) => emit(UnauthenticatedState()),
      (user) {
        if (user == null) {
          emit(UnauthenticatedState());
        } else {
          if (user.expireDate == null &&
              currentDate.isAfter(
                DateTime.parse(user.expireDate!),
              )) {
            emit(UnauthenticatedState());
          } else {
            emit(AuthenticatedState(user: user));
          }
        }
      },
    );
  }

  Future<void> _onLoadUserCredentials(
      LoadUserCredentialsEvent event, Emitter<AuthState> emit) async {
    final results = await _loadUserCredentialsUseCase.call(NoParams());
    results.fold(
      (l) => emit(AuthenticationFailureState(failure: l)),
      (credentials) {
        credentials == null
            ? emit(NoUserCredentialsFoundState())
            : emit(UserCredentialsLoadedState(credentials: credentials));
      },
    );
  }
}
