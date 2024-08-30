import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/service_locator.dart';
import 'package:movies_app/features/home/domain/use%20case/fetch_movies_use_case.dart';
import 'package:movies_app/features/home/presentation/manage/movies_cubit/movies_cubit.dart';
import 'package:movies_app/features/home/presentation/view/widgets/builder_gridview_home.dart';
import 'package:movies_app/features/home/presentation/view/widgets/builder_listview_featured_home.dart';
import 'package:movies_app/features/home/presentation/view/widgets/custom_appbar_home.dart';
import 'package:movies_app/features/home/presentation/view/widgets/custom_tapbar_home.dart';

class CustomBodyHome extends StatelessWidget {
  const CustomBodyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        const CustomAppBarHome(),
        const BuilderListviewFeaturedHome(),
        const CustomTapbarHome(),
      ],
      body: BlocProvider(
        create: (context) => MoviesCubit(
          fetchMoviesUseCase: getIt.get<FetchMoviesUseCase>(),
        ),
        child: const TabBarView(
          children: [
            BuilderGridviewHome(catagory: 'now_playing'),
            BuilderGridviewHome(catagory: 'upcoming'),
            BuilderGridviewHome(catagory: 'popular'),
          ],
        ),
      ),
    );
  }
}
