import 'package:flutter/material.dart';

class UiHelper {
  UiHelper._();

  static void requestFocusScope(BuildContext context, FocusNode node) {
    FocusScope.of(context).requestFocus(node);
  }

  static void unFocusScope(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<void> showMyDialog(
      {required BuildContext context,
      String title = "Alert",
      required String content,
      Function? onPress}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(content),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                onPress?.call();
              },
            ),
          ],
        );
      },
    );
  }
}
