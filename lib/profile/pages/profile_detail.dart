import 'dart:ui';
import '../../widgets/blank.dart';
import '../../widgets/judou_cell.dart';
import '../models/collections_model.dart';
import '../../bloc_provider.dart';
import '../widgets/verify_header.dart';
import 'package:flutter/services.dart';
import '../../utils/color_util.dart';
import 'package:flutter/material.dart';
import '../widgets/normal_header.dart';
import '../Bloc/profile_detail_bloc.dart';
import '../../widgets/loading.dart';
import '../../widgets/collection_cell.dart';
import '../../index/models/judou_model.dart';
import '../../discovery/widget/topic_header.dart';

class ProfileDetailPage extends StatelessWidget {
  /// prfile header wiget type
  /// 0 Normal
  /// 1 Verify
  /// 2 Topics
  ProfileDetailPage({
    @required this.type,
    @required this.id,
  });

  final String id;
  final int type;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: ProfileDetailBloc(type, id),
      child: ProfilDetail(),
    );
  }
}

class ProfilDetail extends StatefulWidget {
  @override
  _ProfilDetailState createState() => _ProfilDetailState();
}

class _ProfilDetailState extends State<ProfilDetail> {
  Color _titleColor = Colors.transparent;
  Color _iconColor = Colors.white;
  ScrollController _controller = ScrollController();
  ProfileDetailBloc _bloc;
  Brightness _brightness = Brightness.dark;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<ProfileDetailBloc>(context);
    _controller.addListener(() {
      bool isTop = _controller.offset >= 135;
      setState(() {
        _titleColor = isTop ? Colors.black : Colors.transparent;
        _iconColor = isTop ? Colors.black : Colors.white;
        _brightness = isTop ? Brightness.light : Brightness.dark;
      });
    });
  }

  Widget _header(Map<String, dynamic> map, int type) {
    List<Widget> list = [
      NormalHeader(data: map),
      VerfiyHeader(data: map),
      TopicsHeader(data: map)
    ];
    return list[type];
  }

  /// verify,topics -> 350
  /// normal -> 286
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: StreamBuilder(
        stream: _bloc.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.active) {
            return Container(
              color: Colors.white,
              child: Loading(),
            );
          }

          Map<String, dynamic> header = snapshot.data['header'];
          List<JuDouModel> sentences = snapshot.data['sentences'];
          List<CollectionModel> collections;
          List<JuDouModel> hot;
          String title;
          if (_bloc.type == 0) {
            title = header['nickname'];
            collections = snapshot.data['collections'];
          } else {
            title = header['name'];
            hot = snapshot.data['collections'];
          }

          return Scaffold(
            backgroundColor: Colors.white,
            body: NestedScrollView(
              controller: _controller,
              body: TabBarView(
                children: <Widget>[
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return JuDouCell(
                        divider: Blank(),
                        tag: 'profile_detail_$index',
                        model: sentences[index],
                        isCell: true,
                      );
                    },
                    itemCount: sentences.length,
                  ),
                  _bloc.type == 0
                      ? GridView.builder(
                          itemBuilder: (context, index) {
                            return CollectionCell(model: collections[index]);
                          },
                          itemCount: collections.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                        )
                      : ListView.builder(
                          itemBuilder: (context, index) {
                            return JuDouCell(
                              divider: Blank(),
                              tag: 'profile_detail_hot$index',
                              model: hot[index],
                              isCell: true,
                            );
                          },
                          itemCount: hot.length,
                        ),
                ],
              ),
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    brightness: _brightness,
                    backgroundColor: Colors.white,
                    expandedHeight: _bloc.type == 1 ? 350 : 286,
                    bottom: TabBar(
                      indicatorColor: Colors.yellow,
                      indicatorSize: TabBarIndicatorSize.label,
                      unselectedLabelColor: ColorUtils.textGreyColor,
                      tabs: <Widget>[
                        Tab(
                            text: _bloc.type == 0
                                ? '句子 ${sentences.length}'
                                : '最新'),
                        Tab(
                            text: _bloc.type == 0
                                ? '收藏夹 ${collections.length}'
                                : '最热')
                      ],
                    ),
                    iconTheme: IconThemeData(color: _iconColor),
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: _header(header, _bloc.type),
                      collapseMode: CollapseMode.pin,
                    ),
                    title: Text(
                      title,
                      style: TextStyle(color: _titleColor),
                    ),
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back_ios,
                          color: _iconColor, size: 20),
                      onPressed: () {
                        Navigator.maybePop(context);
                      },
                    ),
                  )
                ];
              },
            ),
          );
        },
      ),
    );
  }
}
