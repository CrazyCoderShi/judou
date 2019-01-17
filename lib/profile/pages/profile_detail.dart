import 'dart:ui';
import '../../bloc_provider.dart';
import '../widgets/verify_header.dart';
import 'package:flutter/services.dart';
import '../../utils/color_util.dart';
import 'package:flutter/material.dart';
import '../widgets/normal_header.dart';
import '../Bloc/profile_detail_bloc.dart';
import '../../widgets/loading.dart';
import '../../discovery/widget/topic_header.dart';

class ProfileDetailPage extends StatelessWidget {
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

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<ProfileDetailBloc>(context);
    _controller.addListener(() {
      bool isTop = _controller.offset >= 135;
      setState(() {
        _titleColor = isTop ? Colors.black : Colors.transparent;
        _iconColor = isTop ? Colors.black : Colors.white;
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: isTop ? Colors.black : Colors.white,
        ));
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
          print(snapshot);

          if (snapshot.connectionState != ConnectionState.active) {
            return Container(
              color: Colors.white,
              child: Loading(),
            );
          }

          return Scaffold(
            backgroundColor: Colors.white,
            body: NestedScrollView(
              controller: _controller,
              body: TabBarView(
                children: <Widget>[
                  Text('句子'),
                  Text('收藏夹'),
                ],
              ),
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    expandedHeight: _bloc.type == 1 ? 350 : 286,
                    bottom: TabBar(
                      indicatorColor: Colors.yellow,
                      indicatorSize: TabBarIndicatorSize.label,
                      unselectedLabelColor: ColorUtils.textGreyColor,
                      tabs: <Widget>[Tab(text: '句子'), Tab(text: '收藏夹')],
                    ),
                    iconTheme: IconThemeData(color: _iconColor),
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: _header(snapshot.data['header'], _bloc.type),
                    ),
                    title: Text('标题', style: TextStyle(color: _titleColor)),
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
