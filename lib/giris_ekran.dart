import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasam_sureci/constants.dart';
import 'package:yasam_sureci/result_page.dart';
import 'package:yasam_sureci/user_data.dart';

import 'cinsiyet.dart';
import 'containers.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String seciliCinsiyet = "";
  double icilenSigara = 0.0;
  double sporGunu = 0.0;
  int boy = 160, kilo = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Yaşam Süreci",
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Boy Kilo container
          Expanded(
            child: Row(
              children: [
                Expanded(
                  //Kendi containerımızı çağırıyoruz
                  child: MyContainer(
                    //Boy ve kilonun olduğu containerı çağırıyoruz
                    child: buildOtlineButton("BOY"),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildOtlineButton("KİLO"),
                  ),
                ),
              ],
            ),
          ),
          //Spor container
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Haftada Kaç Kez Spor Yapıyorsunuz?",
                    style: kMetinStil,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    //round ile double değişkeni yuvarlıyoruz
                    "${sporGunu.round()}",
                    style: kSayiStil,
                  ),
                  Slider(
                    min: 0,
                    max: 7,
                    divisions: 7,
                    value: sporGunu,
                    onChanged: (double newValue) {
                      setState(() {
                        sporGunu = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          //Sigara Container
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Günde Kaç Sigara İçiyorsunuz?",
                    style: kMetinStil,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    //round ile double değişkeni yuvarlıyoruz
                    "${icilenSigara.round()}",
                    style: kSayiStil,
                  ),
                  Slider(
                    min: 0,
                    max: 40,
                    value: icilenSigara,
                    onChanged: (double newValue) {
                      setState(() {
                        icilenSigara = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          //Cinsiyet Container
          Expanded(
            child: Row(
              children: [
                //Kadın container
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = "KADIN";
                      });
                    },
                    color: (seciliCinsiyet == "KADIN")
                        ? Colors.white60
                        : Colors.white,
                    child: IconCinsiyet(
                        iconData: FontAwesomeIcons.venus, cinsiyet: "KADIN"),
                  ),
                ),
                //Erkek container
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = "ERKEK";
                      });
                    },
                    color: (seciliCinsiyet == "ERKEK")
                        ? Colors.white60
                        : Colors.white,
                    child: IconCinsiyet(
                        iconData: FontAwesomeIcons.mars, cinsiyet: "ERKEK"),
                  ),
                ),
              ],
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    UserData(
                      boy: boy,
                      icilenSigara: icilenSigara,
                      kilo: kilo,
                      seciliCinsiyet: seciliCinsiyet,
                      sporGunu: sporGunu,
                    ),
                  ),
                ),
              );
            },
            child: Text(
              "Hesapla",
              style: kMetinStil,
            ),
            height: 45,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  //Boy ve Kilo containerleri
  Row buildOtlineButton(String metin) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            metin,
            style: kMetinStil,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            metin == "BOY" ? boy.toString() : kilo.toString(),
            style: kSayiStil,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 35,
              height: 40,
              child: OutlineButton(
                onPressed: () {
                  setState(() {
                    metin == "BOY" ? boy++ : kilo++;
                  });
                },
                child: const Icon(
                  FontAwesomeIcons.plus,
                  size: 20,
                  color: Colors.blueGrey,
                ),
                borderSide: const BorderSide(
                  color: Colors.blueGrey,
                ),
              ),
            ),
            ButtonTheme(
              minWidth: 35,
              height: 40,
              child: OutlineButton(
                onPressed: () {
                  setState(() {
                    metin == "BOY" ? boy-- : kilo--;
                  });
                },
                child: const Icon(
                  FontAwesomeIcons.minus,
                  size: 20,
                  color: Colors.blueGrey,
                ),
                borderSide: const BorderSide(
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
