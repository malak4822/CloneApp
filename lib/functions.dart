import 'package:kacapp/main.dart';
import 'package:kacapp/mywidgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Functions {
  final _url = Uri(scheme: 'tel', path: '999');

  Functions();

  Future<void> firstButton() async {}

  Future<void> secondButton() async {
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    }
  }

  void thirdButton() {
    MyWidgets().toogle();
  }

  void fourthButton() {}
}
