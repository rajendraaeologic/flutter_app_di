import 'package:flutter/material.dart';
import 'package:flutter_app_provider/repository/user_repo.dart';
import 'package:provider/provider.dart';

import 'di/locator.dart';
import 'home.dart';

void main() {
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create: (context) => locator<UserRepository>().fetchMovieList(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home()
      ),
    );
  }
}
