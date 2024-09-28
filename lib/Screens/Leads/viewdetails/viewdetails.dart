import 'package:flutter/material.dart';

class Viewdetails extends StatefulWidget {
  const Viewdetails({super.key});

  @override
  State<Viewdetails> createState() => _ViewdetailsState();
}

class _ViewdetailsState extends State<Viewdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Details'),
      ),
    );
  }
}