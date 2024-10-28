import 'package:aidra_drive/core/error/failures.dart';
import 'package:aidra_drive/features/authentication/domain/entities/signin_req_entity.dart';
import 'package:aidra_drive/features/authentication/domain/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel>> singIn({
    required SignInRequestEntity reqEntity,
  });
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, UserModel?>> loadCurrentUser();
}
