import 'package:flutter/material.dart';
import 'package:yasam_sureci/giris_ekran.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //Appbara ve appbardaki texte özelliklerini veriyoruz
        appBarTheme: const AppBarTheme(
          color: Colors.deepOrange,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Color(0xFFF5F0F0),
            fontSize: 23,
          ),
        ),
        //Butonların rengini belirtiyor
        // ignore: deprecated_member_use
        accentColor: Colors.deepOrange,
        //Scaffoldların rengini belirtiyor
        scaffoldBackgroundColor: Colors.blueGrey,
        //Textleri beyaz yapıyor
        brightness: Brightness.dark,
      ),
      home: InputPage(),
    );
  }
}
