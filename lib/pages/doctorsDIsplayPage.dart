import 'package:admin_console/models/doctors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/models.dart';
import '../utils/widgets.dart';

class DoctorDisplay extends StatefulWidget {
  const DoctorDisplay({super.key});

  @override
  State<DoctorDisplay> createState() => _DoctorDisplayState();
}

class _DoctorDisplayState extends State<DoctorDisplay> {
  int id = 2;
  @override
  Widget build(BuildContext context) {
    // controller for hospital name
    final controllerDoctorName = TextEditingController();
    // controller for hospital phone number
    final controllerDoctorPhoneNumber = TextEditingController();
    final controllerDoctorEducation = TextEditingController();
    //HEIGHT OF THE SCREEN
    double height = MediaQuery.of(context).size.height;
    // form key
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospital Display Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => hospitalAddForm(
            height,
            formKey,
            controllerDoctorName,
            controllerDoctorPhoneNumber,
            controllerDoctorEducation),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: CatalogModelDoctor.doctor.length,
          itemBuilder: (context, index) {
            return HospitalListViewWidget(
              index: index
            );
          },
        ),
      ),
      
    );
  }
  
  void hospitalAddForm(
      double height,
      GlobalKey<FormState> formKey,
      TextEditingController controllerDoctorName,
      TextEditingController controllerDoctorPhoneNumber,
      TextEditingController controllerDoctorEducation) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          //
          padding: const EdgeInsets.all(32),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter Doctor Details",
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
                  "Doctor Name",
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
                    labelText: 'Doctor Name',
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
                  controller: controllerDoctorName,
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Text(
                  "Hospital Phone Number",
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
                    labelText: 'Doctor phone number',
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
                    if (value.length != 10) {
                      return 'Please enter valid phone number';
                    }
                    return null;
                  },
                  controller: controllerDoctorPhoneNumber,
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Text(
                  "Hospital Address",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).bannerTheme.backgroundColor),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Doctor Education',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: controllerDoctorEducation,
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                ElevatedButton(
                  onPressed: () => evaluateForm(
                      formKey,
                      controllerDoctorName,
                      controllerDoctorPhoneNumber,
                      controllerDoctorEducation),
                  child: Icon(Icons.done),
                )
              ],
            ),
          ),
        );
      },
    );
  }
  void evaluateForm(
      GlobalKey<FormState> formKey,
      TextEditingController controllerDoctorName,
      TextEditingController controllerDoctorPhoneNumber,
      TextEditingController controllerDoctorEducation) {
    if (formKey.currentState!.validate()) {
      setState(() {
        
            
            
      });
      Navigator.pop(context);
      id++;
    }
  }
  deleteTask(int index) {
    setState(() {
      CatalogModelDoctor.doctor.removeAt(index);
    });
  }



}

