part of 'get_data_bloc.dart';

@freezed
class GetDataEvent with _$GetDataEvent {
  const factory GetDataEvent.get() = GetData;
  const factory GetDataEvent.add() = AddData;
}