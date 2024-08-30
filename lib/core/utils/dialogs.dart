import 'package:flutter/material.dart';

class Dialogs {
  static final Dialogs _instance = Dialogs.internal();

  Dialogs.internal();

  factory Dialogs() => _instance;

  static void show(BuildContext context,
      {required String title,
      String okText = "",
      String cancelText = "Cancel",
      required Widget widget,
      required VoidCallback okBtnFunction}) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(title),
          content: SizedBox(
            width: MediaQuery.of(context).size.width - 10,
            height: 100,
            child: widget,
          ),
          actions: <Widget>[
            if (okText.isNotEmpty) ...[
              TextButton(
                onPressed: okBtnFunction,
                child: Text(okText),
              ),
            ],
            TextButton(child: Text(cancelText), onPressed: () => Navigator.pop(context))
          ],
        );
      },
    );
  }

  static showCustomDialog(BuildContext context,
      {required String title,
      String okText = "",
      String cancelText = "Cancel",
      required Widget widget,
      required VoidCallback onOkClicked}) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 10,
              height: MediaQuery.of(context).size.height / 2,
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                children: [
                  Text(title),
                  const SizedBox(height: 20),
                  widget,
                  const Spacer(),
                  Row(
                    children: [
                      if (okText.isNotEmpty) ...[
                        ElevatedButton(
                          onPressed: onOkClicked,
                          child: const Text(
                            "OK",
                            style: TextStyle(color: Colors.white),
                          ),
                          //color: const Color(0xFF1BC0C5),
                        ),
                      ],
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Colors.white),
                        ),
                        //color: const Color(0xFF1BC0C5),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
