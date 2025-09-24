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

  // returns the outline color based on the current counter value
  Color _outlineColor() {
    if (_counter >= 80) return Colors.green;
    if (_counter >= 50) return Colors.yellow;
    return Colors.red;
  }

  //text color
  Color _textColor() {
    return Colors.white;
  }

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
          // Display the current counter value in a box
          Center(
            child: Container(
              width: 200,
              height: 120,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: _outlineColor(),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                // to display current number
                '$_counter',
                style: TextStyle(fontSize: 50.0, color: _textColor()),
              ),
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
          // Add a slider to adjust the counter value
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
          // Add a button to increment the counter
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (_counter < 100) _counter += 1;
              });
            },
            child: const Text('Ignite'),
          ),
          // Add "Decrement" button
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (_counter > 0) _counter -= 1;
              });
            },
            child: const Text('Abort'),
          ),
          // reset button
          ElevatedButton(
            onPressed: () {
              setState(() {
                _counter = 0;
              });
            },
            child: const Text('Reset'),
          ),
        ],
      ),
    );
  }
}
