import 'package:bd_vromon/model/info_model.dart';
import 'package:bd_vromon/network/network_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'country_event.dart';

part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc() : super(InitialState()) {
    on<CountryEvent>((event, emit) async {
      if (event is GetAllInformationEvent) {
        try {
          emit(LoadingState());
          final List<InformationModel> information =
              await NetworkService().getAllInformation();
          print(information[0].toJson());
          emit(LoadedState(information: information));
        } catch (err) {
          emit(ErrorState(messages: err.toString()));
        }
      }
    });
  }
}
