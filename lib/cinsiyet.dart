import 'package:flutter/material.dart';
import 'package:yasam_sureci/constants.dart';

class IconCinsiyet extends StatelessWidget {
  IconData iconData;
  String cinsiyet;

  IconCinsiyet({required this.iconData, required this.cinsiyet});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 50,
          color: Colors.black54,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          cinsiyet,
          style: kMetinStil,
        ),
      ],
    );
  }
}