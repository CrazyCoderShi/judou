import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';

class RecommandWidget extends StatefulWidget {
  @override
  _RecommandWidgetState createState() => _RecommandWidgetState();
}

class _RecommandWidgetState extends State<RecommandWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            Swiper(
              itemHeight: 100,
              itemWidth: MediaQuery.of(context).size.width,
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  color: index == 1 ? Colors.brown : Colors.red,
                );
              },
              itemCount: 3,
              autoplay: true,
              indicatorLayout: PageIndicatorLayout.WARM,
              layout: SwiperLayout.STACK,
              outer: false,
            ),
          ]),
        )
      ],
    );
  }
}
