import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
    HomeScreen({Key? key}) : super(key: key);

  var controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      body: GetBuilder<HomeController>(
        builder: (ctrl) {
          return Column(
            children: const [

            ],
          );
        },
      ),
    );
  }

  userTile(){

  }


}
