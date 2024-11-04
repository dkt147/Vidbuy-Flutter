class GenericOtpDataModel {
  final bool boolValue;
  final int status;
  final String message;
  final dynamic result; // Ensure this matches the response structure.

  GenericOtpDataModel(
      {required this.boolValue,
      required this.status,
      required this.message,
      required this.result});

  factory GenericOtpDataModel.fromJson(Map<String, dynamic> json) {
    return GenericOtpDataModel(
      boolValue: json['bool'],
      status: json['status'],
      message: json['message'],
      result: json['result'], // This should map to a user as well
    );
  }
}
