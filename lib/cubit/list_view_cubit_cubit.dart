import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uitest_bloc/Data/Models/list_view_response_model.dart';
import 'package:uitest_bloc/Data/repository.dart';

part 'list_view_cubit_state.dart';

class ListViewCubitCubit extends Cubit<ListViewCubitState> {
  final Repository? repository;

  ListViewCubitCubit({this.repository}) : super(ListViewCubitInitial());

  void fetchListViewData() {
    repository!.fetchListViewData().then((listViewData) => {
          emit(ListViewCubitLoaded(listViewItems: listViewData)),
        });
  }
}
