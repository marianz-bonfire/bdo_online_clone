import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  final String symbol;
  final VoidCallback onTap;
  const NumberButton({super.key, required this.symbol, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (symbol == 'fingerprint') {
      content = const Icon(Icons.fingerprint, size: 30);
    } else if (symbol == 'delete') {
      content = const Icon(Icons.backspace_outlined, size: 30);
    } else {
      content = Text(
        symbol,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
      );
    }
    /*
    return Material(
      color: Colors.grey[200],
      //borderRadius: BorderRadius.circular(18),
      child: InkWell(
        //borderRadius: BorderRadius.circular(18),
        onTap: () {},
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
          ),
          alignment: Alignment.center,
          child: Center(child: content),
        ),
      ),
    );
    */
    return MaterialButton(
      elevation: 0,
      onPressed: onTap,
      color: Colors.white,
      shape: const CircleBorder(),
      child: SizedBox(
        width: 60,
        height: 60,
        child: Center(child: content),
      ),
    );
  }
}
