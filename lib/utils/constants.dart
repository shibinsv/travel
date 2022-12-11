import 'package:flutter/material.dart';

class StringConstants {
  static const String appName = "Initial";

  //login
  static const String enterNumber = "Enter phone number(Without country code)";
  static const String enterPassword = "Enter password";
  static const String login = "Login";

  //dashboard
  static const String famousPlaces = "Famous places";
  static const String viewAll = "View all";

    //flights
  static const String flightsHeader = "Book your flights";
  static const String flightsOneWay = "One way";
  static const String flightsRound = "Round trip";
  static const String flightsMulticity = "Multicity";

}

class AppColors {
  // static const Color appColor = Color(0xff2FC3C5);
  static const Color appColor = Colors.deepOrange;
}

class ImagePath {
  static const String imagePath = "assets/images/";
  static const String pathExtension = '.jpg';
  static const String randomNetworkImage = "https://picsum.photos/500/300";

  static const String logo = "${imagePath}logo_oo$pathExtension";

  static const String places = "${imagePath}places$pathExtension";
  static const String flights = "${imagePath}flights$pathExtension";
  static const String trains = "${imagePath}trains$pathExtension";
  static const String buses = "${imagePath}buses$pathExtension";
  static const String cabs = "${imagePath}taxies$pathExtension";

  //places
  // static const String tajMahal = "${imagePath}place_taj_mahal$pathExtension";
  static const String tajMahal = "${imagePath}place_taj_mahal$pathExtension";
  static const String paris = "${imagePath}place_paris$pathExtension";
  static const String shanghai = "${imagePath}place_shan$pathExtension";

}

class LoginFunctions {
  static String passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password should be atleast 6 characters ';
    } else if (value.length > 20) {
      return "Password should not be greater than 20 characters";
    }
    return "";
  }

  static String numberValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Number is required';
    } else if (value.length > 10) {
      return "Limit is 10";
    }
    return "";
  }

  static bool isInputsValid(String number, String password) {
    if (passwordValidation(password).isEmpty &&
        numberValidation(number).isEmpty) {
      return true;
    }
    return false;
  }
}
