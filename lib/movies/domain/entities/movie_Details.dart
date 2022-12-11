import 'package:equatable/equatable.dart';
import 'package:movie_app/movies/domain/entities/genres.dart';

 class MoviesDetails extends Equatable{
  final String backDropPath;
  final String releaseDate;
  final String overView;
  final String title;
  final double voteAverage;
  final int id;
  final int runTime;
  final List<Genres> genres;

  const MoviesDetails({
    required this.backDropPath,
    required this.releaseDate,
    required this.overView,
    required this.title,
    required this.voteAverage,
    required this.id,
    required this.runTime,
    required this.genres});

  @override
  // TODO: implement props
  List<Object?> get props => [
    backDropPath,
    releaseDate,
    overView,
    title,
    voteAverage,
    id,
    runTime,
    genres
  ];


}