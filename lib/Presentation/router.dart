import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uitest_bloc/Constants/string_constants.dart';
import 'package:uitest_bloc/Data/network_service.dart';
import 'package:uitest_bloc/Data/repository.dart';
import 'package:uitest_bloc/Presentation/Screens/home_page.dart';
import 'package:uitest_bloc/Presentation/Screens/list_view.dart';
import 'package:uitest_bloc/cubit/list_view_cubit_cubit.dart';

class AppRouter {
  Repository? repository;

  AppRouter() {
    repository = Repository(networkService: NetworkService());
  }

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case listViewScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (BuildContext context) =>
                    ListViewCubitCubit(repository: repository),
                child: const ListViewScreen()));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
