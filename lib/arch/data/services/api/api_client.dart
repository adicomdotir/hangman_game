import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../utils/result.dart';
import 'models/user/user_api_model.dart';

class HttpHelper {
  final String baseUrl =
      'https://66bdf4a974dfc195586e2421.mockapi.io/test-api/';

  Future<http.Response> getData({
    required String endpoint,
    Map<String, String>? headers,
    Map<String, String>? queryParams,
  }) async {
    Uri uri =
        Uri.parse(baseUrl + endpoint).replace(queryParameters: queryParams);
    return await http.get(uri, headers: headers);
  }

  Future<http.Response> postData({
    required String endpoint,
    required Map<String, dynamic> data,
    Map<String, String>? headers,
  }) async {
    Uri uri = Uri.parse(baseUrl + endpoint);
    return await http.post(
      uri,
      headers: headers ?? {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
  }

  Future<http.Response> putData({
    required String endpoint,
    required Map<String, dynamic> data,
    Map<String, String>? headers,
  }) async {
    Uri uri = Uri.parse(baseUrl + endpoint);
    return await http.put(
      uri,
      headers: headers ?? {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
  }

  Future<http.Response> deleteData({
    required String endpoint,
    Map<String, String>? headers,
  }) async {
    Uri uri = Uri.parse(baseUrl + endpoint);
    return await http.delete(uri, headers: headers);
  }
}

/// Adds the `Authentication` header to a header configuration.
typedef AuthHeaderProvider = String? Function();

class ApiClient {
  ApiClient();

  final HttpHelper _httpHelper = HttpHelper();

  Future<Result<UserApiModel>> getUser() async {
    try {
      final response = await _httpHelper.getData(endpoint: '/persons');

      print(response.statusCode);
      if (response.statusCode == 200) {
        final user = UserApiModel.fromMap(jsonDecode(response.body)[0]);
        return Result.ok(user);
      } else {
        return const Result.error(HttpException('Invalid response'));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      // client.close();
    }
  }
}
