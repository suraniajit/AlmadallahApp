import 'package:almadalla/screens/LanguageBloc.dart';
import 'package:provider/provider.dart';

import '../translation/local_keys.g.dart';

class UserProfile {
  late int key;
  late int memberKey;
  String? name;
  String? gender;
  String? mobile;
  String? emailID;
  String? emiratesIDNo;
  String? dob;
  bool? isAccountVerified;
  String? message;
  String? payer;
  String? network;
  int? payerKey;
  int? networkKey;
  bool primaryMember = true;
  bool isEnayaMember = false;
  String languageKey = "2";
  UserProfile();
  UserProfile.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    memberKey = json['MemberKey'];
    name = json['name'];
    gender = json['gender'];
    mobile = json['mobile'];
    emailID = json['emailid'];
    emiratesIDNo = json['emiratesidno'];
    isAccountVerified = json['isaccountverified'];
    message = json['message'];
    dob = json["memberDOB"];
    payer = json["payer"];
    network = json["network"];
    payerKey = json["payerkey"];
    networkKey = json["networkkey"];
    primaryMember = json["IsDependant"] ? false : true;
    isEnayaMember = json["IsEnayaMember"] == 0 ? false : true;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = name;
    data['memberDOB'] = dob;
    data['memberMobile'] = mobile;
    data['emailID'] = emailID;
    data['memberEmiratesIDNo'] = emiratesIDNo;
    data['languageKey'] = languageKey;
    return data;
  }
}
