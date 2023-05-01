import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:my_neo/ui/login/login_screen.dart';
import 'package:my_neo/utils/routes.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ///remove this when run on real device

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Neo',
      getPages: Routes.pages,
      home: LoginScreen(),
    );
  }
}



class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BootstrapContainer(
          fluid: true,
          decoration: BoxDecoration(color: Colors.blue),
          children: [
            BootstrapRow(
              children: <BootstrapCol>[
                BootstrapCol(
                  sizes: 'col-3',
                  child: ContentWidget(
                    text: 'col 1 of 3',
                    color: Colors.green,
                  ),
                ),
                BootstrapCol(
                  sizes: 'col-5',
                  child: ContentWidget(
                    text: 'col 2 of 3 (wider)',
                    color: Colors.red,
                  ),
                ),
                BootstrapCol(
                  sizes: 'col-3',
                  child: ContentWidget(
                    text: 'col 3 of 3',
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  const ContentWidget({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: color,
      child: Text(text),
    );
  }
}