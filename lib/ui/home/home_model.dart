import 'package:flutter/material.dart';
import 'package:my_neo/models/user/get_all_user.dart';

class HomeModel {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<UserData> _userList = [];

  bool _stopPagination = false;

  int _currentPage = 0;

  setLoading(bool b) {
    _isLoading = b;
  }

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

  List<UserData> get userList => _userList;

  bool get stopPagination => _stopPagination;



  int get currentPage => _currentPage;

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

  setCurrentPage(int i){
    _currentPage =i;
  }

  addToUserList(List<UserData> data) {
    _userList.addAll(data);
  }

  setStopPagination(bool b){
    _stopPagination = b;
  }

}
