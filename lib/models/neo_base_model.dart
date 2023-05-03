import 'dart:convert';
/// status : 1
/// msg : "Succsessfully delete user."

NeoBaseModel neoBaseModelFromJson(String str) => NeoBaseModel.fromJson(json.decode(str));
String neoBaseModelToJson(NeoBaseModel data) => json.encode(data.toJson());

class NeoBaseModel {

  NeoBaseModel.fromJson(dynamic json) {
    _status = json['status']==1;
    _msg = json['msg'];
  }
  bool? _status;
  String? _msg;

  bool? get status => _status;
  String? get msg => _msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['msg'] = _msg;
    return map;
  }

}