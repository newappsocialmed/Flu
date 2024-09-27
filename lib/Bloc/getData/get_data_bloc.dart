import 'package:flu/Data/boxigodata.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_data_event.dart';
part 'get_data_state.dart';
part 'get_data_bloc.freezed.dart';

class GetDataBloc extends Bloc<GetDataEvent, GetDataState> {
  GetDataBloc() : super(GetDataState.initial()) {
    on<GetData>(getdata);
  }
  Future<void> getdata(GetDataEvent event, Emitter<GetDataState>emit) async {
    emit(state.copyWith(data: []));
    var response = Data().data;
    emit(state.copyWith(data: response['Customer_Estimate_Flow']));
  }
}
