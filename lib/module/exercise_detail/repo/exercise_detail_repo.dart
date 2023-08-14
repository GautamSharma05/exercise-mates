import 'package:exercisemates/Util/Util.dart';
import 'package:exercisemates/constant/text.dart';
import 'package:exercisemates/module/home_page/model/exercises.dart';
import 'package:exercisemates/network/api_network.dart';
import 'package:exercisemates/network/dio_client.dart';
import 'package:flutter/material.dart';

class ExerciseDetailRepo extends ChangeNotifier {

  Future<Exercises> getDetailOfExercise(BuildContext context, String id) async {
    final apiCall = RestClient(DioClient.getDio());
    try {
      final value = await apiCall.getExerciseById(id);
      return value;
    } catch (error) {
      Util.showSnackBar(context, AppText.somethingWentWrongText);
      rethrow; // Rethrow the error to propagate it
    }
  }
}
