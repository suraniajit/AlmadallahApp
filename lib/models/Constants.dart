class Constants {
  static String Username = "";
  static String Password = "";
  static String Base_Url = "https://member.almadallah.ae/";
  static String SaveBankDetail = Base_Url + "/user/savebankaccountdetail";
  static String LoginUrl = Base_Url + "/getauthtoken";
  static String MemberDetailsUrl = Base_Url + "/member/memberdetails";
  static String MemberUtilizationsUrl =
      Base_Url + "/member/memberutilizationdetails";
  static String MemberCardImageUrl = Base_Url + "/user/card";
  static String NetworksUrl = Base_Url + "/common/networks";
  static String PayersUrl = Base_Url + "/common/payers";
  static String ProviderTypesUrl = Base_Url + "/common/providertypes";
  static String ProviderSpecialitiesUrl =
      Base_Url + "/common/providerspecialities";
  static String CitiesUrl = Base_Url + "/common/cities";
  static String ProviderLocationsUrl = Base_Url + "/common/locations";
  static String ProviderSearchUrl = Base_Url + "/common/networkproviders";
  static String RegisterUrl = Base_Url + "/common/register";
  static String ForgotUsernameUrl = Base_Url + "/common/forgotusername";
  static String ForgotPasswordUrl = Base_Url + "/common/forgotpassword";
  static String UpdatePasswordUrl = Base_Url + "/user/updatepassword";
  static String GetProfileUrl = Base_Url + "/user/profile";
  static String UpdateProfileUrl = Base_Url + "/user/updateaccount";
  static String DeviceInfoUrl = Base_Url + "/user/deviceinfo";
  static String TrackClaimsUrl = Base_Url + "/member/searchclaims";
  static String GooglePlaceFromTextUrl =
      "https://maps.googleapis.com/maps/api/place/findplacefromtext/json";
  static String GoogleAPIKey = "AIzaSyAnvPokOJJ0iBCJJv4FpWcvEQDIwoGdJDw";
  static String MemberContractPeriodUrl =
      Base_Url + "/member/membercontractperiod";
  static String BanksUrl = Base_Url + "/common/banks";
  static String CurrenciesUrl = Base_Url + "/common/currency";
  static String BankAccountsUrl = Base_Url + "/user/bankaccountdetails";
  //static String SubmitClaimsUrl = Base_Url + "/member/savereimbursementclaim";
  static String SubmitClaimsUrl = Base_Url + "/member/savememberclaim";
  static String ContactReasonsUrl = Base_Url + "/common/contactreasons";
  static String ContactUrl = Base_Url + "/common/savecontactreasondetails";
  static String GoogleNearByPlacesUrl =
      "https://maps.googleapis.com/maps/api/place/nearbysearch/json";
  static String GoogleGeolocationUrl =
      "https://www.googleapis.com/geolocation/v1/geolocate";
  static String GoogleGeocodingUrl =
      "https://maps.googleapis.com/maps/api/geocode/json";
  static String UserRequestUrl = Base_Url + "/user/getuserrequesttypes";
  static String SaveRequestUrl = Base_Url + "/user/saveuserrequest";
  static String DownloadUrl = Base_Url + "/member/getdownloadablefilelist";
  static String FileDownloadUrl = Base_Url + "/member/downloadfile";
  static String OneSignalPushNotificationAppID =
      '7249e1e9-b7ff-4131-806c-4fc6079b1630';
  static String PushNotificationRegistrationUrl =
      Base_Url + "/member/savepushnotificationregistrationdetails";
  static String PushNotificationsDetailsForUserUrl =
      Base_Url + "/user/showNotificationDetails";

  static String BenefitsListURL = Base_Url + "/member/benefitslist/";
  static String BenefitsDetailsURL = Base_Url + "/member/benefitdetails/";
}
