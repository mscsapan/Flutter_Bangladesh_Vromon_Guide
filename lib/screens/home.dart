import 'package:bd_vromon/views/exit_views.dart';

import '../views/slider_view.dart';
import 'package:flutter/services.dart';

import '../bloc/country_bloc.dart';
import '../views/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../views/loaded_information.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => getExitNotification(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[300],
        body: BlocBuilder<CountryBloc, CountryState>(
          builder: (context, CountryState state) {
            if (state is InitialState) {
              return const Loading();
            } else if (state is LoadingState) {
              return const Loading();
            } else if (state is LoadedState) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    primary: false,
                    automaticallyImplyLeading: false,
                    // backgroundColor: Colors.deepOrange,
                    floating: true,
                    expandedHeight: 250.0,
                    pinned: true,
                    elevation: 0.0,
                    centerTitle: true,
                    flexibleSpace: FlexibleSpaceBar(
                      title: const Text('বাংলাদেশ ভ্রমন'),
                      centerTitle: true,
                      background: CarouselView(),
                      collapseMode: CollapseMode.pin,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: LoadedInformation(information: state.information),
                  )
                ],
              );
            } else if (state is ErrorState) {
              return Center(child: Text(state.messages.toString()));
            }
            return const Text('Nothing Happens...');
          },
        ),
      ),
    );
  }
}
