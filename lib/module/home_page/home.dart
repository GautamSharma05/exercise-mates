import 'package:auto_route/auto_route.dart';
import 'package:exercisemates/common/app_router.dart';
import 'package:exercisemates/constant/colors.dart';
import 'package:exercisemates/constant/text.dart';
import 'package:exercisemates/module/home_page/repo/home_repo.dart';
import 'package:exercisemates/riverpod/riverpod.dart';
import 'package:exercisemates/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:async_loader/async_loader.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          AppText.appName,
          style: TextStyle(color: AppColors.whiteColor),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: SafeArea(
        child: Consumer(builder: (context, ref, child) {
          final homeRepo = ref.watch(homeProvider);
          return AsyncLoader(
            initState: () => homeRepo.getAllExercises(context),
            renderLoad: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            renderError: ([error]) => const Center(child: Text(AppText.somethingWentWrongText)),
            renderSuccess: ({data}) {
              return getListOfAllExercises(context, data, homeRepo);
            },
          );
        }),
      ),
    );
  }

  Widget getListOfAllExercises(BuildContext context, data, HomeRepo homeRepo) {
    return ListView.builder(
        itemCount: homeRepo.exercises.length,
        itemBuilder: (context, index) {
          var info = homeRepo.exercises[index];
          return ListTile(
            leading: Image.network(info.gifUrl),
            title: Text(
              info.name,
              style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.blackColor),
            ),
            subtitle: Text(
              info.equipment,
              style: const TextStyle(color: AppColors.blackColor),
            ),
            trailing: IconButton(
              onPressed: () {
                AppNavigator.pushByClassName(context, ExerciseDetailRoute(id: info.id, name: info.name));
              },
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          );
        });
  }
}
