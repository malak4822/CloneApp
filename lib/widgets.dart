import 'package:flutter/material.dart';
import 'package:kacapp/provider.dart';
import 'package:provider/provider.dart';

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

  Widget thirdButtonWidget(BuildContext context) {
    bool canChooseLvl = Provider.of<MyFunctions>(context).canChooseLvl;
    double drunkLvl = Provider.of<MyFunctions>(context).lvl;

    print('w widgecie ::: $canChooseLvl');

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
              "Upodliłem się ${context.watch<MyFunctions>().shortenedLvl()}/10",
              style: const TextStyle(color: Colors.white),
            ),
            IconButton(
                onPressed: () => context.watch<MyFunctions>().share(),
                icon: const Icon(Icons.done, color: Colors.white))
          ]))
    ]);
  }
}

// class Button extends StatelessWidget {
//   Button({super.key, required this.function, this.widget});
//   dynamic function;
//   Widget? widget;

//   @override
//   Widget build(BuildContext context) {
//     bool canChooseLvl =
//         Provider.of<MyFunctions>(context, listen: false).canChooseLvl;
//     return ElevatedButton(
//         style: ElevatedButton.styleFrom(
//             fixedSize: Size(MediaQuery.of(context).size.width * 6 / 7,
//                 MediaQuery.of(context).size.height * 1 / 7),
//             backgroundColor: canChooseLvl
//                 ? Colors.green
//                 : const Color.fromRGBO(160, 20, 52, 1),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//               side: const BorderSide(width: 3),
//             ),
//             foregroundColor: Colors.black),
//         onPressed: () => function(),
//         child: widget);
//   }
// }

// class ThirdButtonWidget extends StatelessWidget {
//   const ThirdButtonWidget({super.key});
//   @override
//   Widget build(BuildContext context) {
//     // '${context.watch<ProvClass>().counter}',

//     bool canChooseLvl =
//         Provider.of<MyFunctions>(context, listen: true).canChooseLvl;
//     double drunkLvl = Provider.of<MyFunctions>(context).lvl;
//     print('w widgecie = > $canChooseLvl');
//     return Column(children: [
//       AnimatedSize(
//           curve: Curves.bounceIn,
//           duration: const Duration(milliseconds: 300),
//           child: Text('UDOSTĘPNIJ SWÓJ STAN UPOJENIA',
//               style: TextStyle(
//                   color: Colors.white, fontSize: canChooseLvl ? 16 : 0))),
//       Expanded(
//           child: Container(
//               color:
//                   Provider.of<MyFunctions>(context, listen: false).canChooseLvl
//                       ? Colors.green
//                       : Colors.blue,
//               width: context.watch<MyFunctions>().canChooseLvl
//                   ? 100
//                   : double.infinity,
//               child: const Icon(
//                 Icons.sentiment_satisfied_alt_outlined,
//               ))),
//       AnimatedSize(
//           curve: Curves.bounceIn,
//           duration: const Duration(milliseconds: 300),
//           child: Slider(
//             value: drunkLvl,
//             onChanged: (newValue) {
//               drunkLvl = newValue;
//             },
//             activeColor: Colors.white,
//             inactiveColor: Colors.white.withOpacity(0.5),
//           )),
//       AnimatedSize(
//           curve: Curves.bounceIn,
//           duration: const Duration(milliseconds: 300),
//           child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//             Text(
//               "Upodliłem się ${MyFunctions().shortenedLvl()}/10",
//               style: const TextStyle(color: Colors.white),
//             ),
//             IconButton(
//                 onPressed: () => MyFunctions().share(),
//                 icon: const Icon(Icons.done, color: Colors.white))
//           ]))
//     ]);
//   }
// }
