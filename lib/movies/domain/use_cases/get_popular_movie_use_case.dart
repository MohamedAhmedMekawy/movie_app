import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/use_case/base_use_case.dart';
import 'package:movie_app/movies/domain/entities/movie_entity.dart';
import 'package:movie_app/movies/domain/repository/base_movies_repository.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseRepositoryMovies baseRepositoryMovies;

  GetPopularMoviesUseCase(this.baseRepositoryMovies);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseRepositoryMovies.getPopularMovies();
  }
}
