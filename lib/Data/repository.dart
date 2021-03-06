import 'package:uitest_bloc/Data/Models/list_view_response_model.dart';
import 'package:uitest_bloc/Data/network_service.dart';

class Repository {
  final NetworkService? networkService;

  Repository({this.networkService});

  Future<Map<String, dynamic>> fetchListViewData() async {
    final listViewDataRaw = await networkService!.fetchListViewData();
    return listViewDataRaw;
  }
}
