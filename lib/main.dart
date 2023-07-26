import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'app_route.dart';
import 'data/remote/product_datasource_impl.dart';
import 'util/constant_util.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ProductDataSourceImpl(client: http.Client()),
      child: ResponsiveBreakpoints.builder(
        child: MaterialApp.router(
            title: ConstantUtil.appName,
            theme: ThemeData(primarySwatch: Colors.red, fontFamily: 'Poppins'),
            routeInformationProvider: AppRoute.router.routeInformationProvider,
            routeInformationParser: AppRoute.router.routeInformationParser,
            routerDelegate: AppRoute.router.routerDelegate),
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
        ],
      ),
    );
  }
}
