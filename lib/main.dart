import 'package:flutter/material.dart';

import 'heplers/currency_API_heplers.dart';
import 'models/currency.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homepage(),
    ),
  );
}

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  String initialcounteryto = "INR";
  String initialcountryfrom = "USD";

  TextEditingController amountcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Currency Convertor"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: CurrencyAPIHelpers.currencyAPIHelpers.featchcurrencydata(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            print("==========================================");
            print(snapshot.data);
            return Center(
              child: Text("ERROR : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            Currency? data = snapshot.data;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "From:",
                      style: TextStyle(fontSize: 23),
                    ),
                    DropdownButton(
                        value: initialcountryfrom,
                        items: const <DropdownMenuItem>[
                          DropdownMenuItem(
                            value: "INR",
                            child: Text("India"),
                          ),
                          DropdownMenuItem(
                            value: "CNY",
                            child: Text("China"),
                          ),
                          DropdownMenuItem(
                            value: "USD",
                            child: Text("USA"),
                          ),
                          DropdownMenuItem(
                            value: "RUB",
                            child: Text("Russia"),
                          ),
                          DropdownMenuItem(
                            value: "GBP",
                            child: Text("UK"),
                          ),
                        ],
                        onChanged: (val) {
                          setState(() {
                            initialcountryfrom = val;
                            CurrencyAPIHelpers.currencyAPIHelpers.from = val;
                          });
                        })
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "To:",
                      style: TextStyle(fontSize: 23),
                    ),
                    DropdownButton(
                        value: initialcounteryto,
                        items: const <DropdownMenuItem>[
                          DropdownMenuItem(
                            value: "INR",
                            child: Text("India"),
                          ),
                          DropdownMenuItem(
                            value: "CNY",
                            child: Text("China"),
                          ),
                          DropdownMenuItem(
                            value: "USD",
                            child: Text("USA"),
                          ),
                          DropdownMenuItem(
                            value: "RUB",
                            child: Text("Russia"),
                          ),
                          DropdownMenuItem(
                            value: "GBP",
                            child: Text("UK"),
                          ),
                        ],
                        onChanged: (val) {
                          setState(() {
                            initialcounteryto = val;

                            CurrencyAPIHelpers.currencyAPIHelpers.to = val;
                          });
                        }),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    child: TextFormField(
                      controller: amountcontroller,
                      decoration: InputDecoration(hintText: "Enter Amount"),
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        setState(() {
                          CurrencyAPIHelpers.currencyAPIHelpers.value = val;
                        });
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "ToTal Amount:",
                      style: TextStyle(fontSize: 21),
                    ),
                    Text(
                      "${data!.result}",
                      style: TextStyle(fontSize: 21),
                    ),
                  ],
                ),
              ],
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
