// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:initial_test/bloc/saved_items/saved_items_bloc.dart';
import 'package:initial_test/bloc/travel/travel_bloc.dart';
import 'package:initial_test/model/travelModel.dart';
import 'package:initial_test/widgets/customWidgets.dart';

import '../../../utils/constants.dart';

class TravelTabPage extends StatelessWidget {
  const TravelTabPage({Key? key}) : super(key: key);

  static navigateToTravelTabPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const TravelTabPage()));
  }

  @override
  Widget build(BuildContext context) {
    var selectedIndex = 0;
    var _bloc = BlocProvider.of<TravelBloc>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const HeaderDashboard(),
              const SearchTravel(),
              TravelModes(),
              BlocBuilder<TravelBloc, TravelState>(
                bloc: _bloc,
                builder: (context, state) {
                  if (state is TravelModeSelectedState) {
                    selectedIndex = state.modeSelected;
                  }
                  switch (selectedIndex) {
                    case 0:
                      return PlacesUI();
                    case 1:
                      return FlightsUI();
                    default:
                      return const SizedBox(height: 30);
                  }
                  // return (selectedIndex == 0) ? PlacesUI() : SizedBox(height: 30);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderDashboard extends StatelessWidget {
  const HeaderDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        // ignore: prefer_const_constructors
        TitleText(text: "Good morning user"),
        const SizedBox(height: 10.0),
        const TitleText(
            text: "What are you upto today?", color: Colors.deepOrange),
        const SizedBox(height: 30.0)
      ],
    );
  }
}

class SearchTravel extends StatelessWidget {
  const SearchTravel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Icon(Icons.search, color: Colors.deepOrange),
        const SizedBox(width: 10.0),
        Flexible(
          child: TextField(
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                fillColor: Colors.deepOrange[200],
                filled: true,
                hintText: "Search"),
          ),
        ),
        //to be added in future
        // const SizedBox(width: 10.0),
        // Icon(Icons.filter_alt_outlined, color: Colors.deepOrange[500])
      ],
    );
  }
}

class TravelModes extends StatelessWidget {
  TravelModes({Key? key}) : super(key: key);

  List<TravelMode> travelModes = [
    TravelMode(image: ImagePath.places, name: "Places", isSelected: true),
    TravelMode(image: ImagePath.flights, name: "Flights"),
    TravelMode(image: ImagePath.trains, name: "Trains"),
    TravelMode(image: ImagePath.buses, name: "Bus"),
    TravelMode(image: ImagePath.cabs, name: "Cab"),
  ];

  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<TravelBloc>(context);

    return Column(
      children: [
        const SizedBox(height: 30.0),
        BlocBuilder<TravelBloc, TravelState>(
          bloc: _bloc,
          builder: (context, state) {
            return SizedBox(
              height: 70.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: travelModes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: InkWell(
                        onTap: () {
                          travelModes.forEach((element) {
                            element.isSelected = false;
                          });
                          travelModes[index].isSelected = true;
                          _bloc.add(TravelModeSelectedEvent(index));
                        },
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: (travelModes[index].isSelected)
                                  ? Colors.deepOrange
                                  : Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: CircleAvatar(
                                    radius: 20.0,
                                    backgroundImage:
                                        AssetImage(travelModes[index].image)),
                              ),
                            ),
                            // CircleAvatar(
                            //     backgroundImage:
                            //         AssetImage(travelModes[index].image)),
                            const SizedBox(height: 10.0),
                            Text(
                              travelModes[index].name,
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            );
          },
        ),
        const SizedBox(height: 30.0)
      ],
    );
  }
}

// ignore: must_be_immutable
class PlacesUI extends StatelessWidget {
  List<Place> travelPlaces = [
    Place(ImagePath.tajMahal, "Taj Mahal", false),
    Place(ImagePath.paris, "Paris", false),
    Place(ImagePath.shanghai, "Shanghai", false),
  ];

  PlacesUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<SavedItemsBloc>(context);
    return BlocBuilder<TravelBloc, TravelState>(
      builder: (context, state) {
        return Column(
          children: [
            const TestRandomImage(),
            //will be testing this
            // const SizedBox(
            //     child:
            //         Image(image: NetworkImage(ImagePath.randomNetworkImage))),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const TitleText(text: StringConstants.famousPlaces),
                const TitleText(text: StringConstants.viewAll, fontSize: 13.0)
              ],
            ),
            const SizedBox(height: 30.0),
            BlocBuilder<SavedItemsBloc, SavedItemsState>(
              bloc: _bloc,
              builder: (context, state) {
                return SizedBox(
                    height: 230.0,
                    child: ListView.builder(
                      itemCount: travelPlaces.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 200,
                          margin: const EdgeInsets.only(right: 20),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Image.asset(
                                travelPlaces[index].image,
                                fit: BoxFit.scaleDown,
                              ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TitleText(
                                        text: travelPlaces[index].name,
                                        color: Colors.deepOrange),
                                    InkWell(
                                        onTap: () {
                                          travelPlaces[index].isSaved =
                                              !travelPlaces[index].isSaved;
                                          _bloc.add(ListRefreshedEvent());
                                        },
                                        child: Icon(
                                            (travelPlaces[index].isSaved)
                                                ? Icons.bookmark
                                                : Icons.bookmark_add_outlined,
                                            color: Colors.blue))
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ));
              },
            ),
            const SizedBox(height: 100.0)
          ],
        );
      },
    );
  }
}

// ignore: use_key_in_widget_constructors
class FlightsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Column(
        children: [
          const TitleText(
              text: StringConstants.flightsHeader, color: Colors.black),
          const SizedBox(height: 30.0),
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey[500]),
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                      controller: DefaultTabController.of(context),
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.deepOrange),
                      tabs: [
                        const Tab(text: StringConstants.flightsOneWay),
                        const Tab(text: StringConstants.flightsRound),
                        const Tab(text: StringConstants.flightsMulticity)
                      ]),
                  Expanded(
                      child: TabBarView(
                    controller: DefaultTabController.of(context),
                    children: [
                      TripUI(),
                      Container(
                        child: const Text(" round trip view"),
                      ),
                      Container(
                        child: const Text("ulticity view"),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TripUI extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const TitleText(
              text: StringConstants.from, fontSize: 13.0, color: Colors.black),
          const SizedBox(height: 10),
          const CustomTextField(hint: StringConstants.startDestination),
          const SizedBox(height: 20),
          Center(
            child: Image.asset(ImagePath.swap, height: 30, width: 30),
          ),
          const SizedBox(height: 5),
          const TitleText(
              text: StringConstants.to, fontSize: 13.0, color: Colors.black),
          const SizedBox(height: 10),
          const CustomTextField(hint: StringConstants.endDestination),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}

class TestRandomImage extends StatefulWidget {
  const TestRandomImage({Key? key}) : super(key: key);

  @override
  State<TestRandomImage> createState() => _TestcState();
}

class _TestcState extends State<TestRandomImage> {
  late Timer timer;
  ImageProvider<Object> _image =
      const NetworkImage(ImagePath.randomNetworkImage);

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => addValue());
  }

  void addValue() {
    setState(() {
      imageCache.clear();
      imageCache.clearLiveImages();
      _image = _image = const NetworkImage(ImagePath.randomNetworkImage);
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Image(image: _image);
  }
}
