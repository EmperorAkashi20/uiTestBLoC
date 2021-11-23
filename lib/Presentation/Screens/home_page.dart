import 'package:flutter/material.dart';
import 'package:uitest_bloc/Constants/string_constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text('Navigate'),
          onPressed: () {
            Navigator.pushNamed(context, listViewScreen);
          },
        ),
      ),
    );
  }
}
