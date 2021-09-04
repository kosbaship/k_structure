import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'app_colors.dart';
import 'app_enum.dart';

/// =========== Show Interactions ===========
showSnackBar({@required BuildContext context, @required String massage}) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(massage),
      duration: Duration(seconds: 3),
    ));

showToast({
  @required BuildContext context,
  @required String massage,
  @required ToastColors color,
  ToastGravity position = ToastGravity.BOTTOM,
  Toast toastLength = Toast.LENGTH_SHORT,
}) =>
    Fluttertoast.showToast(
        msg: '  $massage  ',
        toastLength: toastLength,
        gravity: position,
        backgroundColor: setToastColor(color),
        textColor: Colors.white,
        fontSize: MediaQuery.of(context).size.width * 0.05);

/// =========== Navigation ===========
navTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

navAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false,
    );

navToAndReplaceMe(context, widget) => Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

/// =========== Simple Functions ===========
setToastColor(ToastColors toastColor) {
  Color color;

  switch (toastColor) {
    case ToastColors.ERROR:
      color = kToastError;
      break;
    case ToastColors.SUCCESS:
      color = kToastSuccess;
      break;
    case ToastColors.WARNING:
      color = kToastWarning;
      break;
  }
  return color;
}
