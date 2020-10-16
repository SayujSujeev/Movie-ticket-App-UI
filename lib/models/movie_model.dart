import 'package:flutter/material.dart';
import 'package:movie_ticket_app/models/cast_model.dart';

class MovieModel{
  int id;
  String name;
  List<String> genre;
  double rating;
  String director;
  String storyLine;
  Image image;
  Image imageLogo;
  List<MovieCastModel> castList = List();

  MovieModel ({
    this.id,
    this.genre,
    this.name,
    this.rating,
    this.director,
    this.storyLine,
    this.image,
    this.imageLogo,
    this.castList,
});
}