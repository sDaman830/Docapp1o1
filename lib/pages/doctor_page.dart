import 'package:admin_console/models/appointments.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class DoctorPaymentPage extends StatefulWidget {
  const DoctorPaymentPage({super.key});

  @override
  State<DoctorPaymentPage> createState() => _DoctorPaymentPageState();
}

class _DoctorPaymentPageState extends State<DoctorPaymentPage> {

  bool _checkAll = false;
  double totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    // height and width of the screen
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width * 0.3,
                    child: Image.asset("assets/images/doctorPlaceholder.png",
                        fit: BoxFit.contain),
                  ),
                  SizedBox(
                    width: width * 0.2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Dr. XYZ"),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      const Text("MBBS, MD"),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      const Text("Specialist"),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      const Text("Experience: 10 years"),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.05,
                child: const Divider(
                  thickness: 2,
                ),
              ),
              SizedBox(
                height: height * 0.5,
                child: ListView.builder(
                  itemCount: CatalogModelAppointments.appointments[1]!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(CatalogModelAppointments
                              .appointments[1]![index].appointmentId),
                          Text("\$" +
                              CatalogModelAppointments
                                  .appointments[1]![index].paymentAmount
                                  .toString()),
                        ],
                      ),
                      value: CatalogModelAppointments
                          .appointments[1]![index].markAsDisbursed,
                      onChanged: (value) {
                        setState(() {
                          for(int i = index; i < CatalogModelAppointments.appointments[1]!.length; i++){
                            CatalogModelAppointments.appointments[1]![i].markAsDisbursed = value!;

                            if(CatalogModelAppointments.appointments[1]![i].markAsDisbursed){
                              totalAmount += CatalogModelAppointments.appointments[1]![i].paymentAmount;
                            }
                            else{
                              totalAmount -= CatalogModelAppointments.appointments[1]![i].paymentAmount;
                            }
                            if(totalAmount < 0){
                              totalAmount = 0;
                            }
                          }
                        });
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: height * 0.05,
                child: const Divider(
                  thickness: 2,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).highlightColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: 
                      ElevatedButton(
                        onPressed: ()=>paymentDisbursed(),
                        child: Text("Disburse \$"+totalAmount.toString()),
                      ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
  
}

paymentDisbursed() {

}
