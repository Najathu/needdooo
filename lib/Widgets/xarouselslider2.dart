import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carouselslider extends StatelessWidget {
  final List<String> img;

  const Carouselslider({
    Key? key,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: img.map((item) {
        return Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              item,
              fit: BoxFit.cover,
              width: 1000.0,
            ),
          ),
        );
      }).toList(),
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
    );
  }
}
