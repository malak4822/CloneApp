import 'package:flutter/material.dart';
import 'package:kacapp/main.dart';
import 'package:kacapp/provider.dart';
import 'package:provider/provider.dart';

class Button extends StatelessWidget {
  Button({super.key, required this.function, this.widget});
  dynamic function;
  Widget? widget;

  @override
  Widget build(BuildContext context) {
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
}

class FirstButtonWidget extends StatelessWidget {
  const FirstButtonWidget({super.key});
  @override
  Widget build(BuildContext context) {
    bool isSearchingForGuy =
        Provider.of<MyFunctions>(context).isSearchingForGuy;
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      AnimatedSize(
        duration: const Duration(milliseconds: 300),
        child: SizedBox(
          width: isSearchingForGuy == false ? null : 0,
          height: isSearchingForGuy == false ? null : 0,
          child: const Text('ZNAJDŹ PIJĄCEGO W POBLIŻU',
              style: aTxtStyle, textAlign: TextAlign.center),
        ),
      ),
      if (isSearchingForGuy == true)
        FutureBuilder(
            future: Future.delayed(const Duration(seconds: 2)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(color: Colors.white);
              } else if (snapshot.connectionState == ConnectionState.done) {
                return Text(
                  'ZNALEZIONO PIJĄCEGO ${Provider.of<MyFunctions>(context).getRandNumber()}M. OD CIEBIĘ',
                  style: aTxtStyle,
                  textAlign: TextAlign.center,
                );
              }
              throw ();
            })
    ]);
  }
}

class ThirdButtonWidget extends StatelessWidget {
  const ThirdButtonWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    final myFunctions = Provider.of<MyFunctions>(context);
    bool canChooseLvl = myFunctions.canChooseLvl;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: SizedBox(
            height: !canChooseLvl ? 16 : 0,
            child: const Text(
              'UDOSTĘPNIJ SWÓJ STAN UPOJENIA',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        AnimatedOpacity(
          opacity: canChooseLvl ? 1 : 0,
          duration: const Duration(milliseconds: 300),
          child: SizedBox(
            height: canChooseLvl ? 30 : 0,
            child: Slider(
              value: myFunctions.lvl,
              onChanged: (newValue) {
                myFunctions.setSliderVal(newValue);
              },
              activeColor: Colors.white,
              inactiveColor: Colors.white.withOpacity(0.5),
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: SizedBox(
            width: canChooseLvl ? null : 0,
            height: canChooseLvl ? 40 : 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Upoiłem się ${myFunctions.shortenedLvl()}/10",
                  style: const TextStyle(color: Colors.white),
                ),
                IconButton(
                  onPressed: () => myFunctions.share(),
                  icon: const Icon(Icons.done, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class FourthButtonWidget extends StatelessWidget {
  const FourthButtonWidget({super.key});
  @override
  Widget build(BuildContext context) {
    bool areAvailable = Provider.of<MyFunctions>(context).areAvailable;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            child: SizedBox(
                height: !areAvailable ? null : 0,
                width: !areAvailable ? null : 0,
                child: const Text('ZAMÓW KLINA ON-LINE', style: aTxtStyle))),
        AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            child: SizedBox(
                height: areAvailable ? null : 0,
                width: areAvailable ? null : 0,
                child: const Text('KLINY SIĘ SKOŃCZYŁY, PRZYJDŹ JUTRO',
                    style: aTxtStyle)))
      ],
    );
  }
}
