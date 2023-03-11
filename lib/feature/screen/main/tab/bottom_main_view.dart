import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomMainView extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => BottonMainViewState();
}

class BottonMainViewState extends ConsumerState<BottomMainView> {

  final GlobalKey<ScaffoldState> _bottomKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomKey,
      body: buildBody(),
      bottomNavigationBar: buildBottomNavigation(),
    );
  }

  Container buildBody() {
    return Container(

    );
  }

  BottomAppBar buildBottomNavigation() {
    return BottomAppBar(
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      elevation: 0,
      child: Container(),
    );
  }

}
