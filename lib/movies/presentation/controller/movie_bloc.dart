import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/use_case/base_use_case.dart';
import 'package:movie_app/core/utils/enum.dart';
import 'package:movie_app/movies/domain/use_cases/get_now_playing_movie_use_case.dart';
import 'package:movie_app/movies/domain/use_cases/get_popular_movie_use_case.dart';
import 'package:movie_app/movies/domain/use_cases/get_top_rated_movie_use_case.dart';
import 'package:movie_app/movies/presentation/controller/movie_events.dart';
import 'package:movie_app/movies/presentation/controller/movie_states.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesStates> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesStates()) {
    on<GetNowPlayingMoviesEvents>(_getNowPlayingMovies);
    on<GetPopularMoviesEvents>(_getPopularMovies);
    on<GetTopRatedMoviesEvents>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvents event, Emitter<MoviesStates> emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            nowPlayingStates: RequestState.error,
            nowPlayingMessage: l.message)),
        (r) => emit(state.copyWith(
            nowPlayingMovies: r, nowPlayingStates: RequestState.loaded)));
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvents event, Emitter<MoviesStates> emit) async {
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            popularStates: RequestState.error, popularMessage: l.message)),
        (r) => emit(state.copyWith(
            popularMovies: r, popularStates: RequestState.loaded)));
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvents event, Emitter<MoviesStates> emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            topRatedStates: RequestState.error, topRatedMessage: l.message)),
        (r) => emit(state.copyWith(
            topRatedMovies: r, topRatedStates: RequestState.loaded)));
  }
}
