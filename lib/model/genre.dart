//@dart=2.9
//packags.
//import 'dart:ffi';

import 'package:get_it/get_it.dart';


//Models
import '../model/app_config.dart';

class Genre{
   // final Array genre;
    final int genre_id;
    final String genre_name;
   //Genre obj=new Genre();

  Genre({this.genre_id, this.genre_name,});

  factory Genre.fromJson(Map<String,dynamic>_json)
  {
    return Genre(
      genre_name: _json['name'],
     genre_id: _json['id']
      );
  }
}