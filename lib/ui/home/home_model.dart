import 'package:flutter/material.dart';

class HomeModel {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;


  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();


  TextEditingController get emailController => _emailController;
  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get mobileNumberController => _mobileNumberController;

  setEmailText(String s){
    _emailController.text = s;
  }
  setFirstNameText(String s){
    _firstNameController.text = s;
  }
  setLastNameText(String s){
    _lastNameController.text = s;
  }
  setMobileNameText(String s){
    _mobileNumberController.text =s;
  }

  List<UserModel> userList = [];

  addToUserList(UserModel u) {
    userList.add(u);
  }
}

class UserModel {
  String? firstName;
  String? lastName;
  String? mobileNumber;
  String? email;
  String? id;

  UserModel(this.id, this.firstName, this.lastName, this.email,this.mobileNumber);
}
