import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/movies/domain/entities/movie_Details.dart';
import 'package:movie_app/movies/domain/entities/movie_entity.dart';
import 'package:movie_app/movies/domain/entities/movie_recommend.dart';
import 'package:movie_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movie_app/movies/domain/use_cases/get_Movie_details.dart';
import 'package:movie_app/movies/domain/use_cases/get_movie_recommend.dart';

class MoviesRepository extends BaseRepositoryMovies{
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either< Failure, List<Movie>>> getNowPlayingMovies() async{
   final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
   try{
     return right(result);
   } on ServiceExceptions catch(failure){
     return left(ServiceFailure(failure.errorMessageModel.statusMessage));
   }
  }

  @override
  Future<Either< Failure, List<Movie>>> getPopularMovies() async{
   final result = await baseMovieRemoteDataSource.getPopularMovies();
   try{
     return right(result);
   } on ServiceExceptions catch(failure){
     return left(ServiceFailure(failure.errorMessageModel.statusMessage));
   }
  }

  @override
  Future<Either< Failure, List<Movie>>> getTopRatedMovies()async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try{
      return right(result);
    } on ServiceExceptions catch(failure){
      return left(ServiceFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MoviesDetails>> getMovieDetails(MovieDetailsParameters parameters) async{
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    print(result);
    try{
      return right(result);
    } on ServiceExceptions catch(failure){
      return left(ServiceFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieRecommend>>> getMovieRecommend(ParameterRecommend parameters)async {

    final result = await baseMovieRemoteDataSource.getMovieRecommend(parameters);
    print(result);
    try{
      return right(result);
    } on ServiceExceptions catch(failure){
      return left(ServiceFailure(failure.errorMessageModel.statusMessage));
    }
  }

}