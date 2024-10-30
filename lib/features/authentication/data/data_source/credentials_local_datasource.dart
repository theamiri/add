import 'package:aidra_drive/core/constant/strings.dart';
import 'package:aidra_drive/core/storage/secure_storage.dart';
import 'package:aidra_drive/features/authentication/domain/models/credentials_model.dart';

class CredentialsLocalDataSource extends SecureStorage {
  CredentialsLocalDataSource({super.key = Strings.credentialsKey});

  Future<void> saveCredentials({required CredentialsModel credentials}) async {
    await super.save(value: credentials.toJson());
  }

  Future<CredentialsModel?> getCredentials() async {
    final json = await super.get();
    return json == null ? null : CredentialsModel.fromJson(json);
  }

  Future<void> deleteCredentials() async {
    await super.delete();
  }
}
