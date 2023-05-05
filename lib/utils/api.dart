import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart';

class API {
  // create this class singelton
  static final API _instance = API._internal();
  factory API() => _instance;
  API._internal();

  String BASE_URL = "http://156.67.208.158:3000/admin";

  Future<dynamic> getHeader([String? password]) async {
    // var user = await Util.getUser();
    // var sessionId = user['sessionId'] ?? "";
    // String credentials = "";
    // if (password != null) {
    //   credentials = "RET${user['username']}:$password";
    // }
    // else{
    //   credentials = "RET${user['username']}:$sessionId";
    // }

    // String encoded = base64.encode(utf8.encode(credentials));

    dynamic header = {
      // 'Authorization': 'Basic $encoded',
      // 'Cookie': 'sessionid=$sessionId',
      'Content-Type': 'application/json'
    };
    return header;
  }

  dynamic handleResponse(dynamic res) {
    try {
      if (res.statusCode != 500) {
        print(res.body);
        var jsonResponse = jsonDecode(res.body);
        // print(jsonResponse);
        jsonResponse['statusCode'] = res.statusCode;

        return jsonResponse;
      } else {
        return {
          'statusCode': 500,
          'message': 'Internal Server Error',
          'body': {}
        };
      }
    } catch (e) {
      print(e);
      return {'statusCode': 500, 'message': 'Server not available', 'body': {}};
    }
  }

  Future<dynamic> createCity(City city) async {
    var url = "$BASE_URL/city";
    // var user = await Util.getUser();
    try {
      var res = await http.post(Uri.parse(url),
          headers: await getHeader(), body: city.toJson());
      return handleResponse(res);
    } catch (e) {
      print(e);
      return {'statusCode': 500, 'message': 'Server not available', 'body': {}};
    }
  }

  Future<dynamic> getCities() async {
    var url = "$BASE_URL/city";
    try {
      var res = await http.get(Uri.parse(url));
      return handleResponse(res);
    } catch (e) {
      print(e);
      return {'statusCode': 500, 'message': 'Server not available', 'body': {}};
    }
  }

  Future<dynamic> getCity(City city) async {
    var url = "$BASE_URL/city/${city.cityId}";
    try {
      var res = await http.get(Uri.parse(url));
      return handleResponse(res);
    } catch (e) {
      print(e);
      return {'statusCode': 500, 'message': 'Server not available', 'body': {}};
    }
  }

  // delete city
  Future<dynamic> deleteCity(City city) async {
    var url = "$BASE_URL/city/${city.cityId}";
    try {
      var res = await http.delete(Uri.parse(url));
      return handleResponse(res);
    } catch (e) {
      print(e);
      return {'statusCode': 500, 'message': 'Server not available', 'body': {}};
    }
  }

  // create hospital
  Future<dynamic> createHospital(City city, Hospital hospital) async {
    var url = "$BASE_URL/city/${city.cityId}/hospital";
    try {
      var res = await http.post(Uri.parse(url), body: hospital.toJson());
      return handleResponse(res);
    } catch (e) {
      print(e);
      return {'statusCode': 500, 'message': 'Server not available', 'body': {}};
    }
  }

  // get hospital
  Future<dynamic> getHospital(City city, Hospital hospital) async {
    var url = "$BASE_URL/city/${city.cityId}/hospital/${hospital.hospitalId}";
    try {
      var res = await http.get(Uri.parse(url));
      return handleResponse(res);
    } catch (e) {
      print(e);
      return {'statusCode': 500, 'message': 'Server not available', 'body': {}};
    }
  }

  // delete hospital
  Future<dynamic> deleteHospital(City city, Hospital hospital) async {
    var url = "$BASE_URL/city/${city.cityId}/hospital/${hospital.hospitalId}";
    try {
      var res = await http.delete(Uri.parse(url));
      return handleResponse(res);
    } catch (e) {
      print(e);
      return {'statusCode': 500, 'message': 'Server not available', 'body': {}};
    }
  }

  // edit hospital
  Future<dynamic> editHospital(City city, Hospital hospital) async {
    var url = "$BASE_URL/city/${city.cityId}/hospital/${hospital.hospitalId}";
    try {
      var res = await http.put(Uri.parse(url), body: hospital.toJson());
      return handleResponse(res);
    } catch (e) {
      print(e);
      return {'statusCode': 500, 'message': 'Server not available', 'body': {}};
    }
  }

  // create doctor
  Future<dynamic> createDoctor(
      City city, Hospital hospital, Doctor doctor) async {
    var url =
        "$BASE_URL/city/${city.cityId}/hospital/${hospital.hospitalId}/doctor";
    try {
      var res = await http.post(Uri.parse(url), body: doctor.toJson());
      return handleResponse(res);
    } catch (e) {
      print(e);
      return {'statusCode': 500, 'message': 'Server not available', 'body': {}};
    }
  }

  // get, update and delete doctor
  Future<dynamic> getDoctor(City city, Hospital hospital, Doctor doctor) async {
    var url =
        "$BASE_URL/city/${city.cityId}/hospital/${hospital.hospitalId}/doctor/${doctor.doctorId}";
    try {
      var res = await http.get(Uri.parse(url));
      return handleResponse(res);
    } catch (e) {
      print(e);
      return {'statusCode': 500, 'message': 'Server not available', 'body': {}};
    }
  }

  Future<dynamic> deleteDoctor(
      City city, Hospital hospital, Doctor doctor) async {
    var url =
        "$BASE_URL/city/${city.cityId}/hospital/${hospital.hospitalId}/doctor/${doctor.doctorId}";
    try {
      var res = await http.delete(Uri.parse(url));
      return handleResponse(res);
    } catch (e) {
      print(e);
      return {'statusCode': 500, 'message': 'Server not available', 'body': {}};
    }
  }

  Future<dynamic> editDoctor(
      City city, Hospital hospital, Doctor doctor) async {
    var url =
        "$BASE_URL/city/${city.cityId}/hospital/${hospital.hospitalId}/doctor/${doctor.doctorId}";
    try {
      var res = await http.put(Uri.parse(url), body: doctor.toJson());
      return handleResponse(res);
    } catch (e) {
      print(e);
      return {'statusCode': 500, 'message': 'Server not available', 'body': {}};
    }
  }

  // update appointments of a doctor
  Future<dynamic> updateAppointments(City city, Hospital hospital,
      Doctor doctor, List<Appointment> appointments) async {
    var url =
        "$BASE_URL/city/${city.cityId}/hospital/${hospital.hospitalId}/doctor/${doctor.doctorId}/appointments";
    try {
      var res = await http.put(Uri.parse(url), body: jsonEncode(appointments));
      return handleResponse(res);
    } catch (e) {
      print(e);
      return {'statusCode': 500, 'message': 'Server not available', 'body': {}};
    }
  }
}
