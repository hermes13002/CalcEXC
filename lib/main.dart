// import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
// import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(),
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double num1 = 0.0;
  double num2 = 0.0;
  var input = '';
  var output = '';
  var operation = '';
  var outputSize = 32.0;

  _buttonPressed(value) {
    if (value == "AC") {
      input = '';
      output = '';
    } else if (value == "C") {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == "=") {
      if (input.isNotEmpty) {
        var userinput = input;
        userinput = input.replaceAll("", "");
        Parser P = Parser();
        Expression expression = P.parse(userinput);
        ContextModel cm = ContextModel();
        var finalvalue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalvalue.toString();
        if (output.endsWith(".0")) {
          output = output.substring(0, output.length - 2);
        }
      }
    } else {
      input = input + value;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Calculator'),
      //   backgroundColor: Colors.red,
      // ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: PopupMenuButton(
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(value: 0, child: Text('Contact Me')),
                ];
              },
              onSelected: (value) {
                if (value == 0) {
                  contactButton(context);
                }
              },
            ),
          ),
          Container(
            // color: const Color.fromARGB(255, 206, 206, 209),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              input,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            // color: const Color.fromARGB(255, 206, 206, 209),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              output,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            // color: const Color.fromARGB(255, 236, 126, 255),
            color: Colors.purpleAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 75,
                    height: 75,
                    child: customButton(
                        'ln', Colors.black, Colors.black, Colors.transparent)),
                SizedBox(
                    width: 75,
                    height: 75,
                    child: customButton(
                        'log', Colors.black, Colors.black, Colors.transparent)),
                SizedBox(
                    width: 75,
                    height: 75,
                    child: customButton(
                        'sin', Colors.black, Colors.black, Colors.transparent)),
                SizedBox(
                    width: 75,
                    height: 75,
                    child: customButton(
                        'cos', Colors.black, Colors.black, Colors.transparent)),
                SizedBox(
                    width: 75,
                    height: 75,
                    child: customButton(
                        'tan', Colors.black, Colors.black, Colors.transparent)),
              ],
            ),
          ),
          Container(
            // color: const Color.fromARGB(255, 236, 126, 255),
            color: Colors.purpleAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 75,
                    height: 75,
                    child: customButton(
                        '^', Colors.black, Colors.black, Colors.transparent)),
                SizedBox(
                    width: 75,
                    height: 75,
                    child: customButton('^0.5', Colors.black, Colors.black,
                        Colors.transparent)),
                SizedBox(
                    width: 75,
                    height: 75,
                    child: customButton(
                        'e^', Colors.black, Colors.black, Colors.transparent)),
                SizedBox(
                    width: 75,
                    height: 75,
                    child: customButton(
                        '(', Colors.black, Colors.black, Colors.transparent)),
                SizedBox(
                    width: 75,
                    height: 75,
                    child: customButton(
                        ')', Colors.black, Colors.black, Colors.transparent)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 75,
                    height: 75,
                    child: customButton(
                        '7', Colors.black, Colors.white, Colors.transparent)),
                SizedBox(
                    width: 75,
                    height: 75,
                    child: customButton(
                        '8', Colors.black, Colors.white, Colors.transparent)),
                SizedBox(
                    width: 75,
                    height: 75,
                    child: customButton(
                        '9', Colors.black, Colors.white, Colors.transparent)),
                SizedBox(
                    width: 75,
                    height: 75,
                    child: customButton(
                        'C', Colors.black, Colors.yellow, Colors.transparent)),
                SizedBox(
                    width: 75,
                    height: 75,
                    child: customButton(
                        'AC', Colors.black, Colors.red, Colors.transparent)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 75,
                    height: 75,
                    child: customButton(
                        '4', Colors.black, Colors.white, Colors.transparent)),
                SizedBox(
                    width: 75,
                    height: 75,
                    child: customButton(
                        '5', Colors.black, Colors.white, Colors.transparent)),
                SizedBox(
                    width: 75,
                    height: 75,
                    child: customButton(
                        '6', Colors.black, Colors.white, Colors.transparent)),
                SizedBox(
                    width: 75,
                    height: 75,
                    child: customButton('/', Colors.black, Colors.purpleAccent,
                        Colors.transparent)),
                SizedBox(
                    width: 75,
                    height: 75,
                    child: customButton('*', Colors.black, Colors.purpleAccent,
                        Colors.transparent)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 75,
                    height: 75,
                    child: customButton(
                        '1', Colors.black, Colors.white, Colors.transparent)),
                SizedBox(
                    width: 75,
                    height: 75,
                    child: customButton(
                        '2', Colors.black, Colors.white, Colors.transparent)),
                SizedBox(
                    width: 75,
                    height: 75,
                    child: customButton(
                        '3', Colors.black, Colors.white, Colors.transparent)),
                SizedBox(
                    width: 75,
                    height: 75,
                    child: customButton('-', Colors.black, Colors.purpleAccent,
                        Colors.transparent)),
                SizedBox(
                    width: 75,
                    height: 75,
                    child: customButton('+', Colors.black, Colors.purpleAccent,
                        Colors.transparent)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 75,
                    height: 75,
                    child: customButton('.', Colors.black, Colors.purpleAccent,
                        Colors.transparent)),
                SizedBox(
                    width: 75,
                    height: 75,
                    child: customButton(
                        '0', Colors.black, Colors.white, Colors.transparent)),
                SizedBox(
                    width: 75,
                    height: 75,
                    child: customButton('', Colors.black, Colors.purpleAccent,
                        Colors.transparent)),
                SizedBox(
                    width: 75,
                    height: 75,
                    child: customButton(
                        '', Colors.black, Colors.white, Colors.transparent)),
                SizedBox(
                    width: 75,
                    height: 75,
                    child: customButton(
                        '=', Colors.black, Colors.black, Colors.purpleAccent)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customButton(text, color, tcolor, bkcolor) {
    return TextButton(
      onPressed: () => _buttonPressed(text),
      style: TextButton.styleFrom(
          side: const BorderSide(color: Colors.transparent),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: bkcolor),
      child: Text(text,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w800, color: tcolor)),
    );
  }

  // The method for the link to whatsapp feature
  _launchWhatsapp() async {
    var contact = "+2347050250008";
    var androidUrl = "whatsapp://send?phone=$contact&text=Hi there";
    var iosUrl = "https://wa.me/$contact?text=${Uri.parse('Hi there. ')}";

    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception {
      EasyLoading.showError('WhatsApp is not installed.');
    }
  }

  // The method for contact button bottom sheet
  Future contactButton(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.web),
                title: const Text('Whatsapp'),
                onTap: () {
                  _launchWhatsapp();
                },
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text('Gmail'),
                onTap: () async {
                  String? encodeQueryParameters(Map<String, String> params) {
                    params.entries
                        .map((MapEntry<String, String> e) =>
                            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                        .join('&');
                    // return null;
                  }

                  final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'soaresayoigbala@gmail.com',
                      query: encodeQueryParameters(
                          <String, String>{'Contact': 'Hi there!'}));

                  // if (await launchUrl(emailLaunchUri)) {
                  //   launchUrl(emailLaunchUri);
                  // } else {
                  //   throw Exception('Could not launch $emailLaunchUri');
                  // }

                  try {
                    await launchUrl(emailLaunchUri);
                  } catch (e) {
                    print(e.toString());
                  }
                },
              )
            ],
          );
        });
  }
}
