import 'package:almadalla/models/UserProfile.dart';
import 'package:flutter/foundation.dart';

import 'LoginData.dart';

class UserSettingsBloc with ChangeNotifier {
  LoginData? _loginData;
  UserProfile? _userProfile;

  setLoginData(LoginData? loginData) {
    _loginData = loginData;
    notifyListeners();
  }

  setUserProfile(UserProfile? userProfile) {
    _userProfile = userProfile;
    notifyListeners();
  }

  LoginData? getLoginData() {
    return _loginData;
  }

  UserProfile? getUserProfile() {
    return _userProfile;
  }
}
