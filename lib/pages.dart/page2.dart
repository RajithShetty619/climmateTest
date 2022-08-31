import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  List<Map<String, dynamic>> data = [
    {
      "sender": "bot",
      "message": Row(
        children: [
          const Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'Do you own a vehicle?',
                    style: TextStyle(fontStyle: FontStyle.italic)),
              ],
            ),
          ),
          SizedBox(
            width: 30,
          )
        ],
      )
    },
    {
      "sender": "user",
      "message": Column(
        children: [
          Row(
            children: [
              RoundCheckBox(
                onTap: (selected) {},
                size: 10,
              ),
              const Text("  ⛽ Petrol/Diesel/Hybrid")
            ],
          ),
          Divider(),
          Row(
            children: [
              RoundCheckBox(
                onTap: (selected) {},
                size: 10,
              ),
              const Text("  💨 Natural Gas")
            ],
          ),
          const Divider(),
          Row(
            children: [
              RoundCheckBox(
                onTap: (selected) {},
                size: 10,
              ),
              const Text("  🔌 Electric")
            ],
          ),
          const Divider(),
          Row(
            children: [
              RoundCheckBox(
                onTap: (selected) {},
                size: 10,
              ),
              const Text("  😜I don’t have a driving license")
            ],
          ),
        ],
      )
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/page2.gif"),
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
                          "0.00",
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
                      width: 30,
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: const CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.close,
                            color: Colors.black,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      reverse: true,
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: ((context, index) {
                        var item = data[data.length - index - 1];
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (item["sender"] == "user")
                              SizedBox(
                                width: 20,
                              ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Align(
                                alignment: item["sender"] != "user"
                                    ? Alignment.centerLeft
                                    : Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: const Radius.circular(20),
                                          topRight: const Radius.circular(20),
                                          bottomLeft: item["sender"] == "user"
                                              ? Radius.circular(20)
                                              : Radius.zero,
                                          bottomRight: item["sender"] != "user"
                                              ? Radius.circular(20)
                                              : Radius.zero,
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: item["message"],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (item["sender"] != "user")
                              const SizedBox(
                                width: 20,
                              ),
                          ],
                        );
                      }))),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "      Next     ",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(218, 23, 187, 58),
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
