import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uitest_bloc/Data/Models/list_view_response_model.dart';
import 'package:uitest_bloc/Widgets/app_bar_title.dart';
import 'package:uitest_bloc/Widgets/bottom_button.dart';
import 'package:uitest_bloc/Widgets/leading_back_button.dart';
import 'package:uitest_bloc/cubit/list_view_cubit_cubit.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double windowHeight = MediaQuery.of(context).size.height;
    double windowWidth = MediaQuery.of(context).size.width;
    BlocProvider.of<ListViewCubitCubit>(context).fetchListViewData();
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        leading: const LeadingBackButton(),
        backgroundColor: Colors.black,
        centerTitle: false,
        title: const AppBarTitle(
          title: 'Select Service',
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: BottomButton(
          windowHeight: windowHeight,
          windowWidth: windowWidth,
          title: "Proceed to Pick Date and Time",
          onPressed: () {},
        ),
      ),
      body: BlocBuilder<ListViewCubitCubit, ListViewCubitState>(
        builder: (context, state) {
          if (state is! ListViewCubitLoaded) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final listViewData = (state).listViewItems;
          print(listViewData);
          return ListView(
            padding: const EdgeInsets.only(
                bottom: kFloatingActionButtonMargin + 148),
            children:
                listViewData!.map((e) => _listViewData(e, context)).toList(),
          );
        },
      ),
    );
  }

  Widget _listViewData(
      AirConditionerResponseModel airConditionerResponseModelData, context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'airConditionerResponseModelData.message.toString()',
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
