import 'package:flutter/material.dart';
import 'package:movie_ticket_app/data/data.dart';
import 'package:movie_ticket_app/screens/home/components/movie_index.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class MovieListView extends StatefulWidget {

  final ScrollController movieScrollController;
  final double movieItemWidth;

  MovieListView(this.movieScrollController,this.movieItemWidth);

  @override
  _MovieListViewState createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  var movieData = MovieData();


  @override
  Widget build(BuildContext context) {
    Size  size = MediaQuery.of(context).size;

    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 700),
      tween: Tween<double>(begin: 600, end: 0),
      curve: Curves.easeOutCubic,
      builder: (_,value, child) {
        return Transform.translate(
          offset: Offset(value, 0),
          child: child,
        );
      },
      child: Container(
        height: size.height * .8,
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowGlow();
            return true;
          },
          child: ScrollSnapList(
            listController: widget.movieScrollController,
            onItemFocus: (item) {
            },
            itemSize: widget.movieItemWidth,
            padding: EdgeInsets.zero,
            itemCount: movieData.movieList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return MovieIndex(index, widget.movieScrollController, widget.movieItemWidth);
            },
          ),
        ),
      ),
    );
  }
}
