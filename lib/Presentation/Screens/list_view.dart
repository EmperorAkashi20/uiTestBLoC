import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uitest_bloc/Data/Models/list_view_response_model.dart';
import 'package:uitest_bloc/Widgets/add_button.dart';
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
          return SizedBox(
            width: windowWidth * 2,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(
                  bottom: kFloatingActionButtonMargin + 148),
              children: [
                SizedBox(
                  height: windowHeight * 0.42,
                  child: Column(
                    children: [
                      Container(
                        height: windowHeight * 0.3,
                        width: windowWidth,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          image: DecorationImage(
                            image: NetworkImage(
                              listViewData!["data"]["image_url"],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('Assets/Images/ac-hx-02.png'),
                            SizedBox(width: windowWidth * 0.05),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    listViewData["data"]["category_name"],
                                    style: const TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    listViewData["data"]["description"],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey.shade300,
                  thickness: 6,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Center(
                    child: Text(
                      'Choose Services',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey.shade300,
                  thickness: 2,
                ),
                ListView.builder(
                  padding: const EdgeInsets.only(
                      bottom: kFloatingActionButtonMargin + 148),
                  shrinkWrap: true,
                  itemCount: listViewData["data"]["services"].length,
                  itemBuilder: (context, index) {
                    if (index == listViewData["data"]["services"].length) {
                      return SizedBox(height: windowHeight * 0.1);
                    } else {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: windowHeight * 0.08,
                                  width: windowWidth * 0.18,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade200,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        listViewData["data"]["services"][index]
                                            ["image_url"],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      listViewData["data"]["services"][index]
                                          ["service_name"],
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "Avg Cost: " +
                                          listViewData["data"]["services"]
                                                  [index]["rate"]
                                              .toString() +
                                          " Sar",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.red),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      listViewData["data"]["services"][index]
                                              ["description"]
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                                AddButton(
                                  windowHeight: windowHeight,
                                  windowWidth: windowWidth,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade300,
                            thickness: 2,
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
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
