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

const TextStyle aTxtStyle = TextStyle(color: Colors.white, fontSize: 16);

class _MyHomePageState extends State<MyHomePage> {
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
              const Text('ZNAJDŹ PIJĄCEGO W POBLIŻU', style: aTxtStyle),
              context.read<MyFunctions>().firstButton,
              context),
          // Button(
          //   function: context.read<MyFunctions>().firstButton,
          //   widget: const Text('ZNAJDŹ PIJĄCEGO W POBLIŻU', style: aTxtStyle),
          // ),
          const Spacer(),
          MyWidgets().button(const Text('ZAMÓW KARETKE', style: aTxtStyle),
              context.read<MyFunctions>().secondButton, context),
          // Button(
          //   function: context.read<MyFunctions>().secondButton,
          //   widget: const Text('ZAMÓW KARETKE', style: aTxtStyle),
          // ),
          const Spacer(),
          MyWidgets().button(MyWidgets().thirdButtonWidget(context),
              context.read<MyFunctions>().thirdButton, context),
          // Button(
          //   function: context.read<MyFunctions>().thirdButton,
          //   widget: const ThirdButtonWidget(),
          // ),
          const Spacer(),
          MyWidgets().button(
              const Text('ZAMÓW KLINA ON-LINE', style: aTxtStyle),
              context.read<MyFunctions>().fourthButton,
              context),
          // Button(
          //   function: context.read<MyFunctions>().fourthButton,
          //   widget: const Text('ZAMÓW KLINA ON-LINE', style: aTxtStyle),
          // ),
          const Spacer(),
        ]),
      ),
    );
  }
}
