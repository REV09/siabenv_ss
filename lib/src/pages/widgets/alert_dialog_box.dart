import 'package:flutter/material.dart';

abstract class AlertDialogBox {
  static showAlertDialog(
    BuildContext context,
    String messageTitle,
    String messageInfo,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(messageTitle),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(messageInfo),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Aceptar"),
            )
          ],
        );
      },
    );
  }
}
