import 'dart:convert';
/// status : 1
/// msg : "Successfully login"
/// data : {"admin_id":1,"email":"parth@yopmail.com","firebase_token":"123456","is_logout":0}

AdminLogin adminLoginFromJson(String str) => AdminLogin.fromJson(json.decode(str));
String adminLoginToJson(AdminLogin data) => json.encode(data.toJson());
class AdminLogin {
  AdminLogin({
      bool? status,
      String? msg, 
      Data? data,}){
    _status = status;
    _msg = msg;
    _data = data;
}

  AdminLogin.fromJson(dynamic json) {
    _status = json['status']==1;
    _msg = json['msg'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _msg;
  Data? _data;

  bool? get status => _status;
  String? get msg => _msg;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// admin_id : 1
/// email : "parth@yopmail.com"
/// firebase_token : "123456"
/// is_logout : 0

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      num? adminId, 
      String? email, 
      String? firebaseToken, 
      num? isLogout,}){
    _adminId = adminId;
    _email = email;
    _firebaseToken = firebaseToken;
    _isLogout = isLogout;
}

  Data.fromJson(dynamic json) {
    _adminId = json['admin_id'];
    _email = json['email'];
    _firebaseToken = json['firebase_token'];
    _isLogout = json['is_logout'];
  }
  num? _adminId;
  String? _email;
  String? _firebaseToken;
  num? _isLogout;
Data copyWith({  num? adminId,
  String? email,
  String? firebaseToken,
  num? isLogout,
}) => Data(  adminId: adminId ?? _adminId,
  email: email ?? _email,
  firebaseToken: firebaseToken ?? _firebaseToken,
  isLogout: isLogout ?? _isLogout,
);
  num? get adminId => _adminId;
  String? get email => _email;
  String? get firebaseToken => _firebaseToken;
  num? get isLogout => _isLogout;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['admin_id'] = _adminId;
    map['email'] = _email;
    map['firebase_token'] = _firebaseToken;
    map['is_logout'] = _isLogout;
    return map;
  }

}