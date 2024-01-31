import 'package:flutter/material.dart';
import 'package:movie_booking/network/data_agent/http_data_agent_impl.dart';
import 'package:movie_booking/network/data_agent/movie_booking_data_agent.dart';

abstract class Shape {
  void draw();
  void erase();
}

class Circle extends Shape {
  @override
  void draw() {
    debugPrint("hello");
  }

  @override
  void erase() {
    debugPrint("hi");
  }
}

class Rectangle extends Shape {
  @override
  void draw() {
    debugPrint("this is draw from rectangle");
  }

  @override
  void erase() {
    debugPrint("nothing");
  }
}

void main() {
  Shape circle = Circle();
  Shape rectangle = Circle();

  Shape example = Rectangle();

  example.draw();

  MovieBookingDataAgent dataAgent = HttpDataAgentImpl();
  dataAgent.getNowPlayingMovieList(1);

  circle.draw();
  rectangle.draw();
  circle.erase();
  rectangle.erase();
}
