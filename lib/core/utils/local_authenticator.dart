import 'package:local_auth/local_auth.dart';

abstract class LocalAuthenticator {
  static final LocalAuthentication _auth = LocalAuthentication();

  static Future<List<BiometricType>> getAvailableBiometrics() async {
    return await _auth.getAvailableBiometrics();
  }

  static Future<bool> authenticateViaBiometrics() async {
    final availableBiometrics = await getAvailableBiometrics();

    String reason =
        'Sign in using your biometrics for a faster, secure experience';
    if (availableBiometrics.contains(BiometricType.face)) {
      reason = 'Sign in using Face ID for a faster, secure experience';
    } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
      reason = 'Sign in using Fingerprint for a faster, secure experience';
    }

    return await _auth.authenticate(
      localizedReason: reason,
      options: const AuthenticationOptions(
        stickyAuth: true,
        biometricOnly: true,
      ),
    );
  }
}
