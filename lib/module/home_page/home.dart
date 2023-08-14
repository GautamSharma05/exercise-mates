import 'package:auto_route/auto_route.dart';
import 'package:exercisemates/common/app_router.dart';
import 'package:exercisemates/constant/colors.dart';
import 'package:exercisemates/constant/text.dart';
import 'package:exercisemates/module/home_page/repo/home_repo.dart';
import 'package:exercisemates/module/home_page/widget/search_exercise.dart';
import 'package:exercisemates/riverpod/riverpod.dart';
import 'package:exercisemates/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:async_loader/async_loader.dart';

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final homeRepo = ref.watch(homeProvider);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          AppText.appName,
          style: TextStyle(color: AppColors.whiteColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
                onTap: () {
                  showSearch(context: context, delegate: SearchExercise());
                },
                child: const Icon(Icons.search)),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (modalContext) {
                        return SizedBox(
                          height: MediaQuery.of(modalContext).size.height * 1,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'FILTER BY',
                                  style: TextStyle(fontSize: 14, color: AppColors.blackColor),
                                ),
                                const Divider(
                                  thickness: 1,
                                ),
                                ListTile(
                                  title: const Text('Reset Filter'),
                                  trailing: Radio(
                                      value: 0,
                                      groupValue: homeRepo.selectedFilterID,
                                      onChanged: (value) {
                                        homeRepo.setFilterId(value);
                                        homeRepo.updateFilter();
                                        Navigator.pop(modalContext);
                                      }),
                                ),
                                ListTile(
                                  title: const Text('waist'),
                                  trailing: Radio(
                                      value: 1,
                                      groupValue: homeRepo.selectedFilterID,
                                      onChanged: (value) {
                                        homeRepo.setFilterId(value);
                                        homeRepo.updateFilter();
                                        Navigator.pop(modalContext);
                                      }),
                                ),
                                ListTile(
                                  title: const Text('upper legs'),
                                  trailing: Radio(
                                      value: 2,
                                      groupValue: homeRepo.selectedFilterID,
                                      onChanged: (value) {
                                        homeRepo.setFilterId(value);
                                        homeRepo.updateFilter();
                                        Navigator.pop(modalContext);
                                      }),
                                ),
                                ListTile(
                                  title: const Text('back'),
                                  trailing: Radio(
                                      value: 3,
                                      groupValue: homeRepo.selectedFilterID,
                                      onChanged: (value) {
                                        homeRepo.setFilterId(value);
                                        homeRepo.updateFilter();
                                        Navigator.pop(modalContext);
                                      }),
                                ),
                                ListTile(
                                  title: const Text('lower legs'),
                                  trailing: Radio(
                                      value: 4,
                                      groupValue: homeRepo.selectedFilterID,
                                      onChanged: (value) {
                                        homeRepo.setFilterId(value);
                                        homeRepo.updateFilter();
                                        Navigator.pop(modalContext);
                                      }),
                                ),
                                ListTile(
                                  title: const Text('chest'),
                                  trailing: Radio(
                                      value: 5,
                                      groupValue: homeRepo.selectedFilterID,
                                      onChanged: (value) {
                                        homeRepo.setFilterId(value);
                                        homeRepo.updateFilter();
                                        Navigator.pop(modalContext);
                                      }),
                                ),
                                ListTile(
                                  title: const Text('neck'),
                                  trailing: Radio(
                                      value: 6,
                                      groupValue: homeRepo.selectedFilterID,
                                      onChanged: (value) {
                                        homeRepo.setFilterId(value);
                                        homeRepo.updateFilter();
                                        Navigator.pop(modalContext);
                                      }),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: const Icon(Icons.filter_list)),
          )
        ],
      ),
      body: SafeArea(
        child: AsyncLoader(
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
        ),
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
              info.bodyPart,
              style: const TextStyle(color: AppColors.blackColor),
            ),
            trailing: IconButton(
              onPressed: () {
                AppNavigator.pushByClassName(context, ExerciseDetailRoute(id: info.id, name: info.name));
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
          );
        });
  }
}
