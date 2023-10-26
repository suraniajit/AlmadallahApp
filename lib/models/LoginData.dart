class LoginData {
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  String? error;
  String? errorDescription;
  String? authorization;

  LoginData.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    error = json['error'];
    errorDescription = json['error_description'];
    authorization = json['access_token'] != null
        ? (json['token_type'] + " " + json['access_token'])
        : null;
  }
}
