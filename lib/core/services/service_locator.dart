import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/movies/data/repository/movie_repository.dart';
import 'package:movie_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movie_app/movies/domain/use_cases/get_Movie_details.dart';
import 'package:movie_app/movies/domain/use_cases/get_movie_recommend.dart';
import 'package:movie_app/movies/domain/use_cases/get_now_playing_movie_use_case.dart';
import 'package:movie_app/movies/domain/use_cases/get_popular_movie_use_case.dart';
import 'package:movie_app/movies/domain/use_cases/get_top_rated_movie_use_case.dart';
import 'package:movie_app/movies/presentation/controller/movie_bloc.dart';
import 'package:movie_app/movies/presentation/controller/movie_details-bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));

    /// USE CASE
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieRecommendUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));

    /// REPOSITORY
    sl.registerLazySingleton<BaseRepositoryMovies>(
        () => MoviesRepository(sl()));

    ///REMOTE DATASOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
