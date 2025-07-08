import 'package:calley_task/common_widgets/CustomElevated_button.dart';
import 'package:calley_task/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<StartScreen> {
  String username = '';
  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString("userName") ?? "";
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 50,
            bottom: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                spacing: 20,
                children: [
                  Container(
                    height: 95,
                    decoration: BoxDecoration(
                      color: Color(0xff2563EB),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: ListTile(
                        contentPadding: EdgeInsets.only(left: 30, right: 30),
                        leading: Image.asset('assets/profile.png'),
                        title: Text(
                          'Hello ${username}',
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          'Calley Personal',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xff1E3365),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 10,
                            bottom: 10,
                          ),
                          child: Text(
                            textAlign: TextAlign.center,
                            'If you are heree for the first time then ensure that you have uploaded the list to call from calley Web Panel hosted on https://app.getcalley.com',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Image.asset(
                          'assets/youtube_image.png',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                spacing: 10,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: BoxBorder.all(color: Colors.green, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(FontAwesomeIcons.whatsapp, color: Colors.green),
                  ),
                  Expanded(
                    child: CustomElevatedButton(
                      text: 'Star Calling New',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DashboardScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
