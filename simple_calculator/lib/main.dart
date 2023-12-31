// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';

import 'widget/InputField.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final formKey = GlobalKey<FormState>();

  final totalBillController = TextEditingController();
  final totalPercentController = TextEditingController();
  final totalPeopleController = TextEditingController();

  // String? enteredValue = '0.00';

  static const Color containerColor = Color(0xffF5F8FB);
  static const Color textLightColor = Color(0xff717171);
  static const Color textBlackColor = Color(0xff232323);
  static const Color clearButtonColor = Color(0xffFF7511);

  double tipAmount() {
// {double.parse(totalBillController.text)*(double.parse(totalPercentController.text)/100);}
    double billAmount = double.tryParse(totalBillController.text) ?? 0.0;
    double percent = double.tryParse(totalPercentController.text) ?? 0.0;

    return billAmount * (percent / 100);
  }

  double bilAmount() {
    // '\$ ${double.parse(totalBillController.text) + tipAmount()}';
    double billAmount = double.tryParse(totalBillController.text) ?? 0.0;
    // double tipAmount = tipAmount();

    double totalAmount = billAmount + tipAmount();
    // return '\$ ${totalAmount.toStringAsFixed(2)}';
    return totalAmount;
  }

  double perPersonAmount() {
     double totalPerson = double.tryParse(totalPeopleController.text)?? 0;
    double totalAmount = bilAmount() /totalPerson;
    // return '\$ ${totalAmount.toStringAsFixed(2)}';
    return totalAmount;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 252, 249, 249),
          title: Text(
            'Tip calculator',
            style: TextStyle(
                color: const Color.fromARGB(255, 3, 3, 2),
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: SizedBox(
                height: size.height - 125,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: containerColor,
                      ),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Text(
                            'Total bill',
                            style: TextStyle(color: textLightColor),
                          ),
                          Text(
                            // '\$ ${double.parse(totalBillController.text) + tipAmount()}',
                            "\$ ${bilAmount()}",
                            style: TextStyle(
                                color: textBlackColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 30),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total persons',
                                style: TextStyle(color: textLightColor),
                              ),
                              Text(
                                'Tip Amount',
                                style: TextStyle(color: textLightColor),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                totalPeopleController.text,
                                style: TextStyle(
                                    color: textBlackColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20),
                              ),
                              Text(
                                // (double.parse(totalBillController.text) *
                                //         (double.parse(
                                //             totalPercentController.text)))
                                //     as String,

                                '\$ ${tipAmount().toStringAsFixed(2)}',
                                style: TextStyle(
                                    color: textBlackColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: containerColor,
                      ),
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Amount Per Person',
                            style: TextStyle(color: textLightColor),
                          ),
                          Text(
                            // '\$ ${(double.parse(totalBillController.text) / double.parse(totalPeopleController.text))}',
                            '\$ ${perPersonAmount()}',
                            style: TextStyle(
                                color: textBlackColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    // Text(
                    //   "Total Bill",
                    //   style: TextStyle(
                    //       color: textBlackColor,
                    //       fontWeight: FontWeight.w600,
                    //       fontSize: 16),
                    // ),
                    // SizedBox(height: 6),
                    // TextFormField(
                    //   keyboardType: TextInputType.number,
                    //   decoration: InputDecoration(
                    //     filled: true,
                    //     fillColor: containerColor,
                    //     hintText: "Please enter total bill",
                    //     helperStyle: TextStyle(color: textLightColor),
                    //     suffixIcon: Icon(Icons.attach_money),
                    //     enabledBorder: OutlineInputBorder(
                    //       borderSide:
                    //           BorderSide(width: 0, color: Colors.transparent),
                    //       borderRadius: BorderRadius.circular(5),
                    //     ),
                    //   ),
                    //   controller: _textEditingController,
                    //   onFieldSubmitted: (value) {
                    //   if(value.isEmpty){
                    //       _textEditingController.text= '0.00';
                    //   }
                    //     _textEditingController.text= value;
                    //     setState(() {});
                    //   },
                    // ),
                    // Text(
                    //   "Tip percentage",
                    //   style: TextStyle(
                    //       color: textBlackColor,
                    //       fontWeight: FontWeight.w600,
                    //       fontSize: 16),
                    // ),
                    // SizedBox(height: 6),
                    // TextFormField(
                    //   keyboardType: TextInputType.number,
                    //   decoration: InputDecoration(
                    //     filled: true,
                    //     fillColor: containerColor,
                    //     hintText: "Please enter tip percentage",
                    //     helperStyle: TextStyle(color: textLightColor),
                    //     suffixIcon: Icon(Icons.percent),
                    //     enabledBorder: OutlineInputBorder(
                    //       borderSide:
                    //           BorderSide(width: 0, color: Colors.transparent),
                    //       borderRadius: BorderRadius.circular(5),
                    //     ),
                    //   ),
                    //   controller: _textEditingController,
                    // ),
                    // Text(
                    //   "Number of people",
                    //   style: TextStyle(
                    //       color: textBlackColor,
                    //       fontWeight: FontWeight.w600,
                    //       fontSize: 16),
                    // ),
                    // SizedBox(height: 6),
                    // TextFormField(
                    //   keyboardType: TextInputType.number,
                    //   decoration: InputDecoration(
                    //     filled: true,
                    //     fillColor: containerColor,
                    //     hintText: "Please enter number of people",
                    //     helperStyle: TextStyle(color: textLightColor),
                    //     suffixIcon: Icon(Icons.people_rounded),
                    //     enabledBorder: OutlineInputBorder(
                    //       borderSide:
                    //           BorderSide(width: 0, color: Colors.transparent),
                    //       borderRadius: BorderRadius.circular(5),
                    //     ),
                    //   ),
                    //   controller: _textEditingController,
                    // ),
                    InnputField(
                      controller: totalBillController,
                      formTitle: 'Total Bill',
                      formHintTxt: 'Please enter total bill',
                      iconData: Icons.attach_money_rounded,
                    ),

                    SizedBox(
                      height: 7,
                    ),
                    InnputField(
                      controller: totalPercentController,
                      formTitle: 'Tip percentage',
                      formHintTxt: 'Please enter tip percentage',
                      iconData: Icons.percent,
                    ),

                    SizedBox(
                      height: 7,
                    ),
                    InnputField(
                      controller: totalPeopleController,
                      formTitle: 'Number of people',
                      formHintTxt: 'Please enter number of people',
                      iconData: Icons.people_alt_rounded,
                    ),

                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 250,
                          height: 50,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                formKey.currentState!.validate();
                                // enteredValue = totalBillController.text;
                              });
                            },
                            child: Text(
                              "Calculate",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(textBlackColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 110,
                          child: TextButton(
                            onPressed: () {
                              totalBillController.clear();
                              totalPercentController.clear();
                              totalPeopleController.clear();
                            },
                            child: Text(
                              "Clear",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(clearButtonColor),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
