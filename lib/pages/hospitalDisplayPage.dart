import 'package:admin_console/models/hospitals.dart';
import 'package:admin_console/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../utils/models.dart';
import '../utils/widgets.dart';

class HospitalDisplayPage extends StatefulWidget {
  const HospitalDisplayPage({super.key});

  @override
  State<HospitalDisplayPage> createState() => _HospitalDisplayPageState();
}

class _HospitalDisplayPageState extends State<HospitalDisplayPage> {
  // List of phone numbers
  List<String> phoneNumbers = [];

  int id = 2;

  @override
  void initState() {
    getCity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // controller for hospital name
    final controllerHospitalName = TextEditingController();
    // controller for hospital phone number
    final controllerHospitalPhoneNumber = TextEditingController();
    // controller for hospital address
    final controllerHospitalAddress = TextEditingController();
    // hospital opening Text editing controller
    final controllerHospitalOpeningTime = TextEditingController();
    // hospital closing Text editing controller
    final controllerHospitalClosingTime = TextEditingController();
    //HEIGHT OF THE SCREEN
    double height = MediaQuery.of(context).size.height;
    //width of the screen
    double width = MediaQuery.of(context).size.width;
    // form key
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    // extracting arguments from previous page

    // detecting opening time of hospital
    TimeOfDay? openingTime = TimeOfDay.now();
    // detecting Closing time of hospital
    TimeOfDay? closingTime = TimeOfDay.now();

    return Scaffold(
      appBar: AppBar(
        title: Text(Utils().selectedCity?.cityName ?? 'Hospital Display Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => hospitalAddForm(
          height,
          formKey,
          controllerHospitalName,
          controllerHospitalPhoneNumber,
          controllerHospitalAddress,
          width,
          openingTime,
          closingTime,
          controllerHospitalOpeningTime,
          controllerHospitalClosingTime,
        ),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: Utils().selectedCity?.hospitals?.length ?? 0,
          itemBuilder: (context, index) {
            return HospitalListViewWidget(index: index);
          },
        ),
      ),
    );
  }

// adding hospital in list
  void hospitalAddForm(
    double height,
    GlobalKey<FormState> formKey,
    TextEditingController controllerHospitalName,
    TextEditingController controllerHospitalPhoneNumber,
    TextEditingController controllerHospitalAddress,
    double width,
    TimeOfDay? openingTime,
    TimeOfDay? closingTime,
    TextEditingController controllerHospitalOpeningTime,
    TextEditingController controllerHospitalClosingTime,
  ) {
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
                  "Enter Hospital Details",
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
                  "Hospital Name",
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
                    labelText: 'Hospital Name',
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
                  controller: controllerHospitalName,
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
                TextFieldTags(
                  scrollableTagsPadding: const EdgeInsets.all(6.0),
                  textSeparators: const [
                    " ", //seperate with space
                    ',',
                    ', ',
                    ' ,' //sepearate with comma as well
                  ],
                  onTag: (tag) {
                    phoneNumbers.add(tag);
                    //this will give tag when entered new single tag
                  },
                  onDelete: (tag) {
                    phoneNumbers.remove(tag);
                    //this will give single tag on delete
                  },
                  validator: (tag) {
                    //add validation for tags
                    if (tag.length != 10) {
                      return "Enter valid phone number.";
                    }
                    return null;
                  },
                  tagsStyler: TagsStyler(
                    //styling tag style
                    tagTextStyle:
                        const TextStyle(fontWeight: FontWeight.normal),
                    tagDecoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    tagCancelIcon: const Icon(Icons.cancel, size: 18.0),
                    tagPadding: const EdgeInsets.all(6.0),
                  ),
                  textFieldStyler: TextFieldStyler(
                      //styling tag text field
                      hintText: "use comma or space to seperate phone numbers",
                      textFieldBorder: const OutlineInputBorder(
                          borderSide: BorderSide(width: 2))),
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
                    labelText: 'Hospital  Address',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    return null;
                  },
                  controller: controllerHospitalAddress,
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Text(
                  "Hospital Opening Time",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).bannerTheme.backgroundColor),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                TextFormField(
                  controller: controllerHospitalOpeningTime,
                  decoration: InputDecoration(
                    labelText: 'Opening Time',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () async {
                        final TimeOfDay? picked = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (picked != null) {
                          setState(() {
                            openingTime = picked;
                            controllerHospitalOpeningTime.text =
                                openingTime!.format(context);
                          });
                        }
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Text(
                  "Hospital Closing Time",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).bannerTheme.backgroundColor),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'closing Time',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () async {
                        final TimeOfDay? picked = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (picked != null) {
                          setState(() {
                            closingTime = picked;
                            controllerHospitalClosingTime.text =
                                closingTime!.format(context);
                          });
                        }
                      },
                    ),
                  ),
                  controller: controllerHospitalClosingTime,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                ElevatedButton(
                  onPressed: () => evaluateForm(
                      formKey,
                      controllerHospitalName,
                      controllerHospitalPhoneNumber,
                      controllerHospitalAddress,
                      openingTime,
                      closingTime),
                  child: const Icon(Icons.done),
                )
              ],
            ),
          ),
        );
      },
    );
  }

// evaluating form data and adding widget to list
  void evaluateForm(
      GlobalKey<FormState> formKey,
      TextEditingController controllerHospitalName,
      TextEditingController controllerHospitalPhoneNumber,
      TextEditingController controllerHospitalAddress,
      TimeOfDay? openingTime,
      TimeOfDay? closingTime) {
    if (formKey.currentState!.validate()) {
      setState(() {
        // CatalogModelHospital.hospitals[int.parse(args.cityId)]!.add(Hospital(
        //     hospitalId: id.toString(),
        //     hospitalName: controllerHospitalName.text,
        //     tags: ["Cardio", "others"],
        //     openingTime: openingTime!.format(context).toString(),
        //     closingTime: closingTime!.format(context).toString(),
        //     phone: phoneNumbers,
        //     address: controllerHospitalAddress.text));
      });
      Navigator.pop(context);
      id++;
    }
  }

// deleting widget from list
  deleteTask(int index) {
    setState(() {
      // CatalogModelHospital.hospitals[int.parse(args.cityId)]!.removeAt(index);
    });
  }

  void getCity() async {
    await Utils().getCity(Utils().selectedCity!);
    setState(() {
      
    });
  }
}
