import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';

void showSuccessToast(String message, BuildContext context) {
  CherryToast.success(
    title: Text(message),
  ).show(context);
}

void showErrorToast(String message, BuildContext context) {
  CherryToast.error(
    title: Text(message),
  ).show(context);
}

void showInfoToast(String message, BuildContext context) {
  CherryToast.info(
    title: Text(message),
  ).show(context);
}

void showWarningToast(String message, BuildContext context) {
  CherryToast.warning(
    title: Text(message),
  ).show(context);
}
