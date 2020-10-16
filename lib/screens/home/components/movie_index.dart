import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants/constants.dart';
import 'package:movie_ticket_app/data/data.dart';
import 'package:movie_ticket_app/screens/details/detail_screen.dart';
import 'package:movie_ticket_app/widget/genres_format.dart';
import 'package:movie_ticket_app/widget/star_rating.dart';


class MovieIndex extends StatefulWidget {
  final int index;
  final ScrollController movieScrollController;
  final double movieItemWidth;

  MovieIndex(this.index, this.movieScrollController, this.movieItemWidth);

  @override
  _MovieIndexState createState() => _MovieIndexState();
}

class _MovieIndexState extends State<MovieIndex> {
  var movieData = MovieData();
  double maxMovieTranslate = 65;

  double _movieTranslate(double offset, double activeOffset) {
    double translate;
    if (widget.movieScrollController.offset + widget.movieItemWidth <=
        activeOffset) {
      translate = maxMovieTranslate;
    } else if (widget.movieScrollController.offset <= activeOffset) {
      translate = maxMovieTranslate -
          ((widget.movieScrollController.offset -
              (activeOffset - widget.movieItemWidth)) /
              widget.movieItemWidth *
              maxMovieTranslate);
    } else if (widget.movieScrollController.offset <
        activeOffset + widget.movieItemWidth) {
      translate = ((widget.movieScrollController.offset -
          (activeOffset - widget.movieItemWidth)) /
          widget.movieItemWidth *
          maxMovieTranslate) -
          maxMovieTranslate;
    } else {
      translate = maxMovieTranslate;
    }
    return translate;
  }

  double _movieDescriptionOpacity(double offset, double activeOffset) {
    double opacity;
    if (widget.movieScrollController.offset + widget.movieItemWidth <=
        activeOffset) {
      opacity = 0;
    } else if (widget.movieScrollController.offset <= activeOffset) {
      opacity = ((widget.movieScrollController.offset -
          (activeOffset - widget.movieItemWidth)) /
          widget.movieItemWidth *
          100);
    } else if (widget.movieScrollController.offset <
        activeOffset + widget.movieItemWidth) {
      opacity = 100 -
          (((widget.movieScrollController.offset -
              (activeOffset - widget.movieItemWidth)) /
              widget.movieItemWidth *
              100) -
              100);
    } else {
      opacity = 0;
    }
    return opacity;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: appPadding + 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AnimatedBuilder(
            animation: widget.movieScrollController,
            builder: (ctx, child) {
              double activeOffset = widget.index * widget.movieItemWidth;

              double translate = _movieTranslate(
                  widget.movieScrollController.offset, activeOffset);

              return SizedBox(
                height: translate,
              );
            },
          ),
          SizedBox(
            height: size.height * .008,
          ),
          Container(
            height: size.height * .15,
            child: Align(
              alignment: Alignment.center,
              child: Image(
                width: size.width / 2.5,
                image: movieData.movieList[widget.index].imageLogo.image,
              ),
            ),
          ),
          GenresFormat(
              movieData.movieList[widget.index].genre,
              white
          ),
          SizedBox(
            height: size.height * .005,
          ),
          StarRating(movieData.movieList[widget.index].rating),
          SizedBox(
            height: size.height * .01,
          ),
          Container(
            width: size.width * .25,
            height: 1,
            color: secondary.withOpacity(0.5),
          ),
          SizedBox(
            height: size.height * .01,
          ),
          InkWell(
            onTap: () =>
                Navigator.push(context, PageRouteBuilder(
                  pageBuilder:(context, a1, a2) => DetailScreen(
                    movie: movieData.movieList[widget.index],
                    size: size,
                  )
                )),
            child: Container(
              width: size.width * .25,
              height: size.height * .05,
              decoration: BoxDecoration(
                  color: secondary,
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Center(child: Text('BUY TICKET', style: TextStyle(
                color: white,
                fontWeight: FontWeight.bold,
              ),)),
            ),
          ),
          SizedBox(
            height: size.height * .01,
          ),
          GestureDetector(
            onTap: () =>
                Navigator.push(context, PageRouteBuilder(
                    pageBuilder:(context, a1, a2) => DetailScreen(
                      movie: movieData.movieList[widget.index],
                      size: size,
                    )
                )),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40.0),
              child: Image(
                image: movieData.movieList[widget.index].image.image,
                width: size.width * 0.5,
                height: size.height * 0.35,
              ),
            ),
          ),
          SizedBox(
            height: size.height * .02,
          ),
          AnimatedBuilder(
            animation: widget.movieScrollController,
            builder: (context, child) {
              double activeOffset = widget.index * widget.movieItemWidth;
              double opacity = _movieDescriptionOpacity(
                  widget.movieScrollController.offset, activeOffset);

              return Opacity(
                opacity: opacity / 100,
                child: Column(
                  children: <Widget>[
                    Text(
                      movieData.movieList[widget.index].name,
                      style: TextStyle(
                          color: white,
                          fontSize: size.width / 14,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
