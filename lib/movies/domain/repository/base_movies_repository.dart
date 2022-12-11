import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movies/domain/entities/movie_Details.dart';
import 'package:movie_app/movies/domain/entities/movie_entity.dart';
import 'package:movie_app/movies/domain/entities/movie_recommend.dart';
import 'package:movie_app/movies/domain/use_cases/get_Movie_details.dart';
import 'package:movie_app/movies/domain/use_cases/get_movie_recommend.dart';

abstract class BaseRepositoryMovies {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MoviesDetails>> getMovieDetails(
      MovieDetailsParameters parameters);

  Future<Either<Failure, List<MovieRecommend>>> getMovieRecommend(
  ParameterRecommend parameters);
}
