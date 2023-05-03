import 'dart:collection';
import 'dart:convert';
import 'package:my_neo/widgets/extensions/cmn_ext.dart';


/// error : {"login":["You are not registered"]}

ShasError? errorFromJson(String str) {
  var data = json.decode(str);
  if(data is String){
    data.debugPrint;
    return ShasError("Something went wrong");
  }else{
    return data['error'] != null ? ShasError.fromJson(data['error']) : null;
  }

}
class ShasError {


  ShasError.fromJson(dynamic json) {
    _errors.clear();
    (json as LinkedHashMap).forEach((key, value) {
      _errors.add("$key : ${value[0]}");
    });

    if(_errors.isNotEmpty){
      _errorMessage = _errors.first;
    }else{
      _errorMessage = "Something went wrong";
    }

    _errors.forEach((element) {
      element.debugPrint;
    });
  }

  List<String> _errors = [];
  late String _errorMessage;

  List<String>? get errors => _errors;
  String? get errorMessage => _errorMessage;

  ShasError(this._errorMessage);
}
