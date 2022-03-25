import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc/blocs/home/home/carousel/carousel_bloc.dart';

part 'home_tab/home_carousel.dart';


class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const _HomeCarousel(),
        Container(
          height: size.height * 0.35,
          color: Colors.red[50],
        ),
      ],
    );
  }
}
