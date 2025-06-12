import 'dart:ui';

import 'package:flutter/material.dart';

class CardFreez extends StatefulWidget {
  const CardFreez({super.key});

  @override
  State<CardFreez> createState() => _CardFreezState();
}

class _CardFreezState extends State<CardFreez> {
  ValueNotifier<bool> toggle = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0D0D0D),
      appBar: AppBar(
        title: Text(
          'select payment mode',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        backgroundColor: Color(0xff0D0D0D),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'choose your perferred payment method to make payment.',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 96,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.black,
                      border: Border(top: BorderSide(color: Colors.white)),
                    ),
                    child: Center(
                      child: Text(
                        'pay',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 96,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.black,
                      border: Border(top: BorderSide(color: Colors.red)),
                    ),
                    child: Center(
                      child: Text(
                        'card',
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 100),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('YOUR DIGITAL DEBIT CARD', style: TextStyle()),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                ValueListenableBuilder(
                  valueListenable: toggle,
                  builder: (context, value, child) {
                    if (!value) {
                      return Container(
                        width: 186,
                        height: 269,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                    width: 50,
                                    'assets/yolo_icon.png',
                                    fit: BoxFit.contain,
                                  ),
                                  Image.asset('assets/yes_bank.png'),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(),
                            SizedBox(height: 20),
                            Row(),
                            SizedBox(height: 10),
                            Container(),
                          ],
                        ),
                      );
                    }
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          width: 186,
                          height: 269,

                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/freeze_image.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(width: 30),
                Column(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: toggle,
                      builder: (context, value, child) {
                        return InkWell(
                          onTap: () {
                            toggle.value = !toggle.value;
                          },
                          child: Container(
                            width: 58,
                            height: 58,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: toggle.value ? Colors.red : Colors.white,
                              ),
                            ),
                            child: toggle.value
                                ? Icon(Icons.ac_unit, color: Colors.red)
                                : Icon(Icons.ac_unit, color: Colors.white),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 4),
                    ValueListenableBuilder(
                      valueListenable: toggle,
                      builder: (context, value, child) {
                        return Text(
                          'unfreeze',
                          style: TextStyle(
                            color: toggle.value ? Colors.red : Colors.white,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
