import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/use_case/base_use_case.dart';
import 'package:movie_app/movies/domain/entities/movie_recommend.dart';
import 'package:movie_app/movies/domain/repository/base_movies_repository.dart';

class GetMovieRecommendUseCase
    extends BaseUseCase<List<MovieRecommend>, ParameterRecommend> {
  final BaseRepositoryMovies baseRepositoryMovies;

  GetMovieRecommendUseCase(this.baseRepositoryMovies);

  @override
  Future<Either<Failure, List<MovieRecommend>>> call(
      ParameterRecommend parameters) async {
    return await baseRepositoryMovies.getMovieRecommend(parameters);
  }
}

class ParameterRecommend extends Equatable {
  final int id;

  const ParameterRecommend(this.id);

  @override
  List<Object?> get props => [id];
}
