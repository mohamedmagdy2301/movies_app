import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/home/domain/use%20case/fetch_movies_use_case.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit({required this.fetchMoviesUseCase}) : super(MoviesInitial());
  final FetchMoviesUseCase fetchMoviesUseCase;

  Future<void> fetchMoviesInCubit() async {
    emit(MoviesLoading());
    Either<Failure, List<MovieEntity>> result = await fetchMoviesUseCase.call();
    result.fold((Failure failure) {
      return emit(MoviesFailure(errMessage: failure.message));
    }, (List<MovieEntity> moviesList) {
      return emit(MoviesSuccess(moviesList: moviesList));
    });
  }
}
