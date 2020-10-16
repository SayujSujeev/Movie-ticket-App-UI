import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants/constants.dart';
import 'package:movie_ticket_app/models/movie_model.dart';
import 'package:movie_ticket_app/screens/details/components/background.dart';
import 'package:movie_ticket_app/screens/details/components/buy_button.dart';
import 'package:movie_ticket_app/screens/details/components/costom_back_button.dart';
import 'package:movie_ticket_app/screens/details/components/detail_rubber_sheet.dart';
import 'package:rubber/rubber.dart';

class DetailScreen extends StatefulWidget {

  final MovieModel movie;

  final Size size;


  DetailScreen({this.movie, this.size});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {

  RubberAnimationController rubberAnimationSheetController;
  ScrollController rubberSheetScrollController;


  //animation when page starts
  @override
  void initState() {
    super.initState();
    rubberSheetScrollController = ScrollController();
    rubberAnimationSheetController = RubberAnimationController(
        vsync: this,
      lowerBoundValue: AnimationControllerValue(pixel: widget.size.height * 0.75),
      dismissable: false,
      upperBoundValue: AnimationControllerValue(percentage: 0.9),
      duration: Duration(milliseconds: 300),
      springDescription: SpringDescription.withDampingRatio(
        mass: 1,
        stiffness: Stiffness.LOW,
        ratio: DampingRatio.MEDIUM_BOUNCY,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          //Background movie image
          Background(background: widget.movie.image),

          //Buttom sheet
          DetailRubberSheet(widget.movie, rubberSheetScrollController, rubberAnimationSheetController,),

          //Buy button
          BuyButton(widget.movie.name),

          //Back button
          CustomBackButton(context),
        ],
      ),
    );
  }
}
