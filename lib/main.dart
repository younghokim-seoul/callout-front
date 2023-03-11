import 'package:arc/arc.dart';
import 'package:callout/feature/screen/main/tab/bottom_main_view.dart';
import 'package:callout/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'di/di_container.dart' as ic;

void main() async {
  await ic.setupModule();
  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            navigatorKey: Arc().navigatorKey,
            debugShowCheckedModeBanner: false,
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                child: child!,
              );
            },
            theme: ThemeData(
              fontFamily: 'NotoSansKR',
              scaffoldBackgroundColor: Colors.white,
              primarySwatch: Colors.grey,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: AppColors.cloudyBlue,
                selectedItemColor: AppColors.aquaMarine,
                elevation: 24,
                backgroundColor: Colors.white,
                selectedLabelStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: TextStyle(fontSize: 12),
              ),
            ),
            home: BottomMainView(),
          );
        });
  }
}
