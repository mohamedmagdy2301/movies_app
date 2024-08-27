import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies_app/core/constant.dart';
import 'package:movies_app/core/routers/routers_manager.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

void main() async {
  runApp(const MovieApp());

  await Hive.initFlutter();
  Hive.registerAdapter(MovieEntityAdapter());
  await Hive.openBox<MovieEntity>(kMoviesBox);
}

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
