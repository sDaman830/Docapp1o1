import 'package:admin_console/utils/api.dart';
import 'package:flutter/material.dart';

import 'models.dart';

class Utils {
  // singleton class
  static final Utils _instance = Utils._internal();
  factory Utils() => _instance;
  Utils._internal();

  List<City> cities = List.empty(growable: true);
  City? selectedCity;
  Hospital? selectedHospital;
  Color? messageColor;
  String? message;

  showSnackbar(BuildContext context) {
    if (message == null) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message!),
      backgroundColor: messageColor,
    ));
    message = null;
  }

  Future<void> getCities() async {
    var value = await API().getCities();
    if (value['statusCode'] != 200) {
      messageColor = Colors.red;
      message = value['message'];
    } else {
      cities.clear();
      for (var city in value['body']) {
        city['cityHospitals'] = [];
        city['cityDoctors'] = [];
        // print(City.fromMap(city));
        cities.add(City.fromMap(city));
      }
      // print(cities.length);
      messageColor = Colors.green;
      message = value['message'];
    }
  }

  Future<void> createCity(City city) async {
    var value = await API().createCity(city);
    if (value['statusCode'] != 200) {
      messageColor = Colors.red;
      message = value['message'];
    } else {
      cities.add(City.fromMap(value['body']));
      messageColor = Colors.green;
      message = value['message'];
    }
  }

  Future<void> deleteCity(int index) async {
    var res = await API().deleteCity(cities[index]);
    if (res['statusCode'] != 200) {
      messageColor = Colors.red;
      message = res['message'];
    } else {
      cities.removeAt(index);
      messageColor = Colors.green;
      message = res['message'];
    }
  }

  Future<void> getCity(City city) async {
    var res = await API().getCity(city);
    if (res['statusCode'] != 200) {
      messageColor = Colors.red;
      message = res['message'];
    } else {
      res['body']['cityDoctors'] = [];
      selectedCity = City.fromMap(res['body']);
      messageColor = Colors.green;
      message = res['message'];
    }
  }

  Future<void> createHospital(City city, Hospital hospital) async {
    var res = await API().createHospital(city, hospital);
    if (res['statusCode'] != 200) {
      messageColor = Colors.red;
      message = res['message'];
    } else {
      selectedCity!.hospitals!.add(Hospital.fromMap(res['body']));
      messageColor = Colors.green;
      message = res['message'];
    }
  }
}
