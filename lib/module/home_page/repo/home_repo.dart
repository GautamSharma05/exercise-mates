import 'package:exercisemates/Util/Util.dart';
import 'package:exercisemates/constant/text.dart';
import 'package:exercisemates/module/home_page/model/exercises.dart';
import 'package:exercisemates/network/api_network.dart';
import 'package:exercisemates/network/dio_client.dart';
import 'package:flutter/material.dart';

class HomeRepo extends ChangeNotifier {
  List<Exercises> exercises = [];
  List<Exercises> dummyExercises = [];
  int selectedFilterID = -1;

  setFilterId(value) {
    selectedFilterID = value;
    notifyListeners();
  }

  void updateFilter() {
    switch (selectedFilterID) {
      case 1:
        exercises = exercises.where((exercise) => exercise.bodyPart == 'waist').toList();
        notifyListeners();
        break;
      case 2:
        exercises = exercises.where((exercise) => exercise.bodyPart == 'upper legs').toList();
        notifyListeners();
        break;
      case 3:
        exercises = exercises.where((exercise) => exercise.bodyPart == 'back').toList();
        notifyListeners();
        break;
      case 4:
        exercises = exercises.where((exercise) => exercise.bodyPart == 'lower legs').toList();
        notifyListeners();
        break;
      case 5:
        exercises = exercises.where((exercise) => exercise.bodyPart == 'chest').toList();
        notifyListeners();
        break;
      case 6:
        exercises = exercises.where((exercise) => exercise.bodyPart == 'neck').toList();
        notifyListeners();
        break;
      case 0:
        exercises = dummyExercises;
        notifyListeners();
        break;
      default:
        exercises = dummyExercises;
        notifyListeners();
        break;
    }
  }

  Future<Object> getAllExercises(context) async {
    final apiCall = RestClient(DioClient.getDio());
    await apiCall.getAllExercises().then((value) {
      exercises.addAll(value);
      dummyExercises.addAll(value);
      return exercises;
    }).catchError((onError) {
      Util.showSnackBar(context, AppText.somethingWentWrongText);
      return onError;
    });
    return {};
  }

  List<Exercises> searchExercisesByName(String query) {
    final lowercaseQuery = query.toLowerCase();
    dummyExercises = exercises.where((exercise) => exercise.name.toLowerCase().contains(lowercaseQuery)).toList();
    return dummyExercises;
  }

  //Pagination is not done because there is no skip limit parameter available in api.
}
