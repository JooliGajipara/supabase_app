import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_app/constants/constants.dart';
import 'package:supabase_app/constants/root_class.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Supabase App',
      theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.orange,
          appBarTheme: const AppBarTheme(
            color: Colors.orange,
          )),
      // initialRoute: '/login',
      home: Root(),
      getPages: pageRoute,
    );
  }
}
