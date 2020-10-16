import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants/constants.dart';

class BuildChairs{
  static Widget selectedChair(){
    return Container(
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(6.0)
      ),
    );
  }

  static Widget availableChair(){
    return Container(
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
          border: Border.all(color: white),
          borderRadius: BorderRadius.circular(6.0)
      ),
    );
  }

  static Widget reservedChair(){
    return Container(
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(6.0)
      ),
    );
  }
}