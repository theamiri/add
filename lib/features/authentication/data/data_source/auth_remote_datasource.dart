import 'package:aidra_drive/core/api/api_client.dart';
import 'package:aidra_drive/core/services/service_locator.dart';

class AuthRemoteDataSource {
  final apiClient = sl<ApiClient>();
  Future<Map<String, dynamic>> signin({
    required Map<String, dynamic> body,
  }) async {
    final response = await apiClient.post('api_mobile/auth/login', body);
    return response;
  }
}
