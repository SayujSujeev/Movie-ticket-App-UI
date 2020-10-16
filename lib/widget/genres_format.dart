import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class GenresFormat extends StatefulWidget {

  final List<String> genres;
  Color color;

  GenresFormat(this.genres, this.color);

  @override
  _GenresFormatState createState() => _GenresFormatState();
}

class _GenresFormatState extends State<GenresFormat> {

  @override
  Widget build(BuildContext context) {
    Widget _dot = Container(
      width: 6.0,
      height: 6.0,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
          color: widget.color, borderRadius: BorderRadius.circular(50.0)),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.genres.length, (index) {
        if (index < widget.genres.length - 1) {
          return Row(
            children: [
              Text(
                widget.genres[index],
                style: TextStyle(color: widget.color, fontSize: 12),
              ),
              _dot,
            ],
          );
        }
        else {
          return Text(widget.genres[index],style: TextStyle(color: widget.color,fontSize: 12),);
        }
      }),
    );
  }
}
