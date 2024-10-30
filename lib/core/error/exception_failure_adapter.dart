import 'package:aidra_drive/core/api/api_exception.dart';
import 'package:aidra_drive/core/error/failures.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:aidra_drive/core/constant/strings.dart';
import 'dart:io';
import 'package:local_auth/error_codes.dart' as auth_error;

abstract class ExceptionFailureAdapter {
  static Failure adapt(dynamic e) {
    if (e is ApiException && e.statusCode == 200) {
      return ServerFailure(
        message: e.error?["message"] ?? Strings.unknownFailureMessage,
      );
    }
    if (e.code == auth_error.biometricOnlyNotSupported ||
        e.code == auth_error.lockedOut ||
        e.code == auth_error.notAvailable ||
        e.code == auth_error.notEnrolled ||
        e.code == auth_error.otherOperatingSystem ||
        e.code == auth_error.passcodeNotSet ||
        e.code == auth_error.permanentlyLockedOut) {
      return const BiometricFailure();
    }
    if (e is DioException) {
      String message;
      switch (e.type) {
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.connectionTimeout:
          message = Strings.timeoutFailureMessage;
          break;
        case DioExceptionType.badCertificate:
          message = Strings.certificateFailureMessage;
          break;
        case DioExceptionType.connectionError:
          message = Strings.certificateFailureMessage;
          break;
        case DioExceptionType.badResponse:
          message = Strings.badResponseMessage;
          break;
        default:
          message = Strings.unknownFailureMessage;
      }
      return ServerFailure(message: message);
    } else if (e is SocketException) {
      return const NetworkFailure();
    } else if (e is HiveError) {
      return const CacheFailure();
    } else {
      return const UnknownFailure();
    }
  }
}
