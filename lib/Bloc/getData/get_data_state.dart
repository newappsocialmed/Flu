part of 'get_data_bloc.dart';

@freezed
class GetDataState with _$GetDataState {
  const factory GetDataState({required List data, required String status}) = _Initial;

  factory GetDataState.initial() {
    return const GetDataState(data: [], status: 'initial');
  }
}
