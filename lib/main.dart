import 'package:flutter/material.dart';
import 'package:uitest_bloc/Presentation/Screens/home_page.dart';

import 'Presentation/router.dart';

void main() {
  runApp(UITestBloc(
    router: AppRouter(),
  ));
}

class UITestBloc extends StatelessWidget {
  final AppRouter router;
  const UITestBloc({Key? key, required this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: router.generateRoute,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
