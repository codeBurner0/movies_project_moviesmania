//@dart=2.9
//packages
import 'package:get_it/get_it.dart';


//Models
import '../model/app_config.dart';
class Movie{
  final String name;
  final String language;
  final bool isAdult;
  final String description;
  final String posterPath;
  final String backdropPath;
  final num rating;
  final String releaseDate;
  //final int movie_id;
  
 Movie(
      {this.name, this.language, this.isAdult,
      this.description,this.posterPath,this.backdropPath,
      this.rating,this.releaseDate}
      );
  factory Movie.fromJson(Map<String,dynamic>_json)
  {
    return Movie(
       name:_json['title'],
       language:_json['original_language'],
       isAdult:_json['adult'],
       description:_json['overview'],
       posterPath:_json['poster_path'],
       backdropPath:_json['backdrop_path'],
       rating:_json['vote_average'],
      releaseDate:_json["release_date"],
     // movie_id: _json['id'],
    );
  }
  String posterURL(){
    final AppConfig _appConfig = GetIt.instance.get<AppConfig>();
    return '${_appConfig.BASE_IMAGE_API_URL}${this.posterPath}';
  }
}