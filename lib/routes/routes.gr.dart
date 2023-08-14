// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ExerciseDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ExerciseDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ExerciseDetailPage(
          key: args.key,
          id: args.id,
          name: args.name,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
  };
}

/// generated route for
/// [ExerciseDetailPage]
class ExerciseDetailRoute extends PageRouteInfo<ExerciseDetailRouteArgs> {
  ExerciseDetailRoute({
    Key? key,
    required String id,
    required String name,
    List<PageRouteInfo>? children,
  }) : super(
          ExerciseDetailRoute.name,
          args: ExerciseDetailRouteArgs(
            key: key,
            id: id,
            name: name,
          ),
          initialChildren: children,
        );

  static const String name = 'ExerciseDetailRoute';

  static const PageInfo<ExerciseDetailRouteArgs> page =
      PageInfo<ExerciseDetailRouteArgs>(name);
}

class ExerciseDetailRouteArgs {
  const ExerciseDetailRouteArgs({
    this.key,
    required this.id,
    required this.name,
  });

  final Key? key;

  final String id;

  final String name;

  @override
  String toString() {
    return 'ExerciseDetailRouteArgs{key: $key, id: $id, name: $name}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
