import 'package:flutter/material.dart';

BottomNavigationBarItem getItem(TabOption tab) {
  return BottomNavigationBarItem(
      icon: TabIcon(tab).icon, label: TabOptionLabel(tab).label);
}

enum TabOption { home, bookings, saved, profile }

extension TabOptionLabel on TabOption {
  String get label {
    switch (this) {
      case TabOption.home:
        return "Home";
      case TabOption.bookings:
        return "Bookings";
      case TabOption.saved:
        return "Saved";
      case TabOption.profile:
        return "Profile";
    }
  }
}

extension TabIcon on TabOption {
  Icon get icon {
    switch (this) {
      case TabOption.home:
        return const Icon(Icons.home_outlined);
      case TabOption.bookings:
        return const Icon(Icons.travel_explore);
      case TabOption.saved:
        return const Icon(Icons.bookmark);
      case TabOption.profile:
        return const Icon(Icons.person_outline);
    }
  }
}
