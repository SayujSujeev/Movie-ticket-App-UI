import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants/constants.dart';
import 'package:movie_ticket_app/widget/build_chairs.dart';

class SeatSelector extends StatefulWidget {
  @override
  _SeatSelectorState createState() => _SeatSelectorState();
}

class _SeatSelectorState extends State<SeatSelector> {

  Widget _chairList(){

    Size size = MediaQuery.of(context).size;

    // 1 is free seats
    // 2 is selected seats
    // 3 is reserved seats

    var _chairStatus = [
      [1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 3, 1, 1],
      [1, 1, 1, 1, 1, 3, 3],
      [2, 2, 2, 1, 3, 1, 1],
      [1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1],
    ];

    return Container(
      child: Column(
        children: <Widget>[
          for (int i = 0; i < 6; i++)
            Container(
              margin: EdgeInsets.only(top: i == 3 ? size.height * .02 : 0),
              child: Row(
                children: <Widget>[
                  for (int x = 0; x < 9; x++)
                    Expanded(
                      flex: x == 0 || x == 8 ? 2 : 1,
                      child: x == 0 ||
                          x == 8 ||
                          (i == 0 && x == 1) ||
                          (i == 0 && x == 7) ||
                          (x == 4)
                          ? Container()
                          : Container(
                        height: size.width / 11 - 10,
                        margin: EdgeInsets.all(5),
                        child: _chairStatus[i][x - 1] == 1
                            ? BuildChairs.availableChair()
                            : _chairStatus[i][x - 1] == 2
                            ? BuildChairs.selectedChair()
                            : BuildChairs.reservedChair(),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      flex: 47,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size.width,
          ),

          //Movie white Screen starts

          Positioned(
            top: 48,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.65,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50.0),
                        topLeft: Radius.circular(50.0),
                      ),
                      gradient: LinearGradient(
                        colors: [white, Colors.transparent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0, 1],
                      )),
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.55,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                    width: 6.0,
                    color: white,
                  ))),
                ),
              ],
            ),
          ),

          //Movie white Screen ends

          Positioned(
              bottom: size.height * .02,
              child: Container(width: size.width, child: _chairList())),
        ],
      ),
    );
  }
}
