import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enum.dart';
import 'package:movie_app/movies/domain/entities/movie_entity.dart';

class MoviesStates extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingStates;
  final String nowPlayingMessage;
  final List<Movie> popularMovies;
  final RequestState popularStates;
  final String popularMessage;
  final List<Movie> topRatedMovies;
  final RequestState topRatedStates;
  final String topRatedMessage;

  const MoviesStates({
    this.nowPlayingMovies = const [],
    this.nowPlayingStates = RequestState.loading,
    this.nowPlayingMessage = '',
    this.popularMovies = const [],
    this.popularStates = RequestState.loading,
    this.popularMessage = '',
    this.topRatedMovies = const [],
    this.topRatedStates = RequestState.loading,
    this.topRatedMessage = ''
  });

  MoviesStates copyWith({
     List<Movie>? nowPlayingMovies,
     RequestState? nowPlayingStates,
     String? nowPlayingMessage,
     List<Movie>? popularMovies,
     RequestState? popularStates,
     String? popularMessage,
     List<Movie>? topRatedMovies,
     RequestState? topRatedStates,
     String? topRatedMessage,
}){
    return MoviesStates(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      nowPlayingStates: nowPlayingStates ?? this.nowPlayingStates,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMessage: popularMessage ?? this.popularMessage,
      popularStates: popularStates ?? this.popularStates,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      topRatedStates: topRatedStates ?? this.topRatedStates,

    );
  }
  @override
  List<Object> get props =>[
    nowPlayingMovies,
    nowPlayingStates,
    nowPlayingMessage,
    popularMovies,
    popularMessage,
    popularStates,
    topRatedMovies,
    topRatedMessage,
    topRatedStates
  ];
}
