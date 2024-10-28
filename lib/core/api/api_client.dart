import 'package:aidra_drive/core/api/api_exception.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final String baseUrl;
  final Dio dio;

  ApiClient(this.baseUrl) : dio = Dio();

  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.get(
        '$baseUrl/$endpoint',
        options: Options(headers: headers),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw ApiException(e.response?.statusCode, e.response?.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> post(
    String endpoint,
    Map<String, dynamic> data, {
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.post(
        '$baseUrl/$endpoint',
        data: data,
        options: Options(headers: headers),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw ApiException(e.response?.statusCode, e.response?.data);
    } catch (e) {
      rethrow;
    }
  }

  dynamic _handleResponse(Response response) {
    if (response.statusCode! == 200 && response.statusCode! < 300) {
      if (response.statusCode! == 200 &&
          response.data["result"]["status"] == "False") {
        throw ApiException(
          response.statusCode!,
          response.data["result"],
        );
      } else {
        return response.data;
      }
    }
  }
}
