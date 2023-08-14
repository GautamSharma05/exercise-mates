import 'dart:developer';
import 'package:exercisemates/constant/text.dart';
import 'package:exercisemates/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  } catch (e) {
    log('Error in main.dart: $e');
  }
  runApp(const ProviderScope(child: MyApp()));
}

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) {
        return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1), child: child!);
      },
      debugShowCheckedModeBanner: false,
      title: AppText.appName,
      routerConfig: _appRouter.config(),
    );
  }
}
