import 'package:dartz/dartz.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

abstract class MovieRepo {
  Future<Either<Failure, List<MovieEntity>>> fetchMovies();
}

class Failure {}
