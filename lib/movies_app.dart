import 'package:flutter/material.dart';
import 'package:movies_app/core/routers/routers_manager.dart';
import 'package:movies_app/core/utils/colors_manager.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouterManager.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: ColorsManager.kPrimaryColorBlack,
      ),
    );
  }
}
