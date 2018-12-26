import 'package:flutter/material.dart';
import 'package:judou/utils/ui_util.dart';
import 'subscribes_cell.dart';
import 'package:judou/widgets/end_cell.dart';

class Subscribes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUtils.appBar('我的订阅', context),
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (index == 9) {
            return EndCell();
          }
          return SubscribesCell();
        },
        itemCount: 10,
      ),
    );
  }
}
