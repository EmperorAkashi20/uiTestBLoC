import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uitest_bloc/cubit/list_view_cubit_cubit.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ListViewCubitCubit>(context).fetchListViewData();
    return const Scaffold(
      body: Center(
        child: Text('data'),
      ),
    );
  }
}
