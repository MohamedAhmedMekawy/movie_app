import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enum.dart';
import 'package:movie_app/movies/domain/use_cases/get_Movie_details.dart';
import 'package:movie_app/movies/domain/use_cases/get_movie_recommend.dart';
import 'package:movie_app/movies/presentation/controller/movie_details_events.dart';
import 'package:movie_app/movies/presentation/controller/movie_details_states.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState>{
  final GetMovieDetailsUseCase getMovieDetails;
  final GetMovieRecommendUseCase getMovieRecommend;
  MovieDetailsBloc(this.getMovieDetails, this.getMovieRecommend) : super(const MovieDetailsState()){
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendEvent>(_getMovieRecommend);
  }

  FutureOr<void> _getMovieDetails(GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit)async {
    final result = await getMovieDetails(MovieDetailsParameters(movieId: event.id));
    result.fold((l) => emit(state.copyWith(
        movieDetailsState: RequestState.error,
        movieDetailsMessage: l.message
    )), (r) => emit(
        state.copyWith(
            movieDetails: r,
            movieDetailsState: RequestState.loaded
        )
    ));
  }

  FutureOr<void> _getMovieRecommend(GetMovieRecommendEvent event, Emitter<MovieDetailsState> emit) async{
    final result = await getMovieRecommend(ParameterRecommend(event.id));
    result.fold((l) => emit(
      state.copyWith(
        recommendState: RequestState.loading,
        recommendMessage: l.message
      )
    ), (r) => emit(
      state.copyWith(
        movieRecommend: r,
        recommendState: RequestState.loaded
      )
    ));

  }
}