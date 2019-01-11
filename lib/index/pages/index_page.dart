import 'package:flutter/material.dart';
import '../../utils/color_util.dart';
import '../widgets/index_item.dart';
import '../../widgets/button_subscript.dart';
import '../models/judou_model.dart';
import '../BLoc/index_bloc.dart';
import '../../bloc_provider.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: IndexBloc(),
      child: IndexWidget(),
    );
  }
}

class IndexWidget extends StatefulWidget {
  @override
  _IndexWidgetState createState() => _IndexWidgetState();
}

class _IndexWidgetState extends State<IndexWidget>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  PageController _pageController = PageController();
  IndexBloc indexBloc;
  String _like = '';
  String _comment = '';
  String _isLike = '';

  @override
  void initState() {
    indexBloc = BlocProvider.of<IndexBloc>(context);
    indexBloc.badgesSteam.listen((List<String> data) {
      setState(() {
        _like = data[1];
        _comment = data[0];
        _isLike = data[2];
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    indexBloc.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  Icon likeIcon() => _isLike == '0'
      ? Icon(
          Icons.favorite_border,
          color: ColorUtils.iconColor,
        )
      : Icon(
          Icons.favorite,
          color: Colors.redAccent,
        );

  Widget indexAppBar() => AppBar(
        iconTheme: IconThemeData(color: ColorUtils.iconColor),
        centerTitle: true,
        leading: Container(
          alignment: Alignment.center,
          child: Text(
            '句子',
            style: TextStyle(fontSize: 22.0, fontFamily: 'LiSung'),
          ),
        ),
        actions: <Widget>[
          SubscriptButton(
            icon: Icon(Icons.message),
            subscript: _comment,
            onPressed: () => indexBloc.toDetailPage(context),
          ),
          SubscriptButton(
            icon: likeIcon(),
            subscript: _like,
          ),
          IconButton(
            icon: Icon(Icons.share, color: ColorUtils.iconColor),
            onPressed: () => indexBloc.toDetailPage(context),
          ),
        ],
      );

  Widget buildBody(AsyncSnapshot<List<JuDouModel>> snapshot) {
    if (snapshot.connectionState != ConnectionState.active) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return PageView.builder(
      itemBuilder: (context, index) {
        return IndexPageItem(
          onTap: () => indexBloc.toDetailPage(context),
          model: snapshot.data[index],
        );
      },
      itemCount: snapshot.data.length,
      controller: this._pageController,
      onPageChanged: indexBloc.onPageChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: indexBloc.dailyStream,
      builder:
          (BuildContext context, AsyncSnapshot<List<JuDouModel>> snapshot) {
        return Scaffold(
          appBar: indexAppBar(),
          body: buildBody(snapshot),
        );
      },
    );
  }
}
