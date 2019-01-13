import './discovery_card.dart';
import './recommand_cell.dart';
import '../../bloc_provider.dart';
import '../../widgets/blank.dart';
import '../models/post_model.dart';
import '../models/video_model.dart';
import '../../widgets/loading.dart';
import '../BLoc/recommand_bloc.dart';
import '../../utils/color_util.dart';
import '../models/subject_model.dart';
import '../models/carousel_model.dart';
import 'package:flutter/material.dart';
import '../../index/models/judou_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

final TextStyle _textStyle =
    TextStyle(fontSize: 12, color: ColorUtils.textGreyColor);

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
    bloc.dispose();
    super.dispose();
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
              _SectionTitle(title: '文章', moreAction: () => print('更多')),
              _ArticleList(posts: snapshot.data['posts']),
              Blank(height: 10),
              _SectionTitle(title: '话题', moreAction: () => print('更多')),
              _SubjectList(subjects: snapshot.data['subjects']),
              Blank(height: 10),
              _SectionTitle(title: '视频', moreAction: () => print('更多')),
              _VideoList(videos: snapshot.data['videos']),
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

class _ArticleList extends StatelessWidget {
  _ArticleList({this.posts});

  final List<PostModel> posts;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: posts
            .map((item) => RecommandCell(
                  isVideo: false,
                  title: item.title,
                  subTitle: item.author,
                  content: item.summary,
                  imageUrl: item.banner,
                ))
            .toList(),
      ),
    );
  }
}

class _SubjectList extends StatelessWidget {
  _SubjectList({this.subjects});
  final List<SubjectModel> subjects;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: EdgeInsets.only(bottom: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: subjects.length,
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: ((context, index) {
          SubjectModel model = subjects[index];
          return DiscoveryCard(
            isLeading: index == 0,
            isTrailing: index == subjects.length - 1,
            title: model.title,
            imageUrl: model.cover,
            height: 90,
            width: 150,
          );
        }),
      ),
    );
  }
}

class _VideoList extends StatelessWidget {
  _VideoList({this.videos});

  final List<VideoModel> videos;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: videos
            .map((item) => RecommandCell(
                  isVideo: true,
                  title: item.title,
                  subTitle: item.summary,
                  content: '时长: ${item.videoLength}',
                  imageUrl: item.cover,
                ))
            .toList(),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  _SectionTitle({
    this.title,
    this.moreAction,
  });

  final String title;
  final VoidCallback moreAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
          FlatButton(
            child: Text('更多', style: _textStyle),
            onPressed: moreAction,
          )
        ],
      ),
    );
  }
}
