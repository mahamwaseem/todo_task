import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List of tasks
  final List<String> tasks = [
    'MEETING',
    'ONAIR RADIO APP DESIGN',
    'REPLY TO EMAILS',
    'PAY BILLS',
    'DESIGN "DAILY UI"',
    'SEND PROJECT'
  ];

  // List of times for each task
  final List<String> times = [
    '07:30 AM',
    '08:00 AM',
    '10:30 AM',
    '11:30 AM',
    '01:00 PM',
    '03:00 PM'
  ];

  // List to keep track of the checked state
  List<bool> isChecked = List.generate(6, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Container (Purple Accent)
          Container(
            color: Colors.purpleAccent,
            width: double.infinity,
            height: double.infinity,
          ),
          // First Container (Purple Accent, Positioned at the top)
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 400,
              height: 230,
              color: Colors.purpleAccent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100, left: 20),
                    child: Text(
                      'Good morning',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Pathum',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Positioned Text
          Positioned(
            top: 180, // Adjust top position as needed
            left: 20, // Adjust left position as needed
            child: Text(
              'Today Task ToDo 11 OCTOBER 2019',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
          // Second Container (Grey, Positioned at the bottom)
          Positioned(
            top: 230, // Positioned from the top of the screen
            left: 1, // Positioned from the left
            child: Container(
              width: 391,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10), // Adjust top padding if needed
                  child: Text(
                    'CREATE TO DO LIST',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ),
            ),
          ),
          // Third Container (White, Positioned below the grey container)
          Positioned(
            top: 290, // Adjusted to be below the grey container
            left: 1, // Positioned from the left
            child: Container(
              width: 391,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ListView.separated(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Container(
                      width: 40, // Width of the square
                      height: 40, // Height of the square
                      decoration: BoxDecoration(
                        color: Colors.blue, // Background color of the square
                        borderRadius: BorderRadius.circular(10), // Circular corners
                      ),
                    ),

                    title: Text(tasks[index]),
                    subtitle: Text(times[index]), // Display time for each task
                    trailing: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: IconButton(
                        icon: Icon(
                          isChecked[index]
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                          color: isChecked[index] ? Colors.green : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            isChecked[index] = !isChecked[index];
                          });
                        },
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  height: 1,
                  color: Colors.grey[300],
                  thickness: 1,// Color for the separator
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
