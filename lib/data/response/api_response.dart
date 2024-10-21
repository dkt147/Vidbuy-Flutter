import 'package:vidbuy_app/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

//Constructor
  ApiResponse(this.status, this.data, this.message);

  ApiResponse.init() : status = Status.INIT;
  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed(this.data) : status = Status.COMPLETED;
  ApiResponse.error(this.message)
      : status = Status.ERROR; //app exception will handle that

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data: $data";
  }
}
