import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants/constants.dart';

class CustomAppBar extends StatefulWidget {
  final String movieName;

  CustomAppBar(this.movieName);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      flex: 15,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: appPadding / 2),
        child: Container(
          width: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                widget.movieName,
                style: TextStyle(
                  color: white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Positioned(
                left: 24,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: size.height * 0.075,
                      width: size.width * 0.15,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: white.withOpacity(0.35)
                        ),
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
