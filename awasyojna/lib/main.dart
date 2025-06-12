// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(AwasYojanaApp());
}

class AwasYojanaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Awas Yojana',
      theme: ThemeData(primarySwatch: Colors.red),
      home: AwasYojanaPage(),
    );
  }
}

class AwasYojanaPage extends StatefulWidget {
  @override
  _AwasYojanaPageState createState() => _AwasYojanaPageState();
}

class _AwasYojanaPageState extends State<AwasYojanaPage> {
  late Timer _timer;
  Duration _remainingTime =
      const Duration(days: 29, hours: 23, minutes: 55, seconds: 51);

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime.inSeconds > 0) {
          _remainingTime = _remainingTime - const Duration(seconds: 1);
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Awas Yojana'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/aawas.png',
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const Text(
                  'Welcome to Aawas Yojana',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // About The Scheme
                  const Text(
                    'About The Scheme',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Welcome to Aawas Yojana, a dedicated platform committed to turning dreams of permanent residency into reality for those in need. Join us in creating a world where everyone has a place to call home.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  // Residential Flats Offered
                  const Text(
                    'Residential Flats Offered',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '2 BHK Flats',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Layout: Two bedrooms, a living room, kitchen, and one or two bathrooms. The exact carpet area is not specified; however, 2 BHK flats in Aawas Yojana range from 800 to 1,200 square feet.',
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Register Now'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Allotment Process
                  const Text(
                    'Allotment Process',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    children: [
                      _buildProcessStep('Coupon Registration',
                          'Eligible applicants submit coupons online.'),
                      _buildProcessStep('Lucky Draw',
                          'Randomly selects eligible applicants.'),
                      _buildProcessStep('Flat Allotment',
                          'Allotment is assigned to the selected applicants.'),
                      _buildProcessStep(
                          'Registry', 'Legal documentation is processed.'),
                      _buildProcessStep('Possession',
                          'The flat is handed over to the applicant.'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Registration Timer
                  const Text(
                    'Registration Open',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCountdownTile(
                          'Days', _remainingTime.inDays.toString()),
                      _buildCountdownTile(
                          'Hours', (_remainingTime.inHours % 24).toString()),
                      _buildCountdownTile('Minutes',
                          (_remainingTime.inMinutes % 60).toString()),
                      _buildCountdownTile('Seconds',
                          (_remainingTime.inSeconds % 60).toString()),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Supported By
                  const Text(
                    'Supported By',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/contract.png', height: 50),
                      Image.asset('assets/cropped-LOGO50.png', height: 50),
                      Image.asset('assets/mobilegb.png', height: 50),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Footer
                  const Center(
                    child: Text(
                      'All rights reserved © Awas Yojana',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProcessStep(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const Icon(Icons.circle, color: Colors.red, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(description, style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCountdownTile(String label, String value) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
