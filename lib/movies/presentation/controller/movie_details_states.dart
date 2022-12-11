import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enum.dart';
import 'package:movie_app/movies/domain/entities/movie_Details.dart';
import 'package:movie_app/movies/domain/entities/movie_recommend.dart';

class MovieDetailsState extends Equatable{
  final MoviesDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;
  final List<MovieRecommend> movieRecommend;
  final RequestState recommendState;
  final String recommendMessage;

  const MovieDetailsState({
      this.movieDetails,
      this.movieDetailsState = RequestState.loading,
      this.movieDetailsMessage = '',
      this.movieRecommend = const [],
      this.recommendState = RequestState.loading,
      this.recommendMessage = ''
  });

  MovieDetailsState copyWith({
     MoviesDetails? movieDetails,
     RequestState? movieDetailsState,
     String? movieDetailsMessage,
     List<MovieRecommend>? movieRecommend,
     RequestState? recommendState,
     String? recommendMessage,
}){
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieRecommend: movieRecommend ?? this.movieRecommend,
      recommendState: recommendState ?? this.recommendState,
      recommendMessage: recommendMessage ?? this.recommendMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    movieDetails,
    movieDetailsState,
    movieDetailsMessage,
    movieRecommend,
    recommendState,
    recommendMessage
  ];
}