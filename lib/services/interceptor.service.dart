import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class InterceptorService extends Interceptor {
  final _storage = FlutterSecureStorage();

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = await _callToken();

    // Add Authorization header if the token exists
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    options.headers['Accept'] = 'application/json';

    // Check for content type
    if (options.headers.containsKey('Content-Type') &&
        options.headers['Content-Type'] == 'application/json') {
      options.headers['Content-Type'] = 'application/json';
    }

    return handler.next(options); 
  }
  Future<String?> _callToken() async {
    return await _storage.read(key: 'token'); 
  }
}
