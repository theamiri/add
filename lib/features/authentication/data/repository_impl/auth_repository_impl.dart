import 'package:aidra_drive/core/error/exception_failure_adapter.dart';
import 'package:aidra_drive/core/error/failures.dart';
import 'package:aidra_drive/core/services/service_locator.dart';
import 'package:aidra_drive/features/authentication/data/data_source/auth_local_datasource.dart';
import 'package:aidra_drive/features/authentication/data/data_source/auth_remote_datasource.dart';
import 'package:aidra_drive/features/authentication/domain/entities/signin_req_entity.dart';
import 'package:aidra_drive/features/authentication/domain/models/user_model.dart';
import 'package:aidra_drive/features/authentication/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  final _remoteDataSource = sl<AuthRemoteDataSource>();
  final _localDataSource = sl<AuthLocalDataSource>();

  @override
  Future<Either<Failure, UserModel>> singIn({
    required SignInRequestEntity reqEntity,
  }) async {
    try {
      final response = await _remoteDataSource.signin(body: reqEntity.toJson());
      final user = UserModel.fromJson(response);
      await _localDataSource.addUser(user);
      return right(user);
    } catch (e) {
      return left(ExceptionFailureAdapter.adapt(e));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _localDataSource.deleteUser();
      return right(null);
    } catch (e) {
      return left(ExceptionFailureAdapter.adapt(e));
    }
  }

  @override
  Future<Either<Failure, UserModel?>> loadCurrentUser() async {
    try {
      final user = await _localDataSource.fetchUser();
      return right(user);
    } catch (e) {
      return left(ExceptionFailureAdapter.adapt(e));
    }
  }
}