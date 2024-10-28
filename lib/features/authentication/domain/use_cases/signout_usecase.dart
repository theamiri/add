import 'package:aidra_drive/core/common/use_case.dart';
import 'package:aidra_drive/core/error/failures.dart';
import 'package:aidra_drive/core/services/service_locator.dart';
import 'package:aidra_drive/features/authentication/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignOutUseCase implements UseCase<void, NoParams> {
  final _repository = sl<AuthRepository>();

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await _repository.signOut();
  }
}
