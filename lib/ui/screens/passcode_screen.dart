import 'package:bdo_online_clone/core/utils/navigator_context.dart';
import 'package:bdo_online_clone/ui/screens/home_screen.dart';
import 'package:bdo_online_clone/ui/widgets/circular_progress.dart';
import 'package:bdo_online_clone/ui/widgets/logo_widget.dart';
import 'package:flutter/material.dart';

class PasscodeScreen extends StatefulWidget {
  static const String routeName = 'PasscodeScreen';
  const PasscodeScreen({super.key});

  @override
  _PasscodeScreenState createState() => _PasscodeScreenState();
}

class _PasscodeScreenState extends State<PasscodeScreen> {
  final int pinLength = 6;
  String pin = "";
  bool isLoading = false;

  @override
  void initState() {
    initLoading();
    super.initState();
  }

  void addPinDigit(String digit) {
    if (pin.length < pinLength) {
      setState(() {
        pin += digit;
      });
    } else {
      //NavigatorContext.go(HomeScreen.routeName);
      goNext();
    }
  }

  void deletePinDigit() {
    if (pin.isNotEmpty) {
      setState(() {
        pin = pin.substring(0, pin.length - 1);
      });
    }
  }

  void goNext() {
    setLoading(true);
    Future.delayed(const Duration(milliseconds: 500), () {
      NavigatorContext.go(HomeScreen.routeName);
      setLoading(false);
    });
  }

  void initLoading() {
    setLoading(true);
    Future.delayed(const Duration(milliseconds: 3000), () {
      setLoading(false);
    });
  }

  void setLoading(value) {
    setState(() {
      isLoading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {
            // Handle back action
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const LogoWidget(),
          const SizedBox(height: 200),
          buildPinInputFields(),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              // Handle forgot PIN action
            },
            child: const Text(
              'Forgot PIN?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            flex: 2,
            child: isLoading
                ? const CircularProgress()
                : buildNumberPad(),
          ),
        ],
      ),
    );
  }

  Widget buildPinInputFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pinLength, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: 46,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              index < pin.length ? '*' : '',
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget buildNumberPad() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildNumberRow(['1', '2', '3']),
          buildNumberRow(['4', '5', '6']),
          buildNumberRow(['7', '8', '9']),
          buildNumberRow(['fingerprint', '0', 'delete']),
        ],
      ),
    );
  }

  Widget buildNumberRow(List<String> symbols) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: symbols.map((symbol) {
        return buildNumberButton(symbol);
      }).toList(),
    );
  }

  Widget buildNumberButton(String symbol) {
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

    return GestureDetector(
      onTap: () {
        if (symbol == 'delete') {
          deletePinDigit();
        } else if (symbol != 'fingerprint') {
          addPinDigit(symbol);
        } else {
          // Handle fingerprint action
        }
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[200],
        ),
        child: Center(child: content),
      ),
    );
  }
}
