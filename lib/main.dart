import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(RoleBasedApp());
}

class RoleBasedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Role Based App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> roles = [
    "QP Bank Maker",
    "QP Selector",
    "QP Printer",
    "Logistics",
    "Centre Admin",
    "Invigilator",
    "Receiver at Destination",
    "Centre Selector",
    "Sender to Centre"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Choose Your Role")),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: roles.length,
        itemBuilder: (context, index) {
          return ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InputPage(role: roles[index]),
                ),
              );
            },
            child: Text(roles[index]),
          );
        },
      ),
    );
  }
}