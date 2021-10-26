import 'package:day2/core/store.dart';
import 'package:day2/pages/cart_page.dart';
import 'package:day2/pages/home_page_detail.dart';
import 'package:day2/utils/routes.dart';
import 'package:day2/utils/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import '/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(
        routes: {
          '/': (_, __) => MaterialPage(child: LoginPage()),
          MyRoutes.homeRoute: (_, __) => MaterialPage(child: HomePage()),
          MyRoutes.homeDetailsRoute: (uri, _) {
            final catalog = (VxState.store as MyStore)
                .catalog
                .getById(int.parse(uri.queryParameters["id"]));
            return MaterialPage(
                child: HomeDetailPage(
              catalog: catalog,
            ));
          },
          MyRoutes.loginRoute: (_, __) => MaterialPage(child: LoginPage()),
          MyRoutes.cartRoute: (_, __) => MaterialPage(child: CartPage()),
        },
      ),

      //initialRoute: MyRoutes.loginRoute,
      //
    );
  }
}
