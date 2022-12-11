import 'package:movie_app/movies/domain/entities/movie_recommend.dart';

class MovieRecommendModel extends MovieRecommend {
  const MovieRecommendModel({required super.id,  super.backDropPath});

  factory MovieRecommendModel.fromJson(Map<String, dynamic> json) {
    return MovieRecommendModel(
        id: json['id'],
        backDropPath: json['poster_path'] ?? '/rFljUdOozFEv6HDHIFpFvcYW0ec.jpg');
  }
}
