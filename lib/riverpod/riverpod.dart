import 'package:exercisemates/module/exercise_detail/repo/exercise_detail_repo.dart';
import 'package:exercisemates/module/home_page/repo/home_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = ChangeNotifierProvider<HomeRepo>((ref) => HomeRepo());
final exerciseDetailProvider = ChangeNotifierProvider<ExerciseDetailRepo>((ref) => ExerciseDetailRepo());