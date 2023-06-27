import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kac App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ' Kac App'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.loyalty, size: 58, color: Colors.white),
              Text(widget.title,
                  style:const TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold)),
            ],
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            button('ZNAJDŹ PIJĄCEGO W POBLIŻU'),
            button('ZAMÓW KARETKE'),
            button('UDOSTĘPNIJ SWÓJ STAN UPOJENIA'),
            button('ZAMÓW KLINA ON-LINE'),
          ],
        ),
      ),
    );
  }

  Widget button(String txt) => Column(children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(MediaQuery.of(context).size.width * 3 / 4, MediaQuery.of(context).size.width * 1 / 4),
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(width: 2),
              ),
            ),
            onPressed: () {},
            child: Text(
              txt,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            )),
        const SizedBox(height: 40)
      ]);
}
