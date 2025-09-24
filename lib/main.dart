import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Rocket Launch Controller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // A widget that will be started on the application startup
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  //set counter value
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rocket Launch Controller'),
      ),
//set up the widget alignement
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: _counter == 100
                  ? Column(
                      children: [
                        Image.network(
                          'https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExM2FqaWJkYnNkeXhhZmo4Y3Q3NTFyeGh3Z3puZ3hmYnl3OWl4N2plcSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9cw/5G1VDKTWdvuVFa3TaM/giphy.gif',
                          height: 200,
                        ),
                        Text(
                          'LIFTOFF!',
                          style: TextStyle(fontSize: 50.0, color: Colors.blue),
                        ),
                      ],
                    )
                  : Text(
                      '$_counter',
                      style: TextStyle(fontSize: 50.0),
                    ),
            ),
          ),
          Slider(
            min: 0,
            max: 100,
            value: _counter.toDouble(),
            onChanged: (double value) {
              setState(() {
                _counter = value.toInt();
              });
            },
            activeColor: Colors.blue,
            inactiveColor: Colors.red,
          ),
          // reset button
          ElevatedButton(
            onPressed: () {
              setState(() {
                _counter = 0;
              });
            },
            child: Text('Reset'),
          ),
        ],
      ),
    );
  }
}
