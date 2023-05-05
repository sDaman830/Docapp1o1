import 'dart:convert';
import 'package:flutter/foundation.dart';

class Admin {
  String adminPhone;
  Admin({
    required this.adminPhone,
  });

  Admin copyWith({
    String? adminPhone,
  }) {
    return Admin(
      adminPhone: adminPhone ?? this.adminPhone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'adminPhone': adminPhone,
    };
  }

  factory Admin.fromMap(Map<String, dynamic> map) {
    return Admin(
      adminPhone: map['adminPhone'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Admin.fromJson(String source) => Admin.fromMap(json.decode(source));

  @override
  String toString() => 'Admin(adminPhone: $adminPhone)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Admin && other.adminPhone == adminPhone;
  }

  @override
  int get hashCode => adminPhone.hashCode;
}

class Speciality {
  String specialityId;
  String specialityName;
  Speciality({
    required this.specialityId,
    required this.specialityName,
  });

  Speciality copyWith({
    String? specialityId,
    String? specialityName,
  }) {
    return Speciality(
      specialityId: specialityId ?? this.specialityId,
      specialityName: specialityName ?? this.specialityName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': specialityId,
      'specialityName': specialityName,
    };
  }

  factory Speciality.fromMap(Map<String, dynamic> map) {
    return Speciality(
      specialityId: map['_id'] ?? '',
      specialityName: map['specialityName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Speciality.fromJson(String source) =>
      Speciality.fromMap(json.decode(source));

  @override
  String toString() =>
      'Speciality(specialityId: $specialityId, specialityName: $specialityName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Speciality &&
        other.specialityId == specialityId &&
        other.specialityName == specialityName;
  }

  @override
  int get hashCode => specialityId.hashCode ^ specialityName.hashCode;
}

class Appointment {
  String appointmentId;
  String appointmentDateAndTime;
  Doctor? doctor;
  Hospital? hospital;
  double paymentAmount;
  double serviceCharge;
  String paymentId;
  int tokenNum;
  bool markAsDisbursed;
  Appointment({
    required this.appointmentId,
    required this.appointmentDateAndTime,
    this.doctor,
    this.hospital,
    required this.paymentAmount,
    required this.serviceCharge,
    required this.paymentId,
    required this.tokenNum,
    required this.markAsDisbursed,
  });

  Appointment copyWith({
    String? appointmentId,
    String? appointmentDateAndTime,
    Doctor? doctor,
    Hospital? hospital,
    double? paymentAmount,
    double? serviceCharge,
    String? paymentId,
    int? tokenNum,
    bool? markAsDisbursed,
  }) {
    return Appointment(
      appointmentId: appointmentId ?? this.appointmentId,

      appointmentDateAndTime:
          appointmentDateAndTime ?? this.appointmentDateAndTime,
      doctor: doctor ?? this.doctor,
      hospital: hospital ?? this.hospital,
      paymentAmount: paymentAmount ?? this.paymentAmount,
      serviceCharge: serviceCharge ?? this.serviceCharge,
      paymentId: paymentId ?? this.paymentId,
      tokenNum: tokenNum ?? this.tokenNum,
      markAsDisbursed: markAsDisbursed ?? this.markAsDisbursed,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': appointmentId,
      'appointmentDateAndTime': appointmentDateAndTime,
      'doctor': doctor?.toMap(),
      'hospital': hospital?.toMap(),
      'paymentAmount': paymentAmount,
      'serviceCharge': serviceCharge,
      'paymentId': paymentId,
      'tokenNum': tokenNum,
      'markAsDisbursed': markAsDisbursed,
    };
  }

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(

      appointmentId: map['_id'] ?? '',
      appointmentDateAndTime: map['appointmentDateAndTime'] ?? '',
      doctor: map['doctor'] != null ? Doctor.fromMap(map['doctor']) : null,
      hospital:
          map['hospital'] != null ? Hospital.fromMap(map['hospital']) : null,
      paymentAmount: map['paymentAmount']?.toDouble() ?? 0.0,
      serviceCharge: map['serviceCharge']?.toDouble() ?? 0.0,
      paymentId: map['paymentId'] ?? '',
      tokenNum: map['tokenNum']?.toInt() ?? 0,
      markAsDisbursed: map['markAsDisbursed'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Appointment.fromJson(String source) =>
      Appointment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Appointment(appointmentId: $appointmentId, appointmentDateAndTime: $appointmentDateAndTime, doctor: $doctor, hospital: $hospital, paymentAmount: $paymentAmount, serviceCharge: $serviceCharge, paymentId: $paymentId, tokenNum: $tokenNum, markAsDisbursed: $markAsDisbursed)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Appointment &&
        other.appointmentId == appointmentId &&
        other.appointmentDateAndTime == appointmentDateAndTime &&
        other.doctor == doctor &&
        other.hospital == hospital &&
        other.paymentAmount == paymentAmount &&
        other.serviceCharge == serviceCharge &&
        other.paymentId == paymentId &&
        other.tokenNum == tokenNum &&
        other.markAsDisbursed == markAsDisbursed;

  }

  @override
  int get hashCode {
    return appointmentId.hashCode ^
        appointmentDateAndTime.hashCode ^
        doctor.hashCode ^
        hospital.hashCode ^
        paymentAmount.hashCode ^
        serviceCharge.hashCode ^
        paymentId.hashCode ^
        tokenNum.hashCode ^
        markAsDisbursed.hashCode;
  }
}

class City {
  String cityId;
  String cityName;
  String cityPincode;
  List<Doctor>? doctors;
  List<Hospital>? hospitals;

  
  City({
    this.cityId = "",
    required this.cityName,
    this.cityPincode = "",
    this.doctors,
    this.hospitals,
  });

  City copyWith({

    String? cityId,
    String? cityName,
    String? cityPincode,
    List<Doctor>? doctors,
    List<Hospital>? hospitals,
  }) {
    return City(
      cityId: cityId ?? this.cityId,
      cityName: cityName ?? this.cityName,
      cityPincode: cityPincode ?? this.cityPincode,
      doctors: doctors ?? this.doctors,
      hospitals: hospitals ?? this.hospitals,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': cityId,
      'cityName': cityName,
      'cityPincode': cityPincode,
      'cityDoctors': doctors?.map((x) => x.toMap()).toList(),
      'cityHospitals': hospitals?.map((x) => x.toMap()).toList(),
    };
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      cityId: map['_id'] ?? '',
      cityName: map['cityName'] ?? '',
      cityPincode: map['cityPincode'] ?? '',
      doctors: map['cityDoctors'] != null
          ? List<Doctor>.from(map['cityDoctors']?.map((x) => Doctor.fromMap(x)))
          : null,
      hospitals: map['cityHospitals'] != null
          ? List<Hospital>.from(
              map['cityHospitals']?.map((x) => Hospital.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory City.fromJson(String source) => City.fromMap(json.decode(source));

  @override
  String toString() {
    return 'City(cityId: $cityId, cityName: $cityName, cityPincode: $cityPincode, doctors: $doctors, hospitals: $hospitals)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is City &&
        other.cityId == cityId &&
        other.cityName == cityName &&
        other.cityPincode == cityPincode &&
        listEquals(other.doctors, doctors) &&
        listEquals(other.hospitals, hospitals);
  }

  @override
  int get hashCode {
    return cityId.hashCode ^
        cityName.hashCode ^
        cityPincode.hashCode ^
        doctors.hashCode ^
        hospitals.hashCode;
  }
}

class Doctor {
  String doctorId;
  String doctorName;
  int customersServed;
  List<String> tags;
  List<String> specialities;
  String doctorImage;
  int currentToken;
  int reservedTill;
  bool available;
  Hospital? hospital;
  double fee;
  List<String> doctorPhone;
  List<String> education;
  List<Appointment>? appointments;
  bool onlinePaymentAvailable;
  int experience;
  int views;
  Doctor({

    this.doctorId = "",
    required this.doctorName,
    this.customersServed = 0,
    this.tags = const [],
    this.specialities = const [],
    this.doctorImage = "",
    this.currentToken = 0,
    this.reservedTill = 0,
    this.available = true,
    this.hospital,
    this.fee = 0,
    this.doctorPhone = const [],
    this.education = const [],
    this.appointments,
    this.onlinePaymentAvailable = false,
    this.experience = 1,
    this.views = 0,
  });

  Doctor copyWith({

    String? doctorId,
    String? doctorName,
    int? customersServed,
    List<String>? tags,
    List<String>? specialities,
    String? doctorImage,
    int? currentToken,
    int? reservedTill,
    bool? available,
    Hospital? hospital,
    double? fee,
    List<String>? doctorPhone,
    List<String>? education,
    List<Appointment>? appointments,
    bool? onlinePaymentAvailable,
    int? experience,
    int? views,
  }) {
    return Doctor(
      doctorId: doctorId ?? this.doctorId,
      doctorName: doctorName ?? this.doctorName,
      customersServed: customersServed ?? this.customersServed,
      tags: tags ?? this.tags,
      specialities: specialities ?? this.specialities,
      doctorImage: doctorImage ?? this.doctorImage,
      currentToken: currentToken ?? this.currentToken,
      reservedTill: reservedTill ?? this.reservedTill,
      available: available ?? this.available,
      hospital: hospital ?? this.hospital,
      fee: fee ?? this.fee,
      doctorPhone: doctorPhone ?? this.doctorPhone,
      education: education ?? this.education,
      appointments: appointments ?? this.appointments,
      onlinePaymentAvailable:
          onlinePaymentAvailable ?? this.onlinePaymentAvailable,
      experience: experience ?? this.experience,
      views: views ?? this.views,
    );
  }

  Map<String, dynamic> toMap() {
    return {

      'id': doctorId,
      'doctorName': doctorName,
      'customersServed': customersServed,
      'tags': tags,
      'specialities': specialities,
      'doctorImage': doctorImage,
      'currentToken': currentToken,
      'reservedTill': reservedTill,
      'available': available,
      'hospital': hospital?.toMap(),
      'fee': fee,
      'doctorPhone': doctorPhone,

      'education': education,
      'appointments': appointments?.map((x) => x.toMap()).toList(),
      'onlinePaymentAvailable': onlinePaymentAvailable,
      'experience': experience,
      'views': views,
    };
  }

  factory Doctor.fromMap(Map<String, dynamic> map) {
    return Doctor(
      doctorId: map['_id'] ?? '',
      doctorName: map['doctorName'] ?? '',
      customersServed: map['customersServed']?.toInt() ?? 0,
      tags: List<String>.from(map['tags']),
      specialities: List<String>.from(map['specialities']),
      doctorImage: map['doctorImage'] ?? '',
      currentToken: map['currentToken']?.toInt() ?? 0,
      reservedTill: map['reservedTill']?.toInt() ?? 0,
      available: map['available'] ?? false,
      hospital:
          map['hospital'] != null ? Hospital.fromMap(map['hospital']) : null,
      fee: map['fee']?.toDouble() ?? 0.0,
      doctorPhone: List<String>.from(map['doctorPhone']),
      education: List<String>.from(map['education']),
      appointments: map['appointments'] != null
          ? List<Appointment>.from(
              map['appointments']?.map((x) => Appointment.fromMap(x)))
          : null,
      onlinePaymentAvailable: map['onlinePaymentAvailable'] ?? false,
      experience: map['experience']?.toInt() ?? 0,
      views: map['views']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Doctor.fromJson(String source) => Doctor.fromMap(json.decode(source));

  @override
  String toString() {

    return 'Doctor(doctorId: $doctorId, doctorName: $doctorName, customersServed: $customersServed, tags: $tags, specialities: $specialities, doctorImage: $doctorImage, currentToken: $currentToken, reservedTill: $reservedTill, available: $available, hospital: $hospital, fee: $fee, doctorPhone: $doctorPhone, education: $education, appointments: $appointments, onlinePaymentAvailable: $onlinePaymentAvailable, experience: $experience, views: $views)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Doctor &&
        other.doctorId == doctorId &&
        other.doctorName == doctorName &&
        other.customersServed == customersServed &&
        listEquals(other.tags, tags) &&
        listEquals(other.specialities, specialities) &&
        other.doctorImage == doctorImage &&
        other.currentToken == currentToken &&
        other.reservedTill == reservedTill &&
        other.available == available &&
        other.hospital == hospital &&
        other.fee == fee &&
        listEquals(other.doctorPhone, doctorPhone) &&
        listEquals(other.education, education) &&
        listEquals(other.appointments, appointments) &&
        other.onlinePaymentAvailable == onlinePaymentAvailable &&
        other.experience == experience &&
        other.views == views;
  }

  @override
  int get hashCode {

    return doctorId.hashCode ^
        doctorName.hashCode ^
        customersServed.hashCode ^
        tags.hashCode ^
        specialities.hashCode ^
        doctorImage.hashCode ^
        currentToken.hashCode ^
        reservedTill.hashCode ^
        available.hashCode ^
        hospital.hashCode ^
        fee.hashCode ^
        doctorPhone.hashCode ^
        education.hashCode ^
        appointments.hashCode ^
        onlinePaymentAvailable.hashCode ^
        experience.hashCode ^
        views.hashCode;
  }
}

class Hospital {
  String hospitalId;
  String hospitalName;
  City? city;
  List<String> tags;
  List<Doctor>? doctors;
  String openingTime;
  String closingTime;
  List<String> phone;
  String address;

  Hospital({
    this.hospitalId = "",
    required this.hospitalName,
    this.city,
    this.tags = const [],
    this.doctors,
    this.openingTime = "9:00 AM",
    this.closingTime = "9:00 PM",
    this.phone = const [],
    this.address = "",

  });

  Hospital copyWith({
    String? hospitalId,
    String? hospitalName,
    City? city,
    List<String>? tags,
    List<Doctor>? doctors,
    String? openingTime,
    String? closingTime,
    List<String>? phone,
    String? address,
  }) {
    return Hospital(
      hospitalId: hospitalId ?? this.hospitalId,
      hospitalName: hospitalName ?? this.hospitalName,
      city: city ?? this.city,
      tags: tags ?? this.tags,
      doctors: doctors ?? this.doctors,
      openingTime: openingTime ?? this.openingTime,
      closingTime: closingTime ?? this.closingTime,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': hospitalId,
      'hospitalName': hospitalName,
      'cityId': city?.toMap(),
      'hospitalTags': tags,
      'hospitalDoctors': doctors?.map((x) => x.toMap()).toList(),
      'openingTime': openingTime,
      'closingTime': closingTime,
      'hospitalPhone': phone,
      'hospitalAddress': address,
    };
  }

  factory Hospital.fromMap(Map<String, dynamic> map) {
    return Hospital(
      hospitalId: map['_id'] ?? '',
      hospitalName: map['hospitalName'] ?? '',
      city: map['cityId'] != null ? City.fromMap(map['cityId']) : null,
      tags: List<String>.from(map['hospitalTags']),
      doctors: map['hospitalDoctors'] != null
          ? List<Doctor>.from(map['hospitalDoctors']?.map((x) => Doctor.fromMap(x)))
          : null,
      openingTime: map['openingTime'] ?? '',
      closingTime: map['closingTime'] ?? '',
      phone: List<String>.from(map['hospitalPhone']),
      address: map['hospitalAddress'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Hospital.fromJson(String source) =>
      Hospital.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Hospital(hospitalName: $hospitalName, city: $city, tags: $tags, doctors: $doctors, openingTime: $openingTime, closingTime: $closingTime, phone: $phone, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Hospital &&
        other.hospitalName == hospitalName &&
        other.city == city &&
        listEquals(other.tags, tags) &&
        listEquals(other.doctors, doctors) &&
        other.openingTime == openingTime &&
        other.closingTime == closingTime &&
        listEquals(other.phone, phone) &&
        other.address == address;

  }

  @override
  int get hashCode {
    return hospitalName.hashCode ^

        city.hashCode ^
        tags.hashCode ^
        doctors.hashCode ^
        openingTime.hashCode ^
        closingTime.hashCode ^
        phone.hashCode ^
        address.hashCode;
  }
}

