import 'dart:convert';

String baseFromJson(String str) => "";

class BaseModel<T, E> {
  BaseModel({
    E? error,
    String? error2,

    ///remove this
    T? body,
  }) {
    _error = error;
    _body = body;
    _error2 = error2;
  }

  E? _error;
  String? _error2;
  T? _body;

  E? get error => _error;

  String? get error2 => _error2;

  T? get body => _body;
}

List<String> perekModel(String str) {
  return (json.decode(str) as List).map((e) {
    return e.toString();
  }).toList();
}

bool successModel(String str) {
  var jsonData = json.decode(str);
  if(jsonData["success"]!=null){
    return jsonData["success"] as bool;
  }else{
    return false;
  }
}