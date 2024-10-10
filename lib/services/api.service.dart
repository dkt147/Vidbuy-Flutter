import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:vidbuy_app/services/interceptor.service.dart';

class ApiService {
  final Logger _logger = Logger();
  final Dio _dio =
      Dio(BaseOptions(baseUrl: 'http://influenzers.duckdns.org/api'));

  ApiService() {
    // Attach interceptor
    _dio.interceptors.add(InterceptorService());
  }

  // GET request
  Future<Response> get(String endpoint, {Map<String, String>? params}) async {
    return await _dio.get(endpoint, queryParameters: params);

    // var uri = Uri.parse('$url/$endpoint').replace(queryParameters: params);
    // return await http.get(uri);
  }

  // POST request
  Future<Response> post(String endpoint, dynamic body) async {
    
    return await _dio.post(endpoint, data: body);
    // return await http.post(
    //   uri,
    //   headers: {'Content-Type': 'application/json'},
    //   body: jsonEncode(body),
    // );
  }

  // PUT request
  Future<Response> put(String endpoint, dynamic body) async {

    return await _dio.put(endpoint, data: body);
    // var uri = Uri.parse('$url/$endpoint');
    // return await http.put(
    //   uri,
    //   headers: {'Content-Type': 'application/json'},
    //   body: jsonEncode(body),
    // );
  }

  // DELETE request
  Future<Response> delete(String endpoint) async {
    return await _dio.delete(endpoint);
    // var uri = Uri.parse('$url/$endpoint');
    // return await http.delete(uri);
  }

  // PATCH request
  Future<Response> patch(String endpoint, dynamic body) async {
    return await _dio.patch(endpoint, data: body);
    // var uri = Uri.parse('$url/$endpoint');
    // return await http.patch(
    //   uri,
    //   headers: {'Content-Type': 'application/json'},
    //   body: jsonEncode(body),
    // );
  }
}
