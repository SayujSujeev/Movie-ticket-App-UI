import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants/constants.dart';
import 'package:movie_ticket_app/screens/booking/components/custom_app_bar.dart';
import 'package:movie_ticket_app/screens/booking/components/date_selector.dart';
import 'package:movie_ticket_app/screens/booking/components/location_text.dart';
import 'package:movie_ticket_app/screens/booking/components/pay_button.dart';
import 'package:movie_ticket_app/screens/booking/components/seat_selector.dart';
import 'package:movie_ticket_app/screens/booking/components/time_selector.dart';


class BookingScreen extends StatefulWidget {

  final String movieName;

  BookingScreen({this.movieName});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            //app bar
            CustomAppBar(widget.movieName),

            //date selector
            DateSelector(),

            //Time selector
            TimeSelector(),

            //Location and theatre
            LocationText(),

            //Seat selector
            SeatSelector(),

            //Pay button and seat categories
            PayButton(),
          ],
        ),
      ),
    );
  }
}
