import 'package:flutter/material.dart';
import '../../utils/ui_util.dart';
import '../../widgets/blank.dart';
import '../../utils/color_util.dart';
import '../../widgets/judou_cell.dart';
import '../../widgets/comment_cell.dart';
import '../../widgets/end_cell.dart';
import '../../widgets/detail_label.dart';
import '../models/judou_model.dart';
import '../models/comment_model.dart';
import '../../bloc_provider.dart';
import '../BLoc/detail_bloc.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key key, this.model}) : super(key: key);
  final JuDouModel model;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: DetailBloc(uuid: model.uuid),
      child: DetailWidget(uuid: model.uuid),
    );
  }
}

class DetailWidget extends StatefulWidget {
  DetailWidget({Key key, this.uuid});

  final String uuid;
  @override
  State<StatefulWidget> createState() {
    return _DetailWidgetStateful();
  }
}

class _DetailWidgetStateful extends State<DetailWidget> {
  DetailBloc detailBloc;

  @override
  void initState() {
    detailBloc = BlocProvider.of<DetailBloc>(context);
    super.initState();
  }

  Widget sectionHeader(String title) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 15, top: 10),
            child: Text(title),
          ),
          Divider(),
        ],
      ),
    );
  }

  Widget hotCommnets(List<CommentModel> hotList) {
    List<CommentCell> listCell = List<CommentCell>();
    for (var i = 0; i < hotList.length; i++) {
      listCell.add(
        CommentCell(
            divider: i == hotList.length - 1 ? Container() : Divider(),
            model: hotList[i]),
      );
    }
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          sectionHeader('热门评论'),
          Column(
            children: listCell,
          ),
          Blank(),
        ],
      ),
    );
  }

  Widget body(
      BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
    if (snapshot.connectionState != ConnectionState.active) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    List<CommentModel> hot = snapshot.data['hot'];
    List<CommentModel> latest = snapshot.data['latest'];
    JuDouModel model = snapshot.data['detail'];
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0)
            return JuDouCell(
                divider: Blank(), tag: 'index_detail', model: model);
          if (index == 1)
            return DetailLabel(labelTitle: model?.tags[0].name ?? '爱情');
          if (index == 2)
            return hot.isNotEmpty ? hotCommnets(hot) : Container();
          if (index == 3) return sectionHeader('最新评论');
          if (index == latest.length + 2) return EndCell();
          return CommentCell(
              divider: index == latest.length + 1 ? Container() : Divider(),
              model: latest[index - 3]);
        },
        itemCount: latest.length + 3,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: detailBloc.commentSteam,
      builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        return Scaffold(
          appBar: AppBarUtils.appBar('详情', context),
          backgroundColor: ColorUtils.blankColor,
          body: body(context, snapshot),
        );
      },
    );
  }
}
