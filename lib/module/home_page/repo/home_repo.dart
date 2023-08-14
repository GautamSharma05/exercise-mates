import 'package:exercisemates/Util/Util.dart';
import 'package:exercisemates/constant/text.dart';
import 'package:exercisemates/module/home_page/model/exercises.dart';
import 'package:exercisemates/network/api_network.dart';
import 'package:exercisemates/network/dio_client.dart';
import 'package:flutter/material.dart';

class HomeRepo extends ChangeNotifier {
  List<Exercises> exercises = [];

  Future<Object> getAllExercises(context) async {
    final apiCall = RestClient(DioClient.getDio());
    await apiCall.getAllExercises().then((value) {
      print(value);
    exercises.addAll(value);
      return exercises;
    }).catchError((onError) {
      Util.showSnackBar(context, AppText.somethingWentWrongText);
      return onError;
    });
    return {};
  }
}
