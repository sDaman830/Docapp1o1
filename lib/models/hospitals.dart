import 'package:admin_console/utils/models.dart';

class CatalogModelHospital {
  static final hospitals = {
    1: [
      Hospital(
          hospitalId: "1",
          hospitalName: "Fortis",
          tags: ["cardio", "other"],
          openingTime: "9:00 AM",
          closingTime: "9:00 PM",
          phone: ["7087403779"],
          address: "Ludhiana"),
      Hospital(
          hospitalId: "2",
          hospitalName: "Fortis",
          tags: ["cardio", "other"],
          openingTime: "9:00 AM",
          closingTime: "9:00 PM",
          phone: ["7087403779"],
          address: "Ludhiana"),
    ],
    2: [
      Hospital(
          hospitalId: "1",
          hospitalName: "Max",
          tags: ["cardio", "other"],
          openingTime: "9:00 AM",
          closingTime: "9:00 PM",
          phone: ["7087403779"],
          address: "ferozpur"),
      Hospital(
          hospitalId: "2",
          hospitalName: "Max2",
          tags: ["cardio", "other"],
          openingTime: "9:00 AM",
          closingTime: "9:00 PM",
          phone: ["7087403779"],
          address: "ferozpur"),
    ]
  };
}
