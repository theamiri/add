import 'package:aidra_drive/core/common/use_case.dart';
import 'package:aidra_drive/core/error/failures.dart';
import 'package:aidra_drive/core/services/service_locator.dart';
import 'package:aidra_drive/features/authentication/domain/entities/signin_req_entity.dart';
import 'package:aidra_drive/features/authentication/domain/models/user_model.dart';
import 'package:aidra_drive/features/authentication/domain/use_cases/load_current_user_usecase.dart';
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

  AuthBloc() : super(AuthInitialState()) {
    on<AuthEvent>(
      (event, emit) async {
        if (event is SignInEvent) {
          emit(AuthenticatingState());
          final results = await _signInUseCase.call(event.reqEntity);
          results.fold(
            (l) => emit(AuthenticationFailureState(failure: l)),
            (r) => emit(AuthenticatedState(user: r)),
          );
        }
        if (event is SignOutEvent) {
          emit(AuthenticatingState());
          final results = await _signOutUseCase.call(NoParams());
          results.fold(
            (l) => emit(AuthenticationFailureState(failure: l)),
            (r) => emit(UnauthenticatedState()),
          );
        }

        if (event is LoadCurrentUserEvent) {
          final results = await _loadCurrentUserUseCase.call(NoParams());
          results.fold(
            (l) => emit(UnauthenticatedState()),
            (r) {
              if (r == null) {
                emit(UnauthenticatedState());
              } else {
                emit(AuthenticatedState(user: r));
              }
            },
          );
        }
      },
    );
  }
}
