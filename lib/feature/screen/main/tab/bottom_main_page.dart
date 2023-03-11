import 'package:callout/di/di_container.dart';
import 'package:callout/feature/screen/main/tab/bottom_main_viewmodel.dart';
import 'package:callout/utils/dev_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomTabPage extends ConsumerStatefulWidget {
  const BottomTabPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => BottonTabPageState();
}

class BottonTabPageState extends ConsumerState<BottomTabPage> {
  final GlobalKey<ScaffoldState> _bottomKey = GlobalKey<ScaffoldState>();

  final bottomTabViewModel = it<BottomMainViewModel>();

  @override
  void initState() {
    Log.i("BottomTabPage initState");
    bottomTabViewModel.loadState(BottomState.HOME);
    super.initState();
  }

  @override
  void dispose() {
    Log.i("BottomTabPage dispose");
    bottomTabViewModel.disposeAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomKey,
      body: buildBody(),
      bottomNavigationBar: buildBottomNavigation(),
    );
  }

  Container buildBody() {
    return Container();
  }

  BottomAppBar buildBottomNavigation() {
    return BottomAppBar(
      color: Colors.black,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      elevation: 0,
      child: Container(
        height: 60.h,
      ),
    );
  }
}
