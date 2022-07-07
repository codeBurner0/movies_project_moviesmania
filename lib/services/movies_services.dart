//@dart=2.9
//Packages


import 'dart:collection';
import 'dart:html';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_project_moviesmania/model/movie.dart';
import 'package:movies_project_moviesmania/model/search_category.dart';
//Services
import 'http_services.dart';

//Models
import '../model/movie.dart';

class MovieService {
  final GetIt getIt = GetIt.instance;
  HTTPService _http;
  MovieService() {
    _http = getIt.get<HTTPService>();
  }


  Future<List<Movie>> getPopularMovies({int page}) async{
    Response _response = await _http.get('/movie/popular',query: {
      'page':page
    }
    );
    
    if(_response.statusCode == 200){
      Map _data =_response.data;
      List<Movie> _movies = _data['results'].map<Movie>((_movieData)  {
        return Movie.fromJson(_movieData);
      }).toList();
      return _movies;
    }else{
      throw Exception('Couldnot load');
    }
  }




}