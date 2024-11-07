import 'dart:io';

abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(String url, dynamic includeToken);

  Future<dynamic> getPostApiResponse(
      String url, dynamic data, dynamic includeToken);

  Future<dynamic> getPostMultipartResponse(
      String url, File file, dynamic fields, dynamic includeToken);
}
