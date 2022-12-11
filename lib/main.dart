import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:initial_test/bloc/dashboard/dashboard_bloc.dart';
import 'package:initial_test/bloc/saved_items/saved_items_bloc.dart';
import 'package:initial_test/bloc/tabs/tabs_bloc.dart';
import 'package:initial_test/bloc/travel/travel_bloc.dart';
import 'package:initial_test/ui/pages/splash.dart';

import 'bloc/login/login_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: ((context) => LoginBloc())),
        BlocProvider<DashboardBloc>(create: ((context) => DashboardBloc())),
        BlocProvider<TabsBloc>(create: ((context) => TabsBloc())),
        BlocProvider<TravelBloc>(create: ((context) => TravelBloc())),
        BlocProvider<SavedItemsBloc>(create: ((context) => SavedItemsBloc())),
      ],
      child: MaterialApp(
        title: "Travelty",
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(), //for example splashScreen,
          theme: ThemeData()),
    );
  }
}
