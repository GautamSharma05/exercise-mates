import 'package:auto_route/auto_route.dart';
import 'package:exercisemates/module/exercise_detail/exercise_detail.dart';
import 'package:exercisemates/module/home_page/home.dart';
import 'package:flutter/material.dart';

part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page,initial: true, path: '/'),
    AutoRoute(page: ExerciseDetailRoute.page,path: '/exerciseDetail')
  ];
}