import 'package:flutter/material.dart';
import 'package:kacapp/fadeTxt.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kac App',
      home: MyHomePage(title: ' Kac App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool canChooseLvl = false;
  final TextStyle aTxtStyle =
      const TextStyle(color: Colors.white, fontSize: 16);
  double lvl = 0.5;

  final Uri url = Uri(scheme: 'tel', path: '999');

  String shortenedLvl() {
    double level = lvl * 10;
    return level.toStringAsFixed(1);
  }

  Future<bool> hideAfter() async {
    Future.delayed(const Duration(milliseconds: 700));
    bool visible = !canChooseLvl;
    return visible;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        leadingWidth: 80,
        leading: Row(
          children: [
            const SizedBox(width: 20),
            Image.asset('assets/cross.png', width: 50)
          ],
        ),
        backgroundColor: const Color.fromRGBO(160, 20, 52, 1),
        title: Text(widget.title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w500)),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            button(Text('ZNAJDŹ PIJĄCEGO W POBLIŻU', style: aTxtStyle), () {}),
            const Spacer(),
            button(Text('ZAMÓW KARETKE', style: aTxtStyle), () async {
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            }),
            const Spacer(),
            button(
                Column(children: [
                  AnimatedOpacity(
                      duration: const Duration(milliseconds: 700),
                      opacity: !canChooseLvl ? 1 : 0,
                      child: FutureBuilder(
                          future: hideAfter(),
                          builder: (context, snapshot) => Text(
                              'UDOSTĘPNIJ SWÓJ STAN UPOJENIA',
                              style: aTxtStyle))),
                  AnimatedOpacity(
                      opacity: canChooseLvl ? 1 : 0,
                      duration: const Duration(milliseconds: 700),
                      child: Visibility(
                          visible: canChooseLvl,
                          child: Slider(
                            value: lvl,
                            onChanged: (newValue) {
                              setState(() {
                                lvl = newValue;
                              });
                            },
                            activeColor: Colors.white,
                            inactiveColor: Colors.white.withOpacity(0.5),
                          ))),
                  AnimatedOpacity(
                      opacity: canChooseLvl ? 1 : 0,
                      duration: const Duration(milliseconds: 700),
                      child: Expanded(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            Text(
                              "Upodliłem się ${shortenedLvl()}/10",
                              style: const TextStyle(color: Colors.white),
                            ),
                            IconButton(
                                onPressed: () async {
                                  await Share.share(
                                      'Upodliłem się ${shortenedLvl()}/10 ',
                                      subject: 'Jak Bardzo Się Upodliłem');
                                },
                                icon: const Icon(
                                  Icons.done,
                                  color: Colors.white,
                                ))
                          ])))
                ]), () {
              setState(() {
                canChooseLvl = !canChooseLvl;
              });
            }),
            const Spacer(),
            button(Text('ZAMÓW KLINA ON-LINE', style: aTxtStyle), () {}),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget button(Widget widget, Function function) => ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: Size(MediaQuery.of(context).size.width * 6 / 7,
              MediaQuery.of(context).size.height * 1 / 7),
          backgroundColor: const Color.fromRGBO(170, 25, 52, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(width: 3),
          ),
          foregroundColor: Colors.black),
      onPressed: () => function(),
      child: widget);
}
