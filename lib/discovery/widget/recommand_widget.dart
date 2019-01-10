import '../../bloc_provider.dart';
import '../models/post_model.dart';
import '../models/video_model.dart';
import '../../widgets/loading.dart';
import '../BLoc/recommand_bloc.dart';
import '../models/subject_model.dart';
import '../models/carousel_model.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';

class DiscoveryRecommand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: RecommandBloc(),
      child: RecommandWidget(),
    );
  }
}

class RecommandWidget extends StatefulWidget {
  @override
  _RecommandWidgetState createState() => _RecommandWidgetState();
}

class _RecommandWidgetState extends State<RecommandWidget> {
  RecommandBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<RecommandBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.active) {
          return Loading();
        }
        print(snapshot.data);
        List<CarouselModel> carousels = snapshot.data['carousels'] as List;
        return ListView(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Swiper(
                itemBuilder: (context, index) {
                  return Image.network(
                    carousels[index].cover,
                    fit: BoxFit.fill,
                  );
                },
                itemCount: carousels.length,
                autoplay: true,
                outer: false,
                controller: SwiperController(),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ScrollBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}
