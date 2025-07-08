import 'package:calley_task/common_widgets/CustomElevated_button.dart';
import 'package:calley_task/common_widgets/Custom_drawer_items.dart';
import 'package:calley_task/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DashboardScreen> {
  String username = '';
  String email = '';

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString("userName") ?? "";
      email = prefs.getString("email") ?? "";
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Container(
          width: 300,
          decoration: BoxDecoration(
            color: Color(0xffeef7ff),
            borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
            children: [
              Container(
                height: 95,
                decoration: BoxDecoration(
                  color: Color(0xff2563EB),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 30, right: 30),
                    leading: Image.asset('assets/profile.png'),
                    title: RichText(
                      text: TextSpan(
                        text: '${username}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: ' . Personal',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFC778),
                            ),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Text(
                      '${email}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              CustomDrawerItems(
                text: 'Getting Started',
                image: Image.asset('assets/rocket.png'),
              ),
              CustomDrawerItems(
                text: 'Sync Data',
                image: Image.asset('assets/sync_data.png'),
              ),
              CustomDrawerItems(
                text: 'Gamification',
                image: Image.asset('assets/box_menu.png'),
              ),
              CustomDrawerItems(
                text: 'Send Logs',
                image: Image.asset('assets/send_logs.png'),
              ),
              CustomDrawerItems(
                text: 'Settings',
                image: Image.asset('assets/settings.png'),
              ),
              CustomDrawerItems(
                text: 'Help?',
                image: Image.asset('assets/help.png'),
              ),
              CustomDrawerItems(
                text: 'Cancel Subscription',
                image: Image.asset('assets/cancel_subscription.png'),
              ),
              Divider(thickness: 2),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  'App Info',
                  style: TextStyle(
                    color: Color(0xff2563EB),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              CustomDrawerItems(
                text: 'About Us',
                image: Image.asset('assets/about.png'),
              ),
              CustomDrawerItems(
                text: 'Privacy Policy',
                image: Image.asset('assets/privacy_policy.png'),
              ),
              CustomDrawerItems(
                text: 'Version 1.01.52',
                image: Image.asset('assets/version.png'),
              ),
              CustomDrawerItems(
                text: 'Share App',
                image: Image.asset('assets/share.png'),
              ),
              CustomDrawerItems(
                text: 'Logout',
                image: Image.asset('assets/logout.png'),
              ),
            ],
          ),
        ),

        appBar: AppBar(
          backgroundColor: Color(0xffF8FAFC),
          title: Text(
            'Dashboard',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            Image.asset('assets/customer.png'),
            SizedBox(width: 15),
            Image.asset('assets/notification.png'),
            SizedBox(width: 20),
          ],
        ),
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
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            textAlign: TextAlign.center,
                            'LOAD NUMBER TO CALL',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Color(0xffCBD5E1)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(26),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: 'Visit ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      height: 1.5,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'https://app.getcalley.com ',
                                        style: TextStyle(
                                          color: Color(0xff2563eb),
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            'to upload numbers that you wish to call using Calley Mobile App.',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Image.asset(
                                'assets/person_image.png',
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
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
                            builder: (context) => SettingScreen(),
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
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffeef7ff),
              border: Border.all(color: Color(0xff2563EB), width: 2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: BottomAppBar(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/home.png'),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/card.png'),
                  ),
                  Container(
                    width: 70,
                    decoration: BoxDecoration(
                      color: Color(0xff2563EB),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/play_icon.png'),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/call.png'),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/celender.png'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
