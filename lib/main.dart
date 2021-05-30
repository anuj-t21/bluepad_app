import 'package:bluepad_app/providers/count.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => Count())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bluepad app',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
