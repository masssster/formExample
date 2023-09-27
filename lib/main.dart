import 'package:flutter/material.dart';

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// Dynamic Form Example
class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});
  final String title;
  List<String> listData = [];
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    String data = "";
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(3)),
            padding: const EdgeInsets.all(10),
            width: 400,
            height: 400,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Title
                  Text(
                    "Form Example",
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: widget.listData.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: 350,
                          child: Row(
                            children: [
                              SizedBox(
                                height: 50,
                                width: 300,
                                child: TextFormField(
                                  onSaved: (newValue) {
                                    setState(() {
                                      widget.listData[index] = newValue ?? "";
                                    });
                                  },
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.close),
                                iconSize: 30,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          widget.listData.add("");
                        });
                      },
                      child: Text("Add Data")),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        formKey.currentState!.save();
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return MyHomePage2(
                            title: "Display Form Content",
                            data: widget.listData,
                          );
                        }));
                      },
                      child: Text("Submit")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyHomePage2 extends StatefulWidget {
  MyHomePage2({super.key, required this.title, required this.data});
  final String title;
  List<String> data;
  @override
  State<MyHomePage2> createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: SizedBox(
              height: 600,
              width: 600,
              child: ListView.builder(
                  itemCount: widget.data.length,
                  itemBuilder: (context, index) {
                    return Text(
                      widget.data[index],
                      style: TextStyle(fontSize: 36),
                    );
                  }))),
    );
  }
}

/* Form Example
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    String data = "";
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(3)),
            padding: const EdgeInsets.all(10),
            width: 400,
            height: 400,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Form Example",
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          onSaved: (newValue) {
                            setState(() {
                              data = newValue ?? "";
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        formKey.currentState!.save();
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return MyHomePage2(title: data);
                        }));
                      },
                      child: Text("Submit")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage2> createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(3)),
          padding: const EdgeInsets.all(10),
          width: 400,
          height: 400,
          child: Text(
            widget.title,
            style: TextStyle(fontSize: 72),
          ),
        ),
      ),
    );
  }
}
*/