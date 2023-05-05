import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../utils/models.dart';
import '../utils/utils.dart';
import '../utils/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _controllerCityName = TextEditingController();
  final _controllerCityPincode = TextEditingController();

  @override
  void initState() {
    getCities();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // print(Utils().cities.length);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(title: const Text("Home")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: Utils().cities.length,
            itemBuilder: (context, index) {
              return CityListViewWidget(index: index, deleted: reload);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              cityAddForm(height, _controllerCityName, _controllerCityPincode),
          child: const Icon(Icons.add),
        ),
        drawer: const Drawer());
  }

  void cityAddForm(double height, TextEditingController controllerCityName,
      TextEditingController controllerCityPincode) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          //
          padding: const EdgeInsets.all(32),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create a city",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).bannerTheme.backgroundColor,
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Text(
                  "City Name",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).bannerTheme.backgroundColor,
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter City Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r"\s"))
                  ],
                  controller: controllerCityName,
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Text(
                  "City PinCode",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).bannerTheme.backgroundColor,
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'City pin-code',
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    if (value.length != 6) {
                      return 'Please enter valid pin code';
                    }
                    return null;
                  },
                  controller: controllerCityPincode,
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                ElevatedButton(
                  onPressed: () => evaluateForm(
                      _formKey, controllerCityName, controllerCityPincode),
                  child: const Icon(Icons.done),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  evaluateForm(GlobalKey<FormState> formKey, controllerHospitalName,
      controllerHospitalPhoneNumber) async {
    if (_formKey.currentState!.validate()) {
      City city = City(
          cityName: controllerHospitalName.text,
          cityPincode: controllerHospitalPhoneNumber.text);
      await Utils().createCity(city);

      setState(() {});
      if (mounted) {
        Utils().showSnackbar(context);
        Navigator.pop(context);
      }
    }
  }

  void getCities() async {
    await Utils().getCities();
    // Utils().showSnackbar(context);
    setState(() {
      print(Utils().cities);
    });
  }

  void reload() {
    setState(() {});
  }
}
