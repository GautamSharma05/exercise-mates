import 'package:exercisemates/constant/colors.dart';
import 'package:flutter/material.dart';

class Util{
  static void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        style: const TextStyle(
          fontSize: 12,
          overflow: TextOverflow.ellipsis,
          color: AppColors.whiteColor,
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}