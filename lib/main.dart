import 'package:bakery_order_system/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bakery Order System',
      theme: AppThemeData.appThemeData[AppThemeEnum.lightTheme],
      home: Container(),
    );
  }
}
