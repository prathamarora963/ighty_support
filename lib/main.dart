import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/observers/route_observer.dart';
import 'package:ighty_support/routes/routes_generator.dart';
import 'package:ighty_support/routes/routes_page.dart';
import 'package:ighty_support/utils/app_color.dart';
import 'dart:io';
import 'package:loader_overlay/loader_overlay.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      overlayColor: Colors.black.withValues(alpha: 0.7),
      overlayWidgetBuilder: (_) {
        return Center(
          child: SpinKitDancingSquare(color: AppColor.themeColor, size: 69),
        );
      },
      child: GestureDetector(
        onTap: () {
          hideKeyboard(context);
        },
        child: SafeArea(
          bottom: Platform.isAndroid ? true : false,
          top: false,
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'IGHTY Support',
            theme: ThemeData(
              primaryColor: AppColor.greyColor,
              scaffoldBackgroundColor: Colors.white,
              fontFamily: "Poppins",
              useMaterial3: false,
              splashFactory: NoSplash.splashFactory,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent),
            ),
            navigatorObservers: [ClearFocusOnPush()],
            initialRoute: AppRoutes.splashView,
            onGenerateRoute: RoutesGenerator.generateRoute,
            onGenerateInitialRoutes: (String initialRouteName) {
              return [
                RoutesGenerator.generateRoute(
                  const RouteSettings(name: AppRoutes.splashView),
                ),
              ];
            },

            builder: (context, child) {
              final mediaQuery = MediaQuery.of(context);
              return MediaQuery(
                data: mediaQuery.copyWith(textScaleFactor: 1.0),
                child: child!,
              );
            },
          ),
        ),
      ),
    );
  }

  void hideKeyboard(context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}

class ClearFocusOnPush extends GetObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    final focus = FocusManager.instance.primaryFocus;
    focus?.unfocus();
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    final focus = FocusManager.instance.primaryFocus;
    focus?.unfocus();
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    final focus = FocusManager.instance.primaryFocus;
    focus?.unfocus();
  }
}
