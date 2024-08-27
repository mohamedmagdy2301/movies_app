import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/utils/use_case.dart';
import 'package:movies_app/features/home/data/repo/home_repo_impl.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/home/domain/repo/home_repo.dart';

class FetchMoviesUseCase implements UseCase<List<MovieEntity>, NoParams> {
  final HomeRepoImpl homeRepoImpl;
  FetchMoviesUseCase({required this.homeRepoImpl});

  @override
  Future<Either<Failure, List<MovieEntity>>> call([NoParams? params]) async {
    return await homeRepoImpl.fetchMovies();
  }
}
