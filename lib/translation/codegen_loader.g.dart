import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> ar = {
    "member_details": "تفاصيل العضو",
    "name": "أسم",
    "password": "كلمة المرور",
    //"remember_me":"تذكرنى",
    "remember_me": "تذكرني",
    "forgot_password": "هل نسيت كلمة السر؟",
    "log_in": "تسجيل الدخول",
    "provider_search": "بحث عن مستشفيات",
    "submit_claims": "تعويض المطالبات",
    "track_claims": "تتبع المطالبات",
    "settings": "إعدادات",
    "contact_us": "اتصل بنا",
    //"reset_password":"إعادة تعيين كلمة المرور",
    "submit": "قم بالتقديم",
    "username": "اسم المستخدم",
    "card_no": "رقم البطاقة",
    "member_name": "اسم العضو",
    "policy_no": "رقم البولصية",
    "select_member": "أختر العضو",
    "payer": "دافع",
    "network": "الشبكة",
    "provider_type": "نوع مقدم الرعاية الصحية",
    "speciality": "تخصص",
    "city": "المدينة",
    "location": "المنطقة",
    "search": "البحث",
    "locations": "المنطقة",
    "service_date": "تاريخ الخدمة",
    //"submission_claim_ref" : "تقديم مرجع المطالبة (في حالة إعادة الإرسال فقط)",
    "submission_claim_ref": "تقديم مرجع المطالبة",
    "claimed_cost": "التكلفة المطالب بها",
    "Currency": "عملة",
    "claim_attachment": "مرفق المطالبة",
    "payment_type": "نوع الدفع",
    "bank_account": "حساب البنكحساب البنك",
    "bank": "مصرف",
    "bank_details": "تفاصيل البنك",
    "bank_account_name": "اسم الحساب المصرفي",
    "profile": "حساب تعريفي",
    "change_password": "تغيير كلمة السر",
    "email_address": "عنوان البريد الإلكتروني",
    "mobile_number": "رقم الهاتف المحمول",
    "update": "تحديث",
    "confirm_password": "تأكيد كلمة المرور",
    "new_password": "كلمة المرور الجديدة",
    "contact_reason": "سبب الاتصال",
    "your_name": "اسمك",
    "send": "ابعث",
    "where_do_we_email_you": "بريك الاكتروني",
    "have_a_phone_number": "رقم الهاتف",
    "toll_free_numbe": "الرقم المجاني",
    "for_careers": "للوظائف",
    "for_administrative_issues": "للشؤون الإدارية",
    "for_claims_reimbursement": "للمطالبة والسداد",
    "contact_call_centre": "الاتصال بمركز الاتصال",
    "employee_iD": "رقم هوية الموظف",
    "name_english": "الاسم بالانجليزية",
    "name_arabic": "الاسم بالعربي",
    "gender": "جنس",
    "relationship": "العلاقة",
    "date_birth": "تاريخ الميلاد",
    "member_id": "رقم العضو",
    "our_healthcare_providers": "مقدمي الخدمة الصحية",
    "notifications": "إشعارات",
    "mandatory_documents": "المستندات الإلزامية",
    "optional_attachment_one": "مرفق اختياري 1",
    "optional_attachment_two": "مرفق اختياري 2",
    "optional_attachment_three": "مرفق اختياري 3",
    "claim_translated": "المطالبة مترجمة باللغة الإنجليزية أو العربية",
    "prescription_invoice": "الوصفة الطبية والفاتورة",
    "laboratory_investigation": "تقارير المختبرات والتحقيقات",
    "al_madallah_card": "بطاقة المظلة",

    "email": "بريد إلكتروني",
    "send_message": "أرسل لنا رسالة",
    "What_your_mind": "اخبرنا بما تريد",
    "member_utilization": "استخدام الأعضاء",
    "not_registered": "غير مسجل معنا؟ سجل الان",
    //"forgot_username": "نسيت إسم المستخدم",
    "forgot_username": "هل نسيت اسم المستخدم؟",
    "hello": "مرحبا",
    "emirates_number": "رقم الهوية الإماراتية",
    "no_data_found": "لاتوجد بيانات",
    "amount": "المبلغ",
    "select_network": "اختر شبكة",
    "select_provider": "اختر مزود خدمة صحية",
    "select_speciality": "اختر تخصص",
    "select_location": "اخر منطقة",
    "select_city": "اختر مدينة",
    //  "select_payer": "حدد الدافع",
    "sign_up": "اشترك",
    "claim_reference": "مرجع المطالبة",
    "select_bank_account": "مرجع المطالبة",
    "select_bank": "اختر بنك",
    "select_currency": "اختر عملة",
    // "reason": "سبب",
    "bank_account_IBAN": "الحساب المصرفي IBAN",
    "iban": "IBAN",
    "choose_file": "أختر",
    "no_file": "لم يتم اختيار اي ملف",
    "default_bank_account": "تعيين كحساب مصرفي افتراضي",
    "provider_name": "اسم مزود الخدمة",
    "claim_amount": "مبلغ المطالبة",
    "approved_amount": "مبلغ الموافق",
    "status": "حالة",
    "claimList": "قائمة المطالبات",
    //  "expiry_date": "تاريخ الانتهاء",
    // "effective": "فعال",
    // "category": "فئة",
    //  "emirates": "هويه الإمارات",
    "note":
        "ملاحظة: يجب أن تكون بطاقة الهوية الإماراتية الخاصة بك و تاريخ الميلاد ورقم الهاتف المحمول مسجلة لدى المظلة",
    // "email_required": "البريد الإلكتروني (مطلوب",
    "emiratesId_required": "الهوية الإماراتية مطلوبة",
    "username_required": "اسم المستخدم (مطلوب",
    "password_required": "كلمة المرور مطلوبة",
    "balance": "المتبقي",
    "amount_balance": "المبلغ\nالمتبقي",
    "utilized": "المستخدم",
    "amount_utilized": "المبلغ\nالمستخدم",
    "policy": "حد السياسة الفرعية",
    // "sublimit": "سامي",

    "please_select_payer": "اختر طريقة الدفع",
    // "please_select_network": "يرجى تحديد الشبكة",
    "all": "كل",
    //  "mobile_number_required": "رقم الهاتف المحمول مطلوب",
    "DOB_required": "تاريخ الميلاد ",
    "enter_valid_number": "رقم هاتف محلي",
    "terms_condition": "الرجاء الموافقة على الشروط والأحكام",
    "please_add_reason": "الرجاء إضافة سبب",
    "please_select_attachment": "يرجى تحديد المرفقات",
    "please_select_payment_type": "الرجاء تحديد نوع الدفع",
    "please_select_member": "الرجاء تحديد عضو",
    "please_add_claimed_cost": "الرجاء إضافة التكلفة المطالب بها",
    "please_select_bank": "يرجى تحديد البنك",
    "please_add_bank_account": "الرجاء إضافة حساب مصرفي",
    // "please_select_claim_type": "الرجاء تحديد نوع المطالبة",
    "select": "أختر",

    "reimbursement_claim_form":
        "استمارة مطالبة التعويض (معبأة وموقعة ومختومة من قبل الطبيب المعالج)",
    // "filled": "مملوء",
    // "signed_and": "وقعت و",
    // "stamped": "مختومة من قبل الطبيب المعالجn",
    "medical": "تقارير ملخص طبي / جراحي / الخروج إن وجدت",
    // "surgical": "جراحي",
    // "discharge_summary": "ملخص التفريغ",
    // "reports": "تقارير إن وجدت",
    // "resub_only": "في حالة إعادة الإرسال فقط",
    "bank_swift_code": "رمز Swift للمصرف",
    "agree": "لقد قرأت ووافقت على الشروط والأحكام",
    //  "condition": "والحالة",
    //  "select_reason": "حدد السبب",
    "i_am": "أنا",
    "updated_successfully": "تم تحديث ملفك الشخصي بنجاح",
    "try_again": "حدث خطأ في الخادم. حاول مرة اخرى.",
    "create_account": "أنشئ حسابك",
    // "your_emirates": "هوية الإمارات الخاصة بك",
    // "and_mobile": "ورقم الجوال",
    //  "registered_Almadallah": "أن يكون مسجلا لدى المدالله",
    "submitted_successfully": "تم الإرسال بنجاح",
    "submitted_successfully_dependent":
        // "تم الإرسال بنجاح. سيتم إجراء التسوية للحساب الأساسي",
        "سيتم إجراء التسوية مع الحساب الرئيسي",
    "member": "عضو",
    "sign_in": "تسجيل الدخول",
    "my_account": "حسابي",
    "logout": "الخروج",
    "skip": "تخطى",
    "done": "تم",
    "welcome": "مرحبا",
    "select_language": "اختار اللغة",
    "wait": "يرجى الانتظار حتى يتم تحميل نافذة الدردشة بالكامل",
    "bank_accounts": "حساب البنك",
    "registration_code": "رمز التسجيل",
    "home": "الصفحة الرئيسية",
    "save_bank_detail": "حفظ تفاصيل البنك",
    "update_bank_details": "تحديث تفاصيل البنك",
    "swift_code": "رمز السرعة",
    "account_name": "إسم الحساب",
    "active": "نشيط؟",
    "bank_name": "اسم البنك",
    "terms": "أحكام وشروط",
    "bank_transfer": "التحويل المصرفي",
    "UAE_DHIRHAM": "الدرهم الإماراتي",
    "language": "arabic",
    "menu-list-arrow": "menu-list-arrow-left.png",
    "cliam_name": "اسم",
    "claim_type": "نوع المطالبة",
    "claim_action": "دعوى المطالبة",
    "remarks": "ملاحظات",
    "claim_details": "تفاصيل المطالبة",
    "requests": "الطلبات",
    "select_request": "حدد طلب",
    "request": "طلب",
    "downloads": "التحميلات",
    "select_download": "حدد تنزيل",
    "download": "تحميل",
    "file_download": "اكتمل تنزيل الملف. يرجى التحقق من تطبيق الملفات.",
    "file_download_complete":
        "اكتمل تنزيل الملف. يرجى التحقق من مجلد التنزيلات.",
    "request_sent": "تم ارسال الطلب",
    "push_notification": "دفع الإخطار",
    "sms": "رسالة قصيرة",
    "allow_notification": "السماح بالإخطار",

    "mymadallahrewards": 'برنامج الولاء – المظلة',
    "enaya_wellness": 'منتسبين عناية',
    "share": "سهم",
    "offer_validity": "صلاحية العرض",
    "off": "قباله",

    //Gender Image

    "maleImage": "male-left.png",
    "femaleImage": "female-left.png",
    "personImage": "male-left.png",

    //Login
    "AUTHENTICATEUSER.INVALIDCREDENTIALS": "بيانات الاعتماد غير صالحة",

    //REGISTERUSER
    "REGISTERUSER.INVALIDUSERNAME": "اسم مستخدم غير صحيح",
    "REGISTERUSER.INVALIDEMAIL": "بريد إلكتروني خاطئ",
    //"REGISTERUSER.NOTAVALIDEMAIL": "ليس بريدًا إلكترونيًا صالحًا",
    "REGISTERUSER.INVALIDUSERGROUPKEY": "مفتاح مجموعة مستخدم غير صالح",
    "REGISTERUSER.INVALIDDOB": "تاريخ ميلاد غير صحيح",
    "REGISTERUSER.INVALIDMEMBEREMIRATESIDNO": "طول رقم الهوية غير صحيح",
    "REGISTERUSER.INVALIDMEMBEREMIRATESIDNOLENGTH": "طول رقم الهوية غير صحيح",
    "REGISTERUSER.YEAROFBIRTHMISMATCH":
        "الجزء الثاني من حقل هوية الإمارات هو سنة ميلادك ولا يتطابق مع الجزء الموجود في حقل تاريخ الميلاد",
    "REGISTERUSER.INVALIDMOBILE": "رقم الجوال غير صحيح",
    "REGISTERUSER.NOTAVALIDUAEMOBILE":
        "جوال غير صالح (* يجب أن يبدأ الرقم بـ 971 ورقم يجب أن يكون 12)",
    "REGISTERUSER.NOTAVALIDMEMBER":
        "الرجاء التواصل مع الفريق المختص في حال مواجهة عدم تطابق البيانات  مع سجل البيانات لدينا .",
    "REGISTERUSER.USERNAMEEXISTS":
        "الرجاء إعادة تسجيل الدخول في حال اسم المستخدم الخاص بك قيد الإستخدام سابقا .",
    "REGISTERUSER.USEREXISTS":
        "الرجاء إعادة تسجيل الدخول في حال اسم المستخدم الخاص بك قيد الإستخدام سابقا .",
    "REGISTERUSER.ERROROCCURED": "حدث خطأ",
    //MEMBERDETAILS
    "MEMBERDETAILS.INVALIDMEMBER": "تفاصيل العضو غير صالحة",

    //MEMBERUTILIZATIONDETAILS
    "MEMBERUTILIZATIONDETAILS.INVALIDMEMBER": "تفاصيل العضو غير صالحة",
    "MEMBERUTILIZATIONDETAILS.INVALIDMEMBERDETAIL": "تفاصيل العضو غير صالحة",

    //submitClaim
    "SAVEONLINECLAIM.NOTAVALIDDOCUMENTSFOLDERPATH": "طلب غير صحيح",
    "SAVEONLINECLAIM.NOTAVALIDMEMBER":
        "الرجاء التواصل مع الفريق المختص في حال مواجهة عدم تطابق البيانات  مع سجل البيانات لدينا .", // "عضو غير صحيح",
    "SAVEONLINECLAIM.INVALIDCARDNO": "رقم البطاقة غير صالحة",
    "SAVEONLINECLAIM.INVALIDSERVICEDATE": "تاريخ الخدمة غير صالح",
    "SAVEONLINECLAIM.INVALIDCLAIMEDCOST": "تكلفة مطالب بها غير صحيحه",
    "SAVEONLINECLAIM.INVALIDCLAIMATTACHMENT": "مرفق مطالبة غير صالح",
    "SAVEONLINECLAIM.NOTAVALIDCLAIMATTACHMENT":
        "مرفق المطالبة الذي تم تحميله ليس بالتنسيق الصحيح",
    "SAVEONLINECLAIM.NOTAVALIDCLAIMATTACHMENTFILESIZE":
        "لا يمكن أن يكون حجم ملف مرفق المطالبة مساويًا لـ 0 بايت",
    "SAVEONLINECLAIM.INVALIDMEMBERBANKIBAN":
        "رقم الحساب المصرفي الدولي (IBAN) عضو غير صالح",
    "SAVEONLINECLAIM.INVALIDUSEMEMBERDEFAULTBANKACCOUNT": "طلب غير صالح",
    "SAVEONLINECLAIM.NOVALIDBANKACCOUNTFOUNDFORMEMBER":
        "لم يتم العثور على حساب مصرفي صالح للعضو",
    "SAVEONLINECLAIM.INVALIDMEMBERBANKACCOUNTNAME":
        "اسم حساب مصرفي عضو غير صالح",
    "SAVEONLINECLAIM.INVALIDBANKSWIFTCODE": "رمز سويفت الخاص بالأعضاء غير صالح",
    "SAVEONLINECLAIM.INVALIDMEMBERBANKSWIFTCODE":
        "رمز سويفت الخاص بالأعضاء غير صالح",
    "SAVEONLINECLAIM.INVALIDPAYMENTTYPE": "نوع الدفع غير صالح",
    "SAVEONLINECLAIM.INVALIDISRESUBMISSION": "طلب غير صالح",
    "SAVEONLINECLAIM.NOVALIDCLAIMSUBMISSIONFOUND":
        "لم يتم العثور على تقديم مطالبة صالح",
    "SAVEONLINECLAIM.INVALIDSUBMISSIONCLAIMREF": "تقديم مطالبة المرجع غير صالح",
    "SAVEONLINECLAIM.NOTAVALIDOPTIONALATTACHMENT3FILESIZE":
        "لا يمكن أن يكون حجم ملف المرفق 3 الاختياري أكبر من 2 ميجابايت",
    // "SAVEONLINECLAIM.NOTAVALIDOPTIONALATTACHMENT3FILESIZE":"Optional Attachment3 file size cannot be equal to 0 Bytes",
    "SAVEONLINECLAIM.NOTAVALIDOPTIONALATTACHMENT3":
        "المرفق الاختياري الذي تم تحميله 3 ليس بالتنسيق الصحيح",
    "SAVEONLINECLAIM.NOTAVALIDOPTIONALATTACHMENT2FILESIZE":
        "لا يمكن أن يكون حجم ملف المرفق 2 الاختياري أكبر من 2 ميجابايت",

    // "SAVEONLINECLAIM.NOTAVALIDOPTIONALATTACHMENT2FILESIZE":"Optional Attachment2 file size cannot be equal to 0 Bytes",
    "SAVEONLINECLAIM.NOTAVALIDOPTIONALATTACHMENT2":
        "المرفق 2 الاختياري الذي تم تحميله ليس بالتنسيق الصحيح",
    "SAVEONLINECLAIM.NOTAVALIDOPTIONALATTACHMENT1FILESIZE":
        "لا يمكن أن يكون حجم ملف المرفق 1 الاختياري أكبر من 2 ميغا بايت",
    // "SAVEONLINECLAIM.NOTAVALIDOPTIONALATTACHMENT1FILESIZE":"Optional Attachment1 file size cannot be equal to 0 Bytes",
    "SAVEONLINECLAIM.NOTAVALIDOPTIONALATTACHMENT1":
        "المرفق الاختياري 1 الذي تم تحميله ليس بالتنسيق الصحيح",
    "SAVEONLINECLAIM.NOTAVALIDREQUEST": "طلب غير صالح",
    "SAVEONLINECLAIM.INVALIDCLAIMTYPE": "طلب غير صالح",
    "SAVEONLINECLAIM.INVALIDREQUESTREF": "طلب غير صالح",
    "SAVEONLINECLAIM.ALREADYCLAIMEXISTWITHSAMEREQUESTREF": "طلب غير صالح",
    "SAVEONLINECLAIM.NOVALIDCOMPANYCONTRACTFOUND": "طلب غير صالح",

    // FORGOTUSERNAME
    "FORGOTUSERNAME.INVALIDMEMBEREMIRATESIDNO":
        "رقم الهوية الإماراتية غير صالح",
    "FORGOTUSERNAME.INVALIDREGISTEREDEMAIL":
        "البريد الإلكتروني المسجل غير صالح",
    "FORGOTUSERNAME.NOVALIDUSERFOUND": "لم يتم العثور على مستخدم صالح",

    // FORGOTPASSWORD
    "FORGOTPASSWORD.INVALIDUSERNAME": "اسم مستخدم غير صحيح",
    "FORGOTPASSWORD.INVALIDREGISTEREDEMAIL":
        "البريد الإلكتروني المسجل غير صالح",
    "FORGOTPASSWORD.NOVALIDUSERFOUND": "لم يتم العثور على مستخدم",
    //searchclaims
    "SEARCHCLAIMS.INVALIDMEMBER": "عضو غير مسجل",
    "SEARCHCLAIMS.INVALIDSERVICEFROMDATE": "خدمة غير صالحة من التاريخ",
    "SEARCHCLAIMS.INVALIDSERVICETODATE": "خدمة غير صالحة حتى تاريخه",
    //savecontactreasondetails
    "SAVECONTACTREASONDETAILS.INVALIDCONTACTREASONKEY":
        "مفتاح سبب الاتصال غير صالح",
    "SAVECONTACTREASONDETAILS.INVALIDEMAIL": "بريد إلكتروني خاطئ",
    "SAVECONTACTREASONDETAILS.NOTAVALIDEMAIL": "بريدًا إلكترونيًا غير صالحًا",
    "SAVECONTACTREASONDETAILS.INVALIDCOMMENTS": "تعليقات غير صالحة",
    //updatePassword
    "UPDATEPASSWORD.INVALIDPASSWORD": "رمز مرور خاطئ",
    "UPDATEPASSWORD.MINIMUMLENGTHISSUE":
        "يجب أن يكون الحد الأدنى لطول كلمة المرور 6 على الأقل",
    "REGISTERUSER.NOTAVALIDEMAIL": "بريد إلكتروني غير صحيح",

    //GetDownloadableFileList
    "GETDOWNLOADABLEFILELIST.MISSINGMANDATORYFIELDS": "الحقول الإلزامية مفقودة",

    //Downloadfile
    "DOWNLOADFILE.MISSINGMANDATORYFIELDS": "الحقول الإلزامية مفقودة",
    "DOWNLOADFILE.FILENOTFOUND": "لم يتم العثور على الملف",
    "DOWNLOADFILE.INVALIDFILE": "ملف غير صالح",

    //saveuserrequest
    "SAVEUSERREQUEST.MISSINGMANDATORYFIELDS": "الحقول الإلزامية مفقودة.",
    "SAVEUSERREQUEST.INVALIDREQUEST": "طلب غير صالح.",
    "SAVEUSERREQUEST.REQUESTALREADYEXISTS": "طلب موجود بالفعل"
  };
  static const Map<String, dynamic> en = {
    "member_details": "Member Details",
    "name": "Name",
    "password": "Password",
    "remember_me": "Remember me",
    "forgot_password": "Forgot Password",
    "log_in": "Log in",
    "provider_search": "Provider Search",
    "submit_claims": "Submit Claims",
    "track_claims": "Track Claims",
    "settings": "Settings",
    "contact_us": "Contact Us",
    "reset_password": "Reset password",
    "submit": "Submit",
    "username": "Username",
    "card_no": "Card No",
    "member_name": "Member Name",
    "policy_no": "Policy No",
    "select_member": "Select Member",
    "payer": "Payer",
    "network": "Network",
    "provider_type": "Provider type",
    "speciality": "Speciality",
    "city": "City",
    "location": "Location",
    "search": "Search",
    "locations": "Locations",
    "service_date": "Service Date",
    "submission_claim_ref": "Submission Claim Ref",
    "claimed_cost": "Claimed Cost",
    "Currency": "Currency",
    "claim_attachment": "Claim Attachment",
    "payment_type": "Payment Type",
    "bank_account": "Bank Account",
    "bank": "Bank",
    "bank_details": "Bank Details",
    "bank_swift_code": "Bank Swift Code",
    "bank_account_name": "Bank Account Name",
    "profile": "Profile",
    "change_password": "Change password",
    "email_address": "Email Address",
    "mobile_number": "Mobile Number",
    "update": "Update",
    "confirm_password": "Confirm Password",
    "new_password": "New Password",
    "contact_reason": "Contact Reason ?",
    "your_name": "Your Name ?",
    "send": "Send",
    "where_do_we_email_you": "Where do we email you ?",
    "have_a_phone_number": "Have a phone number ?",
    "What_your_mind": "What’s on your mind ?",
    "toll_free_numbe": "Toll Free Number",
    "for_careers": "For Careers",
    "for_administrative_issues": "For Administrative issues",
    "for_claims_reimbursement": "For Claims & Reimbursement",
    "contact_call_centre": "Contact Call Centre",
    "employee_iD": "Employee ID",
    "name_english": "Name in English",
    "name_arabic": "Name in Arabic",
    "gender": "Gender",
    "relationship": "Relationship",
    "date_birth": "Date of Birth",
    "member_id": "Member ID",
    "our_healthcare_providers": "Our Healthcare Providers",
    "notifications": "Notifications",
    "mandatory_documents": "Mandatory Documents",
    "optional_attachment_one": "Optional Attachment 1",
    "optional_attachment_two": "Optional Attachment 2",
    "optional_attachment_three": "Optional Attachment 3",
    "claim_translated": "Claim translated in English or Arabic",
    "prescription_invoice": "Prescription and Invoice",
    "laboratory_investigation": "Laboratory and investigation reports",
    "al_madallah_card": "Almadallah Card",
    "email": "Email",
    "send_message": "Send us a message",
    "member_utilization": "Member Utilization",
    "not_registered": "Not registered with us? Register Now",
    "forgot_username": "Forgot Username",
    "hello": "Hello,",
    "emirates_number": "Emirates ID Number",
    "no_data_found": "No data available",
    "amount": "Amount",
    "select_network": "Select Network",
    "select_provider": "Select Provider Type",
    "select_speciality": "Select Speciality",
    "select_location": "Select Location",
    "select_city": "Select City",
    // "select_payer": "Select Payer",
    "sign_up": "Sign UP",
    "claim_reference": "Claim Reference",
    "select_bank_account": "Select bank account",
    "select_bank": "Select bank",
    "select_currency": "Select Currency",
    "reason": "Reason",
    "bank_account_IBAN": "Bank Account IBAN",
    "iban": "IBAN",
    "choose_file": "Choose",
    "no_file": "No File Selected",
    "default_bank_account": "Set as default bank account",
    "provider_name": "Provider Name",
    "claim_amount": "Claim Amount",
    "approved_amount": "Approved Amount",
    "status": "Status",
    "claimList": "Claim List",
    "expiry_date": "Expiry Date",
    "effective": "Effective",
    "category": "Category",
    "emirates": "Emirates ID",
    "note":
        "Note:Your Emirates ID,DOB and Mobile Number has to be registered with Almadallah",
    "email_required": "Email Required",
    "emiratesId_required": "Emirates ID Required",
    "username_required": "Username Required",
    "password_required": "Password Required",
    "balance": "Balance",
    "amount_balance": "Balance\nAmount",
    "utilized": "Utilized",
    "amount_utilized": "Utilized\nAmount",
    "policy": "Policy Sublimit",
    //"sublimit": "Sublimit",
    "please_select_payer": "Please Select Payer",
    "please_select_network": "Please Select Network",
    "all": "All",
    "mobile_number_required": "Mobile Number Required",
    "DOB_required": "DOB  Required",
    "enter_valid_number": "Enter Valid UAE Number",
    "terms_condition": "Please agree to the terms and condition",
    "please_add_reason": "Please Add Reason",
    "please_select_attachment": "Please Select Attachment",
    "please_select_payment_type": "Please Select payment Type",
    "please_select_member": "Please Select Member",
    "please_add_claimed_cost": "Please Add Claimed Cost",
    "please_select_bank": "Please Select Bank",
    "please_add_bank_account": "Please Add Bank Account",
    "please_select_claim_type": "Please Select Claim Type",
    "select": "Select",
    "reimbursement_claim_form":
        "Reimbursement claim form(filled,signed,and stamped by the treating physician)",
    // "filled": "filled,",
    // "signed_and": "signed and",
    // "stamped": "stamped by the treating physician",
    "medical": "Medical/Surgical/Discharge Summary reports if any  ",
    "any": "any",
    // "discharge_summary ": "Discharge Summary ",
    // "reports": "reports if any",
    // "resub_only": "If Resub only",
    "agree": "I have read and agree to the terms and conditions",
    //"condition": "and condition",
    "select_reason": "Select Reason",
    "i_am": "I am a",
    "updated_successfully": "Your profile has been Updated Successfully",
    "try_again": "Error occurred with server. Please try again.",
    "create_account": "Create Your Account",
    //"your_emirates": "Your Emirates ID",
    //"and_mobile": "and Mobile Number",
    // "registered_Almadallah": "has to be registered with Almadallah",
    "submitted_successfully": "Submitted Successfully",
    "submitted_successfully_dependent":
        "Submitted Successfully. Settlement will be made towards Principal Account.",
    "member": "Member",
    "sign_in": "Sign In",
    "my_account": "My Account",
    "logout": "Logout",
    "skip": "SKIP",
    "done": "DONE",
    "welcome": "Welcome",
    "select_language": "Select Language",
    "wait": "Please wait until chat window is fully loaded.",
    "bank_accounts": "Bank Accounts",
    "registration_code": "Registration Code",
    "home": "Home",
    "save_bank_detail": "Save Bank Detail",
    "update_bank_details": "Update Bank Details",
    "swift_code": "Swift Code",
    "account_name": "Beneficiary Account Name",
    "active": "Active?",
    "bank_name": "Bank Name",
    "terms": "Terms and Condition",
    "bank_transfer": "Bank Transfer",
    "UAE_DHIRHAM": "UAE DHIRHAM",
    "language": "english",
    "menu-list-arrow": "menu-list-arrow.png",
    "cliam_name": "Name",
    "claim_type": "Claim Type",
    "claim_action": "Claim Action",
    "remarks": "Remarks",
    "claim_details": "Claim Details",
    "requests": "Requests",
    "select_request": "Select Request",
    "request": "Request",
    "downloads": "Downloads",
    "select_download": "Select Download",
    "download": "Download",
    "file_download": "File Download Complete. Please check in Files app.",
    "file_download_complete":
        "File Download Complete. Please check in Downloads folder.",
    "request_sent": "Request sent",
    "push_notification": "Push Notification",
    "sms": "SMS",
    "allow_notification": "Allow Notification",

    "mymadallahrewards": 'Mymadallah - Rewards',
    "enaya_wellness": 'Enaya Wellness',
    "share": "Share",
    "offer_validity": "Offer Validity",
    "off": "OFF",

    //Gender Image

    "maleImage": "male-right.png",
    "femaleImage": "female-right.png",
    "personImage": "person.png",

    //Login
    "AUTHENTICATEUSER.INVALIDCREDENTIALS": "Invalid Credentials",
    //Update user
    "UPDATEACCOUNT.INVALIDNAME": "Invalid Username",
    "UPDATEACCOUNT.INVALIDEMAILID": "Invalid Username",
    "UPDATEACCOUNT.NOTAVALIDEMAIL": "Not a valid Email",

    //REGISTERUSER
    "REGISTERUSER.INVALIDUSERNAME": "Invalid Username",
    "REGISTERUSER.INVALIDEMAIL": "Invalid Email",

    "REGISTERUSER.INVALIDUSERGROUPKEY": "Invalid Usergroupkey",
    "REGISTERUSER.INVALIDDOB": "Invalid DOB",
    "REGISTERUSER.INVALIDMEMBEREMIRATESIDNO":
        "Invalid Member EmiratesID Number",
    "REGISTERUSER.INVALIDMEMBEREMIRATESIDNOLENGTH":
        "Invalid member Emirates ID length",
    "REGISTERUSER.YEAROFBIRTHMISMATCH":
        "2nd part from Emirates ID field is your Year of Birth and it is not matching withthe one in DOB field",
    "REGISTERUSER.INVALIDMOBILE": "Invalid Mobile",
    "REGISTERUSER.NOTAVALIDUAEMOBILE":
        "Invalid Mobile ( *Number should start with 971 and No of Digits should be 12 )",
    "REGISTERUSER.NOTAVALIDMEMBER":
        "Given details are not matching with our records, please contact your HR.", //"Not a valid Almadallah Member",
    "REGISTERUSER.USERNAMEEXISTS":
        "Username already exists. Please try again with a different username.",
    "REGISTERUSER.USEREXISTS":
        "Username already exists. Please try again with a different username", // "User already exists",
    "REGISTERUSER.ERROROCCURED": "Error Occurred",
    //MEMBERDETAILS
    "MEMBERDETAILS.INVALIDMEMBER": "Invalid Member",

    //MEMBERUTILIZATIONDETAILS
    "MEMBERUTILIZATIONDETAILS.INVALIDMEMBER": "Invalid Member",
    "MEMBERUTILIZATIONDETAILS.INVALIDMEMBERDETAIL": "Invalid Member Details",

    //submitClaim
    "SAVEONLINECLAIM.NOTAVALIDDOCUMENTSFOLDERPATH": "Not a valid request",
    "SAVEONLINECLAIM.NOTAVALIDMEMBER":
        "Given details are not matching with our records, please contact your HR.", // "Not a valid Member",
    "SAVEONLINECLAIM.INVALIDCARDNO": "Invalid Card No",
    "SAVEONLINECLAIM.INVALIDSERVICEDATE": "Invalid Service Date",
    "SAVEONLINECLAIM.INVALIDCLAIMEDCOST": "Invalid Claimed Cost",
    "SAVEONLINECLAIM.INVALIDCLAIMATTACHMENT": "Invalid Claim Attachment",
    "SAVEONLINECLAIM.NOTAVALIDCLAIMATTACHMENT":
        "Uploaded Claim Attachment is not in proper format",
    "SAVEONLINECLAIM.NOTAVALIDCLAIMATTACHMENTFILESIZE":
        "Claim Attachment file size cannot be equal to 0 Bytes",
    "SAVEONLINECLAIM.INVALIDMEMBERBANKIBAN": "Invalid Member Bank IBAN",

    "SAVEONLINECLAIM.INVALIDUSEMEMBERDEFAULTBANKACCOUNT": "Not a valid request",
    "SAVEONLINECLAIM.NOVALIDBANKACCOUNTFOUNDFORMEMBER":
        "No valid Bank Account found for the member",

    "SAVEONLINECLAIM.INVALIDMEMBERBANKACCOUNTNAME":
        "Invalid Member Bank Account Name",
    "SAVEONLINECLAIM.INVALIDBANKSWIFTCODE": "Invalid Member Bank Swift Code",
    "SAVEONLINECLAIM.INVALIDMEMBERBANKSWIFTCODE":
        "Invalid Member Bank Swift Code",
    "SAVEONLINECLAIM.INVALIDPAYMENTTYPE": "Invalid Payment Type",
    "SAVEONLINECLAIM.INVALIDISRESUBMISSION": "Not a valid request",
    "SAVEONLINECLAIM.NOVALIDCLAIMSUBMISSIONFOUND":
        "No valid Claim Submission found",
    "SAVEONLINECLAIM.INVALIDSUBMISSIONCLAIMREF": "Invalid Submission Claim Ref",
    "SAVEONLINECLAIM.NOTAVALIDOPTIONALATTACHMENT3FILESIZE":
        "Optional Attachment3 file size cannot be greater than Size 2MB",

    "SAVEONLINECLAIM.NOTAVALIDOPTIONALATTACHMENT3":
        "Uploaded OptionalAttachment3 is not in proper format",
    "SAVEONLINECLAIM.NOTAVALIDOPTIONALATTACHMENT2FILESIZE":
        "Optional Attachment2 file size cannot be greater than Size2MB",

    "SAVEONLINECLAIM.NOTAVALIDOPTIONALATTACHMENT2":
        "Uploaded Optional Attachment2 is not in properformat",
    "SAVEONLINECLAIM.NOTAVALIDOPTIONALATTACHMENT1FILESIZE":
        "Optional Attachment1 file size cannot be greater than Size2MB",

    "SAVEONLINECLAIM.NOTAVALIDOPTIONALATTACHMENT1":
        "Uploaded Optional Attachment1 is not in proper format",
    "SAVEONLINECLAIM.NOTAVALIDREQUEST": "Not a valid request",
    "SAVEONLINECLAIM.INVALIDCLAIMTYPE": "Not a valid request",
    "SAVEONLINECLAIM.INVALIDREQUESTREF": "Not a valid request",
    "SAVEONLINECLAIM.ALREADYCLAIMEXISTWITHSAMEREQUESTREF":
        "Not a valid request",
    "SAVEONLINECLAIM.NOVALIDCOMPANYCONTRACTFOUND": "Not a valid request",

    // FORGOTUSERNAME
    "FORGOTUSERNAME.INVALIDMEMBEREMIRATESIDNO": "Invalid EmiratesIDNo",
    "FORGOTUSERNAME.INVALIDREGISTEREDEMAIL": "Invalid Registered Email",
    "FORGOTUSERNAME.NOVALIDUSERFOUND": "No valid user found",
    // FORGOTPASSWORD
    "FORGOTPASSWORD.INVALIDUSERNAME": "Invalid Username",
    "FORGOTPASSWORD.INVALIDREGISTEREDEMAIL": "Invalid Registered Email",
    "FORGOTPASSWORD.NOVALIDUSERFOUND": "No valid user found",
    //SearchClaim
    "SEARCHCLAIMS.INVALIDMEMBER": "Invalid Member",
    "SEARCHCLAIMS.INVALIDSERVICEFROMDATE": "Invalid Service From Date",
    "SEARCHCLAIMS.INVALIDSERVICETODATE": "Invalid Service To Date",

//savecontactreasondetails
    "SAVECONTACTREASONDETAILS.INVALIDCONTACTREASONKEY":
        "Invalid ContactReasonKey",
    "SAVECONTACTREASONDETAILS.INVALIDEMAIL": "Invalid Email",
    "SAVECONTACTREASONDETAILS.NOTAVALIDEMAIL": "Not a valid Email",
    "SAVECONTACTREASONDETAILS.INVALIDCOMMENTS": "Invalid Comments",
//UpdatePassword
    "UPDATEPASSWORD.INVALIDPASSWORD": "Invalid Password",
    "UPDATEPASSWORD.MINIMUMLENGTHISSUE":
        "Password min length should be atleast 6",
    "REGISTERUSER.NOTAVALIDEMAIL": "Not a valid Email",

    //GetDownloadableFileList
    "GETDOWNLOADABLEFILELIST.MISSINGMANDATORYFIELDS":
        "Missing Mandatory fields",

    //Downloadfile
    "DOWNLOADFILE.MISSINGMANDATORYFIELDS": "Missing Mandatory fields",
    "DOWNLOADFILE.FILENOTFOUND": "File Not Found",
    "DOWNLOADFILE.INVALIDFILE": "Invalid File",

    //saveuserrequest
    "SAVEUSERREQUEST.MISSINGMANDATORYFIELDS": "Missing Mandatory fields.",
    "SAVEUSERREQUEST.INVALIDREQUEST": "Invalid Request.",
    "SAVEUSERREQUEST.REQUESTALREADYEXISTS": "Request Already Exists"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "ar": ar,
    "en": en
  };
}
