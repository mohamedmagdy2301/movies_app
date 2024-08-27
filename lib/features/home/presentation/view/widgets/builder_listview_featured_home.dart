import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/widgets/custom_circular_progress_loading.dart';
import 'package:movies_app/core/widgets/custom_failure_message.dart';
import 'package:movies_app/features/home/presentation/manage/movies_cubit/movies_cubit.dart';
import 'package:movies_app/features/home/presentation/view/widgets/custom_listview_featured_home.dart';

class BuilderListviewFeaturedHome extends StatelessWidget {
  const BuilderListviewFeaturedHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          if (state is MoviesSuccess) {
            return CustomListViewFeaturedHome(movieList: state.moviesList);
          } else if (state is MoviesFailure) {
            return CustomFailureMessage(state.errMessage);
          } else {
            return const CustomCircularProgressLoading();
          }
        },
      ),
    );
  }
}
