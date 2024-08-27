import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/routers/routers_manager.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/core/utils/service_locator.dart';
import 'package:movies_app/features/home/domain/use%20case/fetch_movies_use_case.dart';
import 'package:movies_app/features/home/presentation/manage/movies_cubit/movies_cubit.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MoviesCubit>(
          create: (context) {
            return MoviesCubit(
              fetchMoviesUseCase: getIt.get<FetchMoviesUseCase>(),
            )..fetchMoviesInCubit();
          },
        ),
      ],
      child: MaterialApp.router(
        routerConfig: GoRouterManager.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: ColorsManager.kPrimaryColorBlack,
        ),
      ),
    );
  }
}
