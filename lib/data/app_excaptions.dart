//implements takes all of the functions and variables form person but it need to redefine them like overide
//each class extends only one parent class at a time so we use mixin which is extended as with (Mixin cant extends as it is not a class so we use with to get all of his function and variables)
//extend allow only one class to extends as implements and with allows many classes to use
class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, "");
}

//status code 400
class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, "Invalid Request");
}

class UnauthorizedException extends AppException {
  UnauthorizedException(Map message) : super(message["message"], "");
  // : super(message, "Unauthorised Request");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input");
}

class NoDataException extends AppException {
  NoDataException([String? message]) : super(message, "No Data");
}

class ErrorMsgException extends AppException {
  ErrorMsgException([String? message]) : super(message, "");
}

class NoInternetException extends AppException {
  NoInternetException([String? message]) : super('', "No Internet Connection");
}
