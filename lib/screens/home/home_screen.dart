import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants/constants.dart';
import 'package:movie_ticket_app/screens/home/components/background_list_view.dart';
import 'package:movie_ticket_app/screens/home/components/custom_appbar.dart';
import 'package:movie_ticket_app/screens/home/components/movie_list_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Size get size => MediaQuery.of(context).size;

  //to Center the movie List View
  double get movieItemWidth => size.width / 2 + 48;

  ScrollController backgroundScrollController = ScrollController();
  ScrollController movieScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    // connecting Background list and Movie list
    movieScrollController.addListener(() {
      backgroundScrollController.jumpTo(
        movieScrollController.offset * (size.width / movieItemWidth)
      );
    });

    return Scaffold(
      backgroundColor: black,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          //Background of home screen
          BackgroundListView(backgroundScrollController),

          //Movie detail List view
          MovieListView(movieScrollController, movieItemWidth,),

          //Appbar
          CustomAppBar(),
        ],
      ),
    );
  }
}
