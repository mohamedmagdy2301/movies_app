import 'package:dartz/dartz.dart';
import 'package:movies_app/core/utils/use_case.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/home/domain/repo/home_repo.dart';

class FetchMoviesUseCase implements UseCase<List<MovieEntity>, NoParams> {
  final HomeRepo homeRepo;
  FetchMoviesUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<MovieEntity>>> call([void params]) async {
    return await homeRepo.fetchMovies();
  }
}
