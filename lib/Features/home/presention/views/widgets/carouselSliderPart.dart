import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:servi_connect/Features/home/domain/entites/AdsEntity.dart';
import 'package:servi_connect/Features/home/presention/views/widgets/imageInCarouselSlider.dart';
import 'package:servi_connect/Features/home/presention/views/widgets/shimmerAdsItem.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/assets.dart';

class CarouselSliderPart extends StatelessWidget {
  const CarouselSliderPart(
      {super.key,
      required this.data,
      required this.indexOfCarouselSlider,
      required this.setIndexOfCarouslSlider,
      required this.adsIsLoading});
  final List<AdsEntity> data;
  final int indexOfCarouselSlider;
  final setIndexOfCarouslSlider;
  final bool adsIsLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
            itemCount: adsIsLoading ? 4 : data.length,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
                adsIsLoading
                    ? const ShimmerAdsItem()
                    : ImageInCarouselSlider(
                        image: data == null
                            ? AssetsData.toDo2
                            : 'http://10.0.2.2:8000/${data[index].path}',
                      ),
            options: CarouselOptions(
              height: 20.h,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              onPageChanged: (index, reason) {
                setIndexOfCarouslSlider(index);
              },
              scrollDirection: Axis.horizontal,
            )),
      ],
    );
  }
}
