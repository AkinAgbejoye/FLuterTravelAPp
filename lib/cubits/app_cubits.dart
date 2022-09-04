import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:notes/cubits/app_cubit_state.dart';
import 'package:notes/model/data_model.dart';
import 'package:notes/services/data-services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices data;

  late final places;
  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {}
  }

  detailsPage(DataModel data) {
    emit(DetailedState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
