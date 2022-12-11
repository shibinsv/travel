import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:initial_test/bloc/dashboard/dashboard_bloc.dart';
import 'package:initial_test/bloc/tabs/tabs_bloc.dart';
import 'package:initial_test/ui/pages/tabs/profile.dart';
import 'package:initial_test/ui/pages/tabs/saved.dart';
import 'package:initial_test/ui/pages/tabs/settings.dart';
import 'package:initial_test/ui/pages/tabs/travel.dart';
import 'package:initial_test/ui/widgets/bottomBar.dart';
import 'package:initial_test/widgets/customWidgets.dart';

class DashboardScreen extends StatelessWidget {
  static navigateToDashboard(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => DashboardScreen()));
  }

  int _index = 0;

  List<Widget> dashboardItem = [
    const TravelTabPage(),
    const SettingsTabPage(),
    const ProfiletabPage(),
    const SavedtabPage()
  ];

  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<DashboardBloc>(context);
    final tabBloc = BlocProvider.of<TabsBloc>(context);

    Future.delayed(const Duration(milliseconds: 1000),
        () => {_bloc.add(DashboardLoadedEvent())});

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepOrange,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocBuilder<TabsBloc, TabsState>(
            builder: (context, state) {
              return BottomNavigationBar(
                showSelectedLabels: false,
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: Colors.grey,
                showUnselectedLabels: false,
                currentIndex: _index,
                selectedItemColor: Colors.deepOrange,
                backgroundColor: Colors.black,
                onTap: (val) =>
                    {_index = val, tabBloc.add(OnTabSelectedEvent(val))},
                items: [
                  getItem(TabOption.home),
                  getItem(TabOption.bookings),
                  getItem(TabOption.saved),
                  getItem(TabOption.profile)
                ],
              );
            },
          ),
        ),
        body: Stack(
          children: [
            Column(children: [
              BlocBuilder<DashboardBloc, DashboardState>(
                bloc: _bloc,
                builder: (context, state) {
                  return Visibility(
                    child: const ProgressBar(
                      progressColor: Colors.black,
                    ),
                    visible: (state is DashboardLoadingState) ||
                        (state is DashboardInitial),
                  );
                },
              ),
              BlocBuilder<TabsBloc, TabsState>(builder: (context, state) {
                if (state is OnTabSelectedState) {
                  _index = state.selectedTab;
                }
                return Container(
                  color: Colors.white,
                  child: dashboardItem[_index],
                  height: MediaQuery.of(context).size.height * 0.86,
                  width: MediaQuery.of(context).size.width,
                );
              })
            ]),
          ],
        ),
      ),
    );
  }
}
