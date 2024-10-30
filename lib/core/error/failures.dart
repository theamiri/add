import 'package:aidra_drive/core/constant/strings.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}

class CacheFailure extends Failure {
  const CacheFailure({super.message = Strings.storageFailureMessage});
}

class NetworkFailure extends Failure {
  const NetworkFailure({super.message = Strings.networkFailureMessage});
}

class BiometricFailure extends Failure {
  const BiometricFailure({super.message = Strings.biometricFailureMessage});
}

class UnknownFailure extends Failure {
  const UnknownFailure({super.message = Strings.unknownFailureMessage});
}
