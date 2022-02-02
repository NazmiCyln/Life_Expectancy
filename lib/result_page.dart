import 'package:flutter/material.dart';
import 'package:yasam_sureci/constants.dart';
import 'package:yasam_sureci/hesap.dart';
import 'package:yasam_sureci/user_data.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;

  ResultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sonuç Sayfası"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 8,
            child: Center(
              child: Text(
                "Sonuç: "+Hesap(_userData).hesaplama().round().toString(),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Geri Dön",
                style: kMetinStil,
              ),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
