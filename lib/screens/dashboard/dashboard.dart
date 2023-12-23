import 'package:flutter/material.dart';
import 'package:larak_app/screens/dashboard/components/body.dart';
class Dashboard extends StatelessWidget {
  static String routeName = "/Dashboard";

  const Dashboard({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashbord",style: TextStyle(fontSize: 20)),
      ),
      body: const Body()
    );
  }
}