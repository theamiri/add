import 'package:aidra_drive/core/common/use_case.dart';
import 'package:aidra_drive/core/error/failures.dart';
import 'package:aidra_drive/core/services/service_locator.dart';
import 'package:aidra_drive/features/authentication/domain/models/credentials_model.dart';
import 'package:aidra_drive/features/authentication/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoadUserCredentialsUseCase
    implements UseCase<CredentialsModel?, NoParams> {
  final _repository = sl<AuthRepository>();
  @override
  Future<Either<Failure, CredentialsModel?>> call(NoParams params) async {
    return await _repository.loadUserCredentials();
  }
}
