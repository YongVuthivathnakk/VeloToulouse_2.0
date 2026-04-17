import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:velotoulouse/models/pass.dart';
import 'package:velotoulouse/ui/screens/pass/widgets/pass_card.dart';
import 'package:velotoulouse/ui/themes/theme.dart';

class PassContent extends StatelessWidget {
  const PassContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Pass Options", style: AppText.h2,))),
      body: PassCarousel(),
    );
  }
}

class PassCarousel extends StatefulWidget {
  const PassCarousel({super.key});

  @override
  State<PassCarousel> createState() => _PassCarouselState();
}

class _PassCarouselState extends State<PassCarousel> {
  int _currentIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider.builder(
          carouselController: _controller,
          itemCount: Pass.values.length - 1,
          itemBuilder: (context, index, pageViewIndex) => PassCard(
            pass: Pass.values[index + 1],
            onChoose: () {}, 
          ), 
          options: CarouselOptions(
            height: 560,
            viewportFraction: 0.88,
            enlargeCenterPage: true,
            enlargeFactor: 0.05,
            enableInfiniteScroll: false,
            initialPage: 0,
            onPageChanged: (index, reason) {
              setState(() => _currentIndex = index);
            }, 
          ), 
        ),
        const SizedBox(height: 12),

        // Dot indicatior ...

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            Pass.values.length - 1,
            (index) => GestureDetector(
              onTap: () => _controller.animateToPage(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentIndex == index ? 20 : 7,
                height: 7,
                decoration: BoxDecoration(
                  color: _currentIndex == index
                      ? AppColors.primaryDark
                      : AppColors.grey300,
                  borderRadius: BorderRadius.circular(999),
                ), 
              ), 
            ), 
          ), 
        ), 
      ], 
    );
  }
}
