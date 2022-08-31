import 'package:climmate/pages.dart/page2.dart';
import 'package:flutter/material.dart';
import "dart:ui";
import 'package:country_icons/country_icons.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  List<Map<String, dynamic>> data = [
    {
      "sender": "bot",
      "message": const TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: ' Hey, Do you know ',
              style: TextStyle(fontStyle: FontStyle.italic)),
          TextSpan(
              text: 'Carbon Footprint',
              style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(
              text: '  is related for Global Warming!',
              style: TextStyle(fontStyle: FontStyle.italic)),
        ],
      ),
    },
    {
      "sender": "bot",
      "message": const TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: ' Sustainable choices can ',
              style: TextStyle(fontStyle: FontStyle.italic)),
          TextSpan(
              text: 'reduce', style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(
              text: ' your personal footprint and ',
              style: TextStyle(fontStyle: FontStyle.italic)),
          TextSpan(
              text: 'earn you Real Rewards.',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    },
    {
      "sender": "bot",
      "message": const TextSpan(
        children: <TextSpan>[
          TextSpan(
              text:
                  ' So let’s check what your carbon footprint looks like! Answer a few questions and',
              style: TextStyle(fontStyle: FontStyle.italic)),
          TextSpan(
              text: ' see it on the Top.',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/page1.gif"),
            fit: BoxFit.fitHeight,
          )),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 15,
                            ))),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "2:33",
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                        const Center(
                          child: Text(
                            "Tons CO₂e ",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 30,
                      width: 50,
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Later",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w300),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ClipOval(
                  child: Image.asset(
                    'icons/flags/png/in.png',
                    package: 'country_icons',
                    fit: BoxFit.fitHeight,
                    scale: 8,
                  ),
                ),
                Text(
                  " Annual Avg. carbon footprint.",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 10),
                ),
              ]),
              Expanded(
                  child: ListView.builder(
                      reverse: true,
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: ((context, index) {
                        var item = data[data.length - index - 1];
                        return Align(
                          alignment: item["sender"] == ""
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.zero,
                                    bottomRight: Radius.circular(20)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Text.rich(item["message"]),
                              ),
                            ),
                          ),
                        );
                      }))),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Page2()),
                  );
                },
                child: Text(
                  "Let's Start!",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(216, 23, 187, 58),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
