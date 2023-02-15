import 'package:challange_mobile_developer_flutter/config/initial_bindings.dart';
import 'package:challange_mobile_developer_flutter/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      title: 'Challenge Mobile Developer Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: Routes.routes,
    );
  }
}
