import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyModel {
  final count = 0.obs; // Use GetX's Observable to bind the count
  increment(){
     count.value++;
  }
}

class MyController extends GetxController {
  final model = MyModel();

  increment() => model.increment();
}

class MyView extends GetWidget<MyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Count: ${controller.model.count.value}'),
            ElevatedButton(
              onPressed: controller.increment,
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}