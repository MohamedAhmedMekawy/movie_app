import 'package:movie_app/movies/data/models/genres_model.dart';
import 'package:movie_app/movies/domain/entities/movie_Details.dart';

class MovieDetailsModel extends MoviesDetails {
  const MovieDetailsModel({
    required super.backDropPath,
    required super.releaseDate,
    required super.overView,
    required super.title,
    required super.voteAverage,
    required super.id,
    required super.runTime,
    required super.genres});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json){
    return MovieDetailsModel(
        backDropPath: json['backdrop_path'],
        releaseDate: json['release_date'],
        overView: json['overview'],
        title: json['title'],
        voteAverage: json['vote_average'].toDouble(),
        id: json['id'],
        runTime: json['runtime'],
        genres: List<GenresModel>.from((json['genres']).map((x) => GenresModel.fromJson(x)))
    );
  }
}
