import 'package:flutter/material.dart';
import 'package:kacapp/widgets.dart';
import 'package:kacapp/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyFunctions(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Kac App',
            home: ChangeNotifierProvider(
                create: (context) => MyFunctions(),
                child: const MyHomePage(title: ' Kac App'))));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextStyle aTxtStyle =
      const TextStyle(color: Colors.white, fontSize: 16);
  double lvl = 0.5;

  String shortenedLvl() {
    double level = lvl * 10;
    return level.toStringAsFixed(1);
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
        child: Column(children: [
          const Spacer(),
          MyWidgets().button(
              Text('ZNAJDŹ PIJĄCEGO W POBLIŻU', style: aTxtStyle),
              () => MyFunctions().firstButton(),
              context),
          const Spacer(),
          MyWidgets().button(Text('ZAMÓW KARETKE', style: aTxtStyle),
              () => MyFunctions().secondButton(), context),
          const Spacer(),
          MyWidgets().button(
              MyWidgets().thirdButtonWidget(shortenedLvl, context),
              () => MyFunctions().thirdButton(),
              context),
          const Spacer(),
          MyWidgets().button(Text('ZAMÓW KLINA ON-LINE', style: aTxtStyle),
              () => MyFunctions().fourthButton(), context),
          const Spacer(),
        ]),
      ),
    );
  }
}
