import '../../bloc_provider.dart';
import '../../widgets/blank.dart';
import '../models/post_model.dart';
import '../models/video_model.dart';
import '../../widgets/loading.dart';
import '../BLoc/recommand_bloc.dart';
import '../../utils/color_util.dart';
import '../models/subject_model.dart';
import '../../index/models/judou_model.dart';
import '../models/carousel_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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

class _RecommandWidgetState extends State<RecommandWidget>
    with AutomaticKeepAliveClientMixin {
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
  bool get wantKeepAlive => true;

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
        return Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 180,
                child: Swiper(
                  itemBuilder: (context, index) {
                    return Image.network(
                      carousels[index].cover,
                      fit: BoxFit.cover,
                    );
                  },
                  itemCount: carousels.length,
                  autoplay: true,
                  outer: false,
                  controller: SwiperController(),
                ),
              ),
              Blank(height: 10),
              _RecommandThink(models: snapshot.data['today']),
              Blank(height: 10),
            ],
          ),
        );
      },
    );
  }
}

class _RecommandThink extends StatelessWidget {
  /// [onTap] 点击回调
  _RecommandThink({this.onTap, this.models});
  final VoidCallback onTap;
  final List<JuDouModel> models;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 180,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            border: Border.all(color: ColorUtils.dividerColor, width: 0.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '今日哲思',
                    style: TextStyle(fontSize: 25.0, fontFamily: 'LiSung'),
                  ),
                  IconButton(
                    icon: Icon(Icons.share),
                    color: ColorUtils.iconColor,
                    onPressed: () => print('分享今日哲思'),
                  ),
                ],
              ),
              Text(
                '${models[0].content}',
                style: TextStyle(color: ColorUtils.textPrimaryColor),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  '${models[0].subHeading}',
                  style: TextStyle(color: ColorUtils.textPrimaryColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
