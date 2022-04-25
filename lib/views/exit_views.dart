import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> exitView(BuildContext context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      title: const Text(
        'Do you want to Exit?',
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.blueGrey),
            )),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Successfully Exit'),
              ),
            );
          },
          child: const Text(
            'Exit',
            style: TextStyle(color: Colors.blueGrey),
          ),
        ),
      ],
    ),
  );
}

Future<bool> getExitNotification() async {
  DateTime _currentTime = DateTime.now();
  final differenceTime = DateTime.now().difference(_currentTime);
  final exitApp = differenceTime > const Duration(seconds: 2);
  if (exitApp) {
    Fluttertoast.showToast(msg: 'Press back again to exit', fontSize: 18.0);
    return false;
  } else {
    Fluttertoast.cancel();
    return true;
  }
}
