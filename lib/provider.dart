import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyFunctions extends ChangeNotifier {
  bool _canChooseLvl = false;
  bool get canChooseLvl => _canChooseLvl;

  void toogle() {
    _canChooseLvl = !_canChooseLvl;
    notifyListeners();
    print('essa');
  }

  final double _lvl = 0.5;
  double get lvl => _lvl;

  final _url = Uri(scheme: 'tel', path: '999');

  MyFunctions();

  Future<void> firstButton() async {}

  Future<void> secondButton() async {
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    }
  }

  void thirdButton() {}

  void fourthButton() {}
}
