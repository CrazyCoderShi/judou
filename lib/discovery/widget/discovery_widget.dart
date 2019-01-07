import './discovery_card.dart';
import '../../widgets/blank.dart';
import '../../utils/color_util.dart';
import 'package:flutter/material.dart';
import '../../widgets/loading.dart';
import '../../bloc_provider.dart';
import '../models/topic_model.dart';
import '../../index/models/tag_model.dart';
import '../../index/models/judou_model.dart';
import '../BLoc/discovery_bloc.dart';

class Discovery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: DiscoveryBloc(),
      child: DiscoveryWidget(),
    );
  }
}

class DiscoveryWidget extends StatefulWidget {
  @override
  _DiscoveryWidgetState createState() => _DiscoveryWidgetState();
}

class _DiscoveryWidgetState extends State<DiscoveryWidget>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  DiscoveryBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<DiscoveryBloc>(context);
    _controller = TabController(vsync: this, length: 5);
    _controller.addListener(() {
      print('change');
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Tab> _tagWidgets(List<TagModel> tags) {
    return tags
        .map((item) => Tab(
              text: item.name,
            ))
        .toList();
  }

  // List<Widget> _tabBarViews() {
  //   return
  // }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _bloc.stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.active) {
          return Loading();
        } else {
          List<TopicModel> topics = snapshot.data['topics'];
          List<TagModel> tags = snapshot.data['tags'];
          List<JuDouModel> tagListData = snapshot.data['tagListData'];
          return Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                _DiscoverTopicsWidget(),
                Blank(height: 5),
                Container(
                  height: 35,
                  child: TabBar(
                    isScrollable: true,
                    controller: _controller,
                    tabs: _tagWidgets(tags),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.white,
                    unselectedLabelColor: ColorUtils.textGreyColor,
                    labelColor: ColorUtils.textPrimaryColor,
                    labelStyle: TextStyle(fontSize: 14),
                  ),
                ),
                Blank(height: 1),
                Expanded(
                  child: TabBarView(
                    controller: _controller,
                    children: _tagWidgets(tags)
                        .map(
                          (item) => ListView.builder(
                                itemBuilder: (context, inde) => Container(
                                      height: 30,
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 15),
                                      child: Text('${item.text}'),
                                    ),
                                itemCount: 30,
                              ),
                        )
                        .toList(),
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}

class _DiscoverTopicsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      height: 100,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: ((context, index) {
          switch (index) {
            case 0:
              return DiscoveryCard(isLeading: true, isTrailing: false);
              break;
            case 4:
              return DiscoveryCard(isLeading: false, isTrailing: true);
            default:
              return DiscoveryCard(isLeading: false, isTrailing: false);
          }
        }),
      ),
    );
  }
}
