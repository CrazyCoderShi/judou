import 'package:flutter/material.dart';
import 'counter.dart';

class DiscoveryPage extends StatefulWidget {
  @override
  _DiscoveryPageeState createState() => _DiscoveryPageeState();
}

class _DiscoveryPageeState extends State<DiscoveryPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Counter()
    );
  }
}