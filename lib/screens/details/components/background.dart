import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants/constants.dart';

class Background extends StatefulWidget {
  final Image background;

  Background({this.background});

  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Positioned(
      top: -48,
      bottom: 0,
      child: TweenAnimationBuilder(
        duration: Duration(milliseconds: 700),
        tween: Tween<double>(begin: 0.25,end: 1),
        builder: (_, value, child){
          return Transform.scale(scale: value,child: child,);
        },
        child: Stack(
          children: [
            Image(
              image: widget.background.image,
              width: size.width,
              height: size.height,
              fit: BoxFit.cover,
            ),
            Container(
              width: size.width,
              height: size.height,
              color: black.withOpacity(0.6),
            )
          ],
        ),
      ),
    );
  }
}
