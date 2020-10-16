import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants/constants.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: appPadding * 2.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: size.height * 0.075,
              width: size.width * 0.15,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: white.withOpacity(0.35),
                  ),
                  borderRadius: BorderRadius.circular(20.0)),
              child: Icon(
                Icons.clear_all_rounded,
                color: white,
                size: 30.0,
              ),
            ),
            Container(
              height: size.height * 0.075,
              width: size.width * 0.7,
              decoration: BoxDecoration(
                  border: Border.all(color: white.withOpacity(0.35)),
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: appPadding / 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Search Movies',
                      style: TextStyle(color: white, letterSpacing: 1.0),
                    ),
                    Icon(
                      Icons.search,
                      size: 30.0,
                      color: white,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
