// ignore_for_file: empty_constructor_bodies
import 'dart:ui';
import 'package:flutter/widgets.dart';

//packages
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

//Models
import '../model/movie.dart';
import '../model/search_category.dart';

class MovieTile extends StatelessWidget {
  final GetIt _getIt = GetIt.instance;

  final double height;
  final double width;
  final Movie movie;

  MovieTile(
      {Key? key,
      required this.movie,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _moviPosterWidget(movie.posterURL()),
          _movieInfoWidget(),
        ],
      ),
    );
  }

  Widget _movieInfoWidget() {
    return Container(
      height: height,
      width: width * 0.66,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width * 0.56,
                child: Text(
                  movie.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Text(
                movie.rating.toString(),
                style: TextStyle(color: Colors.white, fontSize: 22),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, height * 0.02, 0, 0),
            child: Text(
              '${movie.language.toUpperCase()} | R: ${movie.isAdult} | ${movie.releaseDate}',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, height * 0.07, 0, 0),
            child: Text(
              movie.description,
              maxLines: 9,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _moviPosterWidget(String _imageURL) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(_imageURL),
        ),
      ),
    );
  }
}
