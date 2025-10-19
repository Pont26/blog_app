import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkService {
  static final NetworkService _instance = NetworkService._internal();

  factory NetworkService() => _instance;

  NetworkService._internal();

  Future<http.Response> postMethodCalling({
    required String url,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: _buildHeaders(token),
        body: jsonEncode(data),
      );
      _handleHttpError(response, 'POST');
      return response;
    } catch (e) {
      throw Exception('POST request failed: $e');
    }
  }

  // ✅ GET
  Future<http.Response> getMethodCalling({
    required String url,
    String? token,
  }) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: _buildHeaders(token),
      );
      _handleHttpError(response, 'GET');
      return response;
    } catch (e) {
      throw Exception('GET request failed: $e');
    }
  }

  



  // ✅ PATCH
  Future<http.Response> patchMethodCalling({
    required String url,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    try {
      final response = await http.patch(
        Uri.parse(url),
        headers: _buildHeaders(token),
        body: jsonEncode(data),
      );
      _handleHttpError(response, 'PATCH');
      return response;
    } catch (e) {
      throw Exception('PATCH request failed: $e');
    }
  }

  // ✅ DELETE
  Future<http.Response> deleteMethodCalling({
    required String url,
    String? token,
  }) async {
    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: _buildHeaders(token),
      );
      _handleHttpError(response, 'DELETE');
      return response;
    } catch (e) {
      throw Exception('DELETE request failed: $e');
    }
  }

  // 📌 Headers builder
  Map<String, String> _buildHeaders(String? token) {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    if (token != null && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }



  // 📌 Centralized error handler
  void _handleHttpError(http.Response response, String method) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return;
    }
    throw Exception(
        '$method request failed with status: ${response.statusCode}, body: ${response.body}');
  }
}
