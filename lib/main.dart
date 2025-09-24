import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rocket Launch Controller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  Color _outlineColor() {
    if (_counter >= 80) return Colors.green;
    if (_counter >= 50) return Colors.yellow;
    return Colors.red;
  }

  Color _textColor() => Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rocket Launch Controller'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Countdown / Liftoff display
          Center(
            child: Container(
              width: 260,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: _counter == 100 ? Colors.transparent : _outlineColor(),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: _counter == 100
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                          'https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExM2FqaWJkYnNkeXhhZmo4Y3Q3NTFyeGh3Z3puZ3hmYnl3OWl4N2plcSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9cw/5G1VDKTWdvuVFa3TaM/giphy.gif',
                          height: 180,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'LIFTOFF!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[900],
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    )
                  : Text(
                      '$_counter',
                      style: TextStyle(
                        fontSize: 50.0,
                        color: _textColor(),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),

          const SizedBox(height: 40),

          // Slider
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

          const SizedBox(height: 20),

          // Control buttons
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (_counter < 100) _counter += 1;
              });
            },
            child: const Text('Ignite'),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (_counter > 0) _counter -= 1;
              });
            },
            child: const Text('Abort'),
          ),
          const SizedBox(height: 12),
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