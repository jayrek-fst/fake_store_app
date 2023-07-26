import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: MaterialApp.router(
          title: ConstantUtil.appName,
          theme: ThemeData(primarySwatch: Colors.red, fontFamily: 'Poppins'),
          routeInformationProvider: AppRoute.router.routeInformationProvider,
          routeInformationParser: AppRoute.router.routeInformationParser,
          routerDelegate: AppRoute.router.routerDelegate),
    );
  }
}
