import 'package:flutter/material.dart';
import 'package:random_people/heplers/random_api_heplers.dart';
import 'package:random_people/models/random.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random people"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.grey,
      body: FutureBuilder(
        future: RandomAPIhelpler.randomAPIhelpler.featchAPIData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR :  ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            Random? data = snapshot.data;
            print(data);
            return Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 99),
                      height: 617,
                      width: 360,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50),
                        ),
                        color: Colors.black,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 90),
                          const Text(
                            "Persnoal Detail",
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Name :",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 19),
                              ),
                              Text(
                                "${data!.first} ${data!.last}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 19),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "AGE :",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 19),
                              ),
                              Text(
                                "${data!.age}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 19),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Phone Number :",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 19),
                              ),
                              Text(
                                "${data!.phone}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 19),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Gender :",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 19),
                              ),
                              Text(
                                "${data!.gender}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 19),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Email :",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 19),
                              ),
                            ],
                          ),
                          SizedBox(height: 5, width: 20),
                          Text(
                            "${data!.email}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "City:",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 19),
                              ),
                              Text(
                                "${data!.city}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 19),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Country :",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 19),
                              ),
                              Text(
                                "${data!.country}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 19),
                              ),
                            ],
                          ),
                          SizedBox(height: 50),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                Random? data = snapshot.data;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 130,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "Next",
                                style: TextStyle(fontSize: 19),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          maxRadius: 80,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            maxRadius: 70,
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage("${data?.pic}"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
