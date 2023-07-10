import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ViewerScreen extends StatefulWidget {
  const ViewerScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ViewerScreenState();
}

class _ViewerScreenState extends State<ViewerScreen> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
