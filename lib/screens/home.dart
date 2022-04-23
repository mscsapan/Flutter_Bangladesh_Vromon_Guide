import '../bloc/country_bloc.dart';
import '../views/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../views/loaded_information.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: BlocBuilder<CountryBloc, CountryState>(
          builder: (context, state) {
            if (state is InitialState) {
              return const Text('Loading...');
            } else if (state is LoadingState) {
              return const Text('Loading...');
            }
            return const Text('বিভাগ সমূহ');
          },
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CountryBloc, CountryState>(
        builder: (context, CountryState state) {
          if (state is InitialState) {
            return const Loading();
          } else if (state is LoadingState) {
            return const Loading();
          } else if (state is LoadedState) {
            return LoadedInformation(information: state.information);
          } else if (state is ErrorState) {
            return Text(state.messages.toString());
          }
          return const Text('Nothing Happens...');
        },
      ),
    );
  }
}
