import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: "Method Channel"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _counter1 = "";
  static const platform = MethodChannel('example.com/channel');
  Future<void> _generateRandomString() async {
    String random = '';
    try {
      var arguments = {
        'len': 3,
        'prefix': 'fl_',
      };
      random = await platform.invokeMethod('getRandomString', arguments);
      print(random.runtimeType);
    } on PlatformException catch (e) {
      random = '';
    }
    setState(() {
      _counter1 = random;
    });
  }

  // static const platform = MethodChannel('example.com/channel');
  Future<void> _generateRandomNumber() async {
    int random;
    try {
      random = await platform.invokeMethod('getRandomNumber');
    } on PlatformException catch (e) {
      random = 0;
    }
    setState(() {
      _counter = random;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Kotlin generates the following number:',
            ),
            Text(
              '$_counter1',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _generateRandomString,
        tooltip: 'Generate',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class MyDesign extends StatelessWidget {
  const MyDesign({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Design"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                color: Colors.orange,
                width: double.infinity,
                child: const Text(
                  "Sudhanshu shaurya",
                  textAlign: TextAlign.center,
                )),
          ),
          Row(
            children: const [
              Expanded(child: Center(child: Text("Text1"))),
              Expanded(child: Center(child: Text("Text2"))),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Expanded(
                  child: Text("R1"),
                ),
                Expanded(
                  child: Text("R2"),
                ),
                Expanded(
                  child: Text("R3"),
                ),
                Expanded(
                  child: Text("R4"),
                ),
                Expanded(
                  child: Text("R5"),
                )
              ],
            ),
          ),
          TextButton(onPressed: () {}, child: const Text("Click Button")),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child:
                      Container(color: Colors.blueAccent, child: Text("20%"))),
              Expanded(
                  flex: 4,
                  child: Container(color: Colors.grey, child: Text("80%"))),
            ],
          ),
          SizedBox(
            height: 350,
            width: width,
            child: Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png",
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
