import '../../bloc_provider.dart';
import '../../widgets/blank.dart';
import '../../widgets/loading.dart';
import '../BLoc/subscribe_bloc.dart';
import 'package:flutter/material.dart';
import '../../widgets/judou_cell.dart';
import '../../index/models/judou_model.dart';

class DiscoverySubscribe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: SubscribeBloc(),
      child: SubscribeWidget(),
    );
  }
}

class SubscribeWidget extends StatefulWidget {
  @override
  _SubscribeWidgetState createState() => _SubscribeWidgetState();
}

class _SubscribeWidgetState extends State<SubscribeWidget>
    with AutomaticKeepAliveClientMixin {
  SubscribeBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<SubscribeBloc>(context);
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.stream,
      builder: (context, AsyncSnapshot<List<JuDouModel>> snapshot) {
        List<JuDouModel> dataList = snapshot.data;
        if (snapshot.connectionState != ConnectionState.active) {
          return Center(
            child: Loading(),
          );
        }

        return ListView.builder(
          itemBuilder: (context, index) => JuDouCell(
                model: dataList[index],
                tag: 'DiscoveryPageSubscribe$index',
                onTap: () => bloc.toDetailPage(context, dataList[index]),
                divider: Blank(),
                isCell: true,
              ),
          itemCount: dataList.length,
          physics: AlwaysScrollableScrollPhysics(),
        );
      },
    );
  }
}
