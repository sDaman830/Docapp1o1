import 'package:admin_console/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:admin_console/utils/routes.dart';
import 'models.dart';

class CityListViewWidget extends StatelessWidget {
  
  final VoidCallback deleted;
  const CityListViewWidget({super.key, required this.index, required this.deleted});
  final int index;
  @override
  Widget build(BuildContext context) {
    City city = Utils().cities[index];
    return Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: (context) {
              deleteCity();
            },
            label: 'Delete',
            icon: Icons.delete,
            backgroundColor: Colors.red,
          )
        ]),
        child: Card(
          child: ListTile(
            title: Text(city.cityName),
            subtitle: Text(city.cityPincode),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Utils().selectedCity = Utils().cities[index];
              Navigator.pushNamed(
                context,
                MyRoutes.hospitalDisplayRoute,
              );

//              Navigator.pushNamed(context, MyRoutes.hospitalRoute);
            },
          ),
        ));
  }

  deleteCity() async {
    await Utils().deleteCity(index);
    deleted();
  }
}

class HospitalListViewWidget extends StatefulWidget {
  int index;

  HospitalListViewWidget({Key? key, required this.index}) : super(key: key);

  @override
  _HospitalListViewWidgetState createState() => _HospitalListViewWidgetState();
}

class _HospitalListViewWidgetState extends State<HospitalListViewWidget> {
  @override
  Widget build(BuildContext context) {
    Hospital hospital = Utils().selectedCity!.hospitals![widget.index];
    return Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunctionHospital,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(10),
            )
          ],
        ),
        child: Card(
          child: ListTile(
            title: Text(hospital.hospitalName),
            subtitle: Text(hospital.address),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.hospitalRoute);
            },
          ),
        ));
  }

  // Not able to delete the hospital from the list due to error

  void deleteFunctionHospital(BuildContext context) {
    setState(() {
      if (Utils().selectedCity == null ||
          Utils().selectedCity!.hospitals == null) {
        return;
      }
      Utils().selectedCity!.hospitals!.removeAt(widget.index);
    });
  }
}
