import 'package:equatable/equatable.dart';

class MovieRecommend extends Equatable{
  final int id;
  final String? backDropPath;

  const MovieRecommend({
  required this.id,
     this.backDropPath});

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
backDropPath
  ];
}