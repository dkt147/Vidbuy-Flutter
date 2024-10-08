import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String url;

  ApiService() : url = 'http://influenzers.duckdns.org/api';

  // GET request
  Future<http.Response> get(String endpoint, {Map<String, String>? params}) async {
    var uri = Uri.parse('$url/$endpoint').replace(queryParameters: params);
    return await http.get(uri);
  }

  // POST request
  Future<http.Response> post(String endpoint, dynamic body) async {
    var uri = Uri.parse('$url/$endpoint');
    return await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
  }

  // PUT request
  Future<http.Response> put(String endpoint, dynamic body) async {
    var uri = Uri.parse('$url/$endpoint');
    return await http.put(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
  }

  // DELETE request
  Future<http.Response> delete(String endpoint) async {
    var uri = Uri.parse('$url/$endpoint');
    return await http.delete(uri);
  }

  // PATCH request
  Future<http.Response> patch(String endpoint, dynamic body) async {
    var uri = Uri.parse('$url/$endpoint');
    return await http.patch(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
  }
}
