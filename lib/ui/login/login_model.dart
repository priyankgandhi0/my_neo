import 'package:flutter/cupertino.dart';

class LoginModel {


  bool _isLoading = false;
  bool _isShowPassword = false;

  String? _emailError;
  String? _passwordError;

  setShowPassword(){
    _isShowPassword =  !_isShowPassword;
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();



  setEmailError(String s){
    _emailError = s;
  }

  setPasswordError(String s){
    _passwordError = s;
  }

  setIsLoading(bool b){
    _isLoading = b;
  }

  setTextToEmailCotnroller(String s){
    emailController.text = s;
  }

  setTextToPasswordController(String s){
    passwordController.text =s;
  }

  bool get isShowPassword => _isShowPassword;
  bool get isLoading => _isLoading;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  String get emailError => _emailError ?? "";
  String get passwordError => _passwordError ?? "";
}