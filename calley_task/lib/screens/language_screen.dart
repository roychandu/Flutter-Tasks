import 'package:calley_task/common_widgets/CustomElevated_button.dart';
import 'package:calley_task/screens/login%20and%20register%20screens/register_screen.dart';
import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
          child: Column(
            spacing: 20,
            children: [
              Text(
                'Choose Your Language',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xffCBD5E1), width: 2),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          'English',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          'Hi',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        trailing: Icon(Icons.radio_button_checked),
                      ),
                      ListTile(
                        title: Text(
                          'Hindi',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          'नमस्ते',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        trailing: Icon(Icons.radio_button_off),
                      ),
                      ListTile(
                        title: Text(
                          'Bengali',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          'হ্যালো',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        trailing: Icon(Icons.radio_button_off),
                      ),
                      ListTile(
                        title: Text(
                          'Kannada',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          'ಹಲೋ',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        trailing: Icon(Icons.radio_button_off),
                      ),
                      ListTile(
                        title: Text(
                          'Punjabi',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          'ਹੈਲੋ',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        trailing: Icon(Icons.radio_button_off),
                      ),
                      ListTile(
                        title: Text(
                          'Tamil',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          'வணக்கம்',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        trailing: Icon(Icons.radio_button_off),
                      ),
                      ListTile(
                        title: Text(
                          'Telugu',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          'హలో',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        trailing: Icon(Icons.radio_button_off),
                      ),
                      ListTile(
                        title: Text(
                          'French',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          'Bonjour',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        trailing: Icon(Icons.radio_button_off),
                      ),
                      ListTile(
                        title: Text(
                          'Spanish',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          'Hola',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        trailing: Icon(Icons.radio_button_off),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  text: 'Select',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
