import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/manage/movies_cubit/movies_cubit.dart';
import 'package:movies_app/features/home/presentation/view/widgets/custom_listview_featured_home.dart';

class BuilderListviewFeaturedHome extends StatelessWidget {
  const BuilderListviewFeaturedHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(builder: (context, state) {
      return const CustomListViewFeaturedHome();
    });
  }
}
