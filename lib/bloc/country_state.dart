part of 'country_bloc.dart';

abstract class CountryState extends Equatable {
  const CountryState();
}

class InitialState extends CountryState {
  @override
  List<Object> get props => [];
}

class LoadingState extends CountryState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends CountryState {
  final List<InformationModel> information;
  const LoadedState({required this.information});
  @override
  List<Object?> get props => [information];
}

class ErrorState extends CountryState {
  final String messages;
  const ErrorState({required this.messages});
  @override
  List<Object?> get props => [messages];
}
