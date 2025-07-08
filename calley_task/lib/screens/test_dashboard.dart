import 'package:calley_task/common_widgets/CustomElevated_button.dart';
import 'package:calley_task/common_widgets/Custom_drawer_items.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestDashboard extends StatefulWidget {
  const TestDashboard({super.key});

  @override
  State<TestDashboard> createState() => _TestDashboardState();
}

class _TestDashboardState extends State<TestDashboard> {
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

  final ColorList = [Color(0xff9566f2), Color(0xfffaab3c), Color(0xff1f74ec)];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width / 3.2; // same radius you had

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
          padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffCBD5E1)),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: ListTile(
                    title: Text(
                      'Test List',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: RichText(
                      text: TextSpan(
                        text: '50',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff2563EB),
                        ),
                        children: [
                          TextSpan(
                            text: ' CALLS',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    trailing: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff2563EB),
                      ),
                      child: Center(
                        child: Text(
                          'S',
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 100),
              SizedBox(
                width: size,
                height: size,
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 10,
                    centerSpaceRadius: size / 2,
                    startDegreeOffset: 150,
                    sections: [
                      PieChartSectionData(
                        value: 22,
                        color: ColorList[1],
                        showTitle: false,
                        radius: size / 2.5,
                      ),
                      PieChartSectionData(
                        value: 28,
                        color: ColorList[2],
                        showTitle: false,
                        radius: size / 2.5,
                      ),
                      PieChartSectionData(
                        value: 9,
                        color: ColorList[0],
                        showTitle: false,
                        radius: size / 2,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 200),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                spacing: 10,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffFEF0DB),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        spacing: 10,
                        children: [
                          Image.asset('assets/Rectangle_orange.png'),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pending',
                                style: TextStyle(fontWeight: FontWeight.w800),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: '28 ',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    height: 1.2,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Calls',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffDDFCE0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        spacing: 10,
                        children: [
                          Image.asset('assets/Rectangle_green.png'),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Done',
                                style: TextStyle(fontWeight: FontWeight.w800),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: '22 ',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    height: 1.2,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Calls',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffF3EEFE),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        spacing: 10,
                        children: [
                          Image.asset('assets/Rectangle_blue.png'),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Schedule',
                                style: TextStyle(fontWeight: FontWeight.w800),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: '09 ',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    height: 1.2,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Calls',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      text: 'Star Calling Now',
                      onPressed: () {},
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
