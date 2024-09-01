import 'dart:developer';

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

  Future<void> fetchMoviesInCubit(String category, [int? pageNumber]) async {
    if (pageNumber == 1) {
      emit(MoviesLoading());
    } else {
      emit(MoviesPagenationLoading());
    }
    Either<Failure, List<MovieEntity>> result =
        await fetchMoviesUseCase.call(category, pageNumber);
    result.fold((Failure failure) {
      if (pageNumber == 1) {
        return emit(MoviesFailure(errMessage: failure.message));
      } else {
        log("Movies Pagenation Failure: ${failure.message}");
        return emit(MoviesPagenationFailure(errMessage: failure.message));
      }
    }, (List<MovieEntity> moviesList) {
      return emit(MoviesSuccess(moviesList: moviesList));
    });
  }
}
