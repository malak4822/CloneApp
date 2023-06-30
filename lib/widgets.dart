import 'package:flutter/material.dart';
import 'package:kacapp/provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class MyWidgets {
  Widget button(Widget widget, Function function, BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(MediaQuery.of(context).size.width * 6 / 7,
                MediaQuery.of(context).size.height * 1 / 7),
            backgroundColor: const Color.fromRGBO(160, 20, 52, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(width: 3),
            ),
            foregroundColor: Colors.black),
        onPressed: () => function(),
        child: widget);
  }

  Widget thirdButtonWidget(Function shortenedLvl, BuildContext context) {
    bool canChooseLvl = Provider.of<MyFunctions>(context).canChooseLvl;
    double drunkLvl = Provider.of<MyFunctions>(context).lvl;

    return Column(children: [
      AnimatedSize(
          curve: Curves.bounceIn,
          duration: const Duration(milliseconds: 300),
          child: Text('UDOSTĘPNIJ SWÓJ STAN UPOJENIA',
              style: TextStyle(
                  color: Colors.white, fontSize: canChooseLvl ? 16 : 0))),
      AnimatedSize(
          curve: Curves.bounceIn,
          duration: const Duration(milliseconds: 300),
          child: Slider(
            value: drunkLvl,
            onChanged: (newValue) {
              drunkLvl = newValue;
            },
            activeColor: Colors.white,
            inactiveColor: Colors.white.withOpacity(0.5),
          )),
      AnimatedSize(
          curve: Curves.bounceIn,
          duration: const Duration(milliseconds: 300),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Upodliłem się ${shortenedLvl()}/10",
              style: const TextStyle(color: Colors.white),
            ),
            IconButton(
                onPressed: () async {
                  await Share.share('Upodliłem się ${shortenedLvl()}/10 ',
                      subject: 'Jak Bardzo Się Upodliłem');
                },
                icon: const Icon(Icons.done, color: Colors.white))
          ]))
    ]);
  }
}
