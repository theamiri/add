import 'package:aidra_drive/core/constant/strings.dart';
import 'package:aidra_drive/core/storage/hive/hive_services.dart';
import 'package:aidra_drive/features/authentication/domain/models/user_model.dart';

class AuthLocalDataSource extends HiveCrudService<UserModel?> {
  AuthLocalDataSource() : super(Strings.userBox);

  Future<void> addUser(UserModel user) async {
    await delete(Strings.userKey);
    await put(Strings.userKey, user);
  }

  Future<void> deleteUser() async {
    await delete(Strings.userKey);
  }

  Future<UserModel?> fetchUser() async {
    return await get(Strings.userKey);
  }
}
