import './discovery_card.dart';
import '../../widgets/blank.dart';
import '../../bloc_provider.dart';
import '../../widgets/loading.dart';
import '../models/topic_model.dart';
import '../BLoc/discovery_bloc.dart';
import '../../utils/color_util.dart';
import 'package:flutter/material.dart';
import '../../widgets/judou_cell.dart';
import '../../index/models/tag_model.dart';
import '../../index/models/judou_model.dart';

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
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  ScrollController _scrollController;
  TabController _controller;
  DiscoveryBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<DiscoveryBloc>(context);
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    _controller = TabController(vsync: this, length: 9);
    _controller.addListener(() {
      if (_controller.indexIsChanging) {
        _bloc.fetchTagListDataWithId('${_bloc.tags[_controller.index].id}');
      }
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _controller.dispose();
    _bloc.dispose();
    super.dispose();
  }

  _scrollListener() {
    // print(_scrollController.position.extentInside);
  }

  List<Tab> _tagWidgets(List<TagModel> tags) {
    return tags
        .map((item) => Tab(
              text: item.name,
            ))
        .toList();
  }

  List<Widget> _tabBarViews(List<TagModel> tags, List<JuDouModel> tagListData) {
    return _tagWidgets(tags).map(
      (item) {
        return ListView.builder(
          itemBuilder: (context, index) => JuDouCell(
            model: tagListData[index],
            divider: Blank(height: 10),
            tag: 'discovery$index',
            isCell: true,
          ),
          itemCount: tagListData.length,
          physics: AlwaysScrollableScrollPhysics(),
          controller: _scrollController,
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder(
      stream: _bloc.stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.active) {
          return Loading();
        } else {
          return Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                _DiscoverTopicsWidget(
                  topics: snapshot.data['topics'],
                ),
                Blank(height: 5),
                Container(
                  height: 35,
                  child: TabBar(
                    isScrollable: true,
                    controller: _controller,
                    tabs: _tagWidgets(snapshot.data['tags']),
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
                    children: _tabBarViews(
                      snapshot.data['tags'],
                      snapshot.data['tagListData'],
                    ),
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
  _DiscoverTopicsWidget({this.topics});

  final List<TopicModel> topics;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      height: 100,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: topics.length,
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: ((context, index) {
          TopicModel model = topics[index];
          return DiscoveryCard(
            isLeading: index == 0,
            isTrailing: index == topics.length - 1,
            title: model.name,
            imageUrl: model.cover,
            height: 70,
            width: 100,
            id: model.uuid,
          );
        }),
      ),
    );
  }
}
