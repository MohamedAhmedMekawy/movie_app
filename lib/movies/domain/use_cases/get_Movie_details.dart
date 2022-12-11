import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/use_case/base_use_case.dart';
import 'package:movie_app/movies/domain/entities/movie_Details.dart';
import 'package:movie_app/movies/domain/repository/base_movies_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MoviesDetails, MovieDetailsParameters> {
  final BaseRepositoryMovies baseRepositoryMovies;

  GetMovieDetailsUseCase(this.baseRepositoryMovies);
  @override
  Future<Either<Failure, MoviesDetails>> call(MovieDetailsParameters parameters) async {
   return await baseRepositoryMovies.getMovieDetails( parameters);
  }
}




class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
