import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';

class MyFunctions extends ChangeNotifier {
  // FIRST BUTTON | FIRST BUTTON | FIRST BUTTON | FIRST BUTTON

  // SECOND BUTTON | SECOND BUTTON | SECOND BUTTON | SECOND BUTTON
  final _url = Uri(scheme: 'tel', path: '999');

  Future<void> secondButton() async {
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    }
  }

  // THIRD BUTTON | THIRD BUTTON | THIRD BUTTON | THIRD BUTTON

  bool _canChooseLvl = false;
  bool get canChooseLvl => _canChooseLvl;

  double _lvl = 0.5;
  double get lvl => _lvl;

  setSliderVal(value) {
    _lvl = value;
    notifyListeners();
  }

  String shortenedLvl() {
    double level = lvl * 10;
    return level.toStringAsFixed(1);
  }

  void thirdButton() {
    _canChooseLvl = !_canChooseLvl;
    notifyListeners();
  }

  void share() async {
    await Share.share('Upoiłem się ${shortenedLvl()}/10 ',
        subject: 'Jak Bardzo Się Upoiłem');
  }

  // FOURTH BUTTON | FOURTH BUTTON | FOURTH BUTTON | FOURTH BUTTON
  bool _areAvailable = false;
  bool get areAvailable => _areAvailable;
  void fourthButton() {
    _areAvailable = !areAvailable;
    notifyListeners();
  }
}

class FirstButtonNotfier extends ChangeNotifier {
  int timesClicked = -1;
  late int firstGeneratedNumber;
  int getRandNumber() {
    // for (int i = 0; i < 100; ++i) {
    //   Random().nextInt(i * 20) - (i * 10) + firstGeneratedNumber;
    // }

    ++timesClicked;
    if (timesClicked == 0) {
      firstGeneratedNumber = Random().nextInt(800) + 800;
      return firstGeneratedNumber;
    } else if (timesClicked == 1) {
      return (Random().nextInt(timesClicked * 20) - (timesClicked * 10)) +
          firstGeneratedNumber;
    } else if (timesClicked == 2) {
      return (Random().nextInt(timesClicked * 20) - (timesClicked * 10)) +
          firstGeneratedNumber;
    } else if (timesClicked == 3) {
      return (Random().nextInt(timesClicked * 20) - (timesClicked * 10)) +
          firstGeneratedNumber;
    } else {
      timesClicked = -1;
      return Random().nextInt(1200) + 150;
    }
  }

  bool _isSearchingForGuy = false;
  bool get isSearchingForGuy => _isSearchingForGuy;
  void firstButton() {
    if (_isSearchingForGuy == true) {
      _isSearchingForGuy == false;
    } else {
      _isSearchingForGuy = true;
    }
    notifyListeners();
  }
}
