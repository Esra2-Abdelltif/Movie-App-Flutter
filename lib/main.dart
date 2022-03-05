import 'package:flutter/material.dart';
import 'Shared/widgets/app_route.dart';

void main() {
  runApp(MovieApp(appRouter: AppRouter()));
}

class MovieApp extends StatelessWidget {

  final AppRouter appRouter;

  const MovieApp({Key key, this.appRouter}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRouter,
      
    );
  }
}




