import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../utils/responsive.dart';

import '../home_controller.dart';
import '../../../globle.dart';

class Header extends StatelessWidget {
  Header({
    Key? key,
  }) : super(key: key);

  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              controller.controlMenu();
            },
          ),
        if (!Responsive.isMobile(context))
          Text(
            dashBoard,
            style: Theme.of(context).textTheme.headline6,
          ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(child: SearchField()),
      ],
    );
  }
}

class SearchField extends StatelessWidget {
  SearchField({
    Key? key,
  }) : super(key: key);

  var controller = Get.find<HomeController>();
  Timer? _debounce;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text){
        if (_debounce?.isActive ?? false) _debounce!.cancel();
        _debounce = Timer(const Duration(milliseconds: 800), () {
          controller.searchUser();
        });
      },
      controller: controller.model.userSearchController,
      decoration:  InputDecoration(
        hintText: "Search",
        fillColor: secondaryColor,
        suffixIcon: Icon(Icons.close).onClick((){
          controller.clearSearch();
        }),
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
