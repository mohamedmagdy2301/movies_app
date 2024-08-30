import 'package:go_router/go_router.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/home/presentation/view/screens/details_screen.dart';
import 'package:movies_app/features/home/presentation/view/screens/home_screen.dart';

class GoRouterManager {
  static const String kSplashScreen = '/';
  static const String kHomeScreen = "/homeView";
  static const String kDetailsScreen = "/detailsView";
  // static const String kSearchScreen = "/searchView";

  static final router = GoRouter(
    routes: [
      // GoRoute(
      //   path: kSplashScreen,
      //   builder: (context, state) => const SplashScreen(),
      // ),
      GoRoute(
        path: kSplashScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: kDetailsScreen,
        builder: (context, state) =>
            DetailsMovieScreen(movieEntity: state.extra as MovieEntity),
      ),
    ],
  );
}
