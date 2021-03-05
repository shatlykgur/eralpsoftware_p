
import 'package:eralpsoftware_p/pages/login_sayfasi.dart';
import 'package:eralpsoftware_p/pages/yonlendirme_sayfasi.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eralp Software Project',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: LoginSayfa(),
    );
  }
}
