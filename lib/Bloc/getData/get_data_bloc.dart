import 'dart:async';
import 'package:flu/Repo/repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_data_event.dart';
part 'get_data_state.dart';
part 'get_data_bloc.freezed.dart';

class GetDataBloc extends Bloc<GetDataEvent, GetDataState> {
  GetDataBloc() : super(GetDataState.initial()) {
    on<GetData>(getData);
  }

  Future<void> getData(GetData event, Emitter<GetDataState> emit) async {
    try {
      emit(state.copyWith(status: 'loading', data: []));
      var response = await Repo().getData();
      await Future.delayed(const Duration(seconds: 3));
      if (response[0]['status'] == "success") {
        emit(state.copyWith(data: response[0]['data']['Customer_Estimate_Flow'], status: 'completed'));
      } else {
        emit(state.copyWith(status: 'failed'));
      }
    } catch (e) {
      emit(state.copyWith(status: 'failed'));
    }
  }
}
