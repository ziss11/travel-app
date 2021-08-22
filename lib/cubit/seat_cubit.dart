import 'package:bloc/bloc.dart';

class SeatCubit extends Cubit<List<String>> {
  SeatCubit() : super([]);

  void selectedSeat(String id) async {
    print("prev state : $state");
    if (!isSelected(id)) {
      state.add(id);
    } else {
      state.remove(id);
    }
    print("new state : $state");

    emit(List.from(state));
  }

  bool isSelected(String id) {
    int index = state.indexOf(id);
    if (index == -1) {
      return false;
    } else {
      return true;
    }
  }
}
