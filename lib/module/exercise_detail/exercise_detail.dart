import 'package:async_loader/async_loader.dart';
import 'package:auto_route/auto_route.dart';
import 'package:exercisemates/constant/colors.dart';
import 'package:exercisemates/constant/text.dart';
import 'package:exercisemates/module/exercise_detail/widget/row_description_widget.dart';
import 'package:exercisemates/module/home_page/model/exercises.dart';
import 'package:exercisemates/riverpod/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ExerciseDetailPage extends StatelessWidget {
  final String id;
  final String name;
  const ExerciseDetailPage({super.key, required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: AppColors.primaryColor,
          title: Text(
            name,
            style: const TextStyle(color: AppColors.whiteColor),
          ),
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final exerciseRepo = ref.watch(exerciseDetailProvider);
            return AsyncLoader(
                initState: () => exerciseRepo.getDetailOfExercise(context, id),
                renderLoad: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                renderError: ([error]) => const Center(child: Text(AppText.somethingWentWrongText)),
                renderSuccess: ({data}) {
                  return getUiForDisplayExerciseData(context, data);
                });
          },
        ));
  }

  Widget getUiForDisplayExerciseData(BuildContext context, Exercises data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(data.gifUrl),
          const SizedBox(
            height: 20,
          ),
          const Text(
            AppText.exerciseDetail,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          RowDescriptionWidget(heading: AppText.equipmentName, data: data.equipment),
          const SizedBox(
            height: 10,
          ),
          RowDescriptionWidget(heading: AppText.exerciseName, data: data.name),
          const SizedBox(
            height: 10,
          ),
          RowDescriptionWidget(heading: AppText.bodyPart, data: data.bodyPart),
          const SizedBox(
            height: 10,
          ),
          RowDescriptionWidget(heading: AppText.target, data: data.target),
        ],
      ),
    );
  }
}
