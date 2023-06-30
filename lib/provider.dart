import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class MyFunctions extends ChangeNotifier {
  bool _canChooseLvl = false;
  bool get canChooseLvl => _canChooseLvl;

  final double _lvl = 0.5;
  double get lvl => _lvl;

  String shortenedLvl() {
    double level = lvl * 10;
    return level.toStringAsFixed(1);
  }

  Future<void> firstButton() async {}

  Future<void> secondButton() async {
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    }
  }

  void thirdButton() {
    _canChooseLvl = !canChooseLvl;
    notifyListeners();
    print('w providerze => $canChooseLvl');
  }

  void share() async {
    await Share.share('Upodliłem się ${MyFunctions().shortenedLvl()}/10 ',
        subject: 'Jak Bardzo Się Upodliłem');
  }

  void fourthButton() {}

  final _url = Uri(scheme: 'tel', path: '999');
}
