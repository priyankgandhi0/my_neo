import 'package:flutter/material.dart';
import 'package:my_neo/models/user/get_all_user.dart';

import '../../models/base_model.dart';
import '../base/base_view_model.dart';

class HomeModel extends BaseViewModel{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<UserData> _userList = [];

  bool _stopPagination = false;

  int _currentPage = 0;

  int? _currentSelectedValue = 5;

  var _deviceTypes = [5, 10, 20, 50];

  String? _emailError;
  String? _firstNameError;
  String? _lastNameError;
  String? _mobileNumberError;
  String? _passwordError;

  String? get emailError => _emailError;

  String? get firstNameError => _firstNameError;

  String? get lastNameError => _lastNameError;

  String? get mobileNumberError => _mobileNumberError;

  String? get passwordError => _passwordError;

  setEmailError(String? s) {
    _emailError = s;
  }

  setFirstNameError(String? s) {
    _firstNameError = s;
  }

  setLastNameError(String? s) {
    _lastNameError = s;
  }

  setMobileNumberError(String? s) {
    _mobileNumberError = s;
  }

  setPasswordError(String? s) {
    _passwordError = s;
  }

  final TextEditingController _userSearchController = TextEditingController();


  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get emailController => _emailController;

  TextEditingController get firstNameController => _firstNameController;

  TextEditingController get lastNameController => _lastNameController;

  TextEditingController get mobileNumberController => _mobileNumberController;

  TextEditingController get passwordController => _passwordController;

  TextEditingController get userSearchController => _userSearchController;

  List<UserData> get userList => _userList;

  bool get stopPagination => _stopPagination;

  int get currentPage => _currentPage;

  int? get currentSelectedValue => _currentSelectedValue;

  List<int> get deviceTypes => _deviceTypes;

  setCurrentSelectedValue(int? s) {
    _currentSelectedValue = s;
  }

  setEmailText(String s) {
    _emailController.text = s;
  }

  setFirstNameText(String s) {
    _firstNameController.text = s;
  }

  setLastNameText(String s) {
    _lastNameController.text = s;
  }

  setMobileNameText(String s) {
    _mobileNumberController.text = s;
  }

  setCurrentPage(int i) {
    _currentPage = i;
  }

  addToUserList(List<UserData> data) {
    _userList.addAll(data);
  }

  setStopPagination(bool b) {
    _stopPagination = b;
  }

  setLoading(bool b) {
    _isLoading = b;
  }
}
