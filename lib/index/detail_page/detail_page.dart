import 'package:flutter/material.dart';
import 'package:judou/widgets/ui_util.dart';
import 'detail_header.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key, @required this.onDispose});
  final VoidCallback onDispose;

  final items = List<String>.generate(100, (i) => 'item $i');

  @override
  State<StatefulWidget> createState() {
    return _DetailStateful();
  }
}

class _DetailStateful extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarUtils.appBar('详情', context),
        body: Container(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return DetailHeader();
                    default :
                      return Column(children: <Widget>[
                        ListTile(
                            title: Text(widget.items[index]),
                            leading: Icon(Icons.access_alarms),
                            trailing: Icon(Icons.arrow_forward_ios)),
                        Divider(indent: 24)
                      ]);
                  }
                },
                itemCount: widget.items.length)
        )
    );
  }
}
