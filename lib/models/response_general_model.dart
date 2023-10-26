class ResponseGeneralModel {
  bool isSuccess = false;
  String? message;
  String? errorMessage;

  ResponseGeneralModel(isSuccess, message, errorMessage);

  ResponseGeneralModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    message = json['Message'];
    errorMessage = json['ErrorMessage'];
  }
}
