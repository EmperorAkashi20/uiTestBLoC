part of 'list_view_cubit_cubit.dart';

abstract class ListViewCubitState extends Equatable {
  const ListViewCubitState();

  @override
  List<Object> get props => [];
}

class ListViewCubitInitial extends ListViewCubitState {}

class ListViewCubitLoaded extends ListViewCubitState {
  final List<AirConditionerResponseModel>? listViewItems;

  const ListViewCubitLoaded({this.listViewItems});
}
