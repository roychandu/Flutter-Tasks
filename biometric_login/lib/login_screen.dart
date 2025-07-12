import 'package:biometric_login/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

void _authenticate(BuildContext context) async {
  final LocalAuthentication auth = LocalAuthentication();
  try {
    bool authenticated = await auth.authenticate(
      localizedReason: 'Please authenticate to access the app',

      options: const AuthenticationOptions(
        useErrorDialogs: true,
        stickyAuth: false,
        // biometricOnly: true,
      ),
    );

    if (authenticated) {
      print('User authenticated successfully');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      print('Authentication failed');
    }
  } catch (e) {
    print('Error during authentication: $e');
  }
}

void _checkDeviceSupport() async {
  final LocalAuthentication auth = LocalAuthentication();
  bool canCheckBiometrics = await auth.canCheckBiometrics;
  bool isDeviceSupported = await auth.isDeviceSupported();

  if (isDeviceSupported) {
    print('Device supports biometrics');
    List<BiometricType> biometrics = await auth.getAvailableBiometrics();
    print(biometrics);
    if (biometrics.isNotEmpty) {
      print('Available biometrics: $biometrics');
    } else {
      print('No biometrics available');
    }
  } else {
    print('Device does not support biometrics');
  }
}

void customBiometricSheet(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  showModalBottomSheet(
    context: context,
    isDismissible: false,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: Colors.blueGrey[900],
    builder: (context) {
      return SizedBox(
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onLongPress: () {
                _authenticate(context);
              },
              child: Icon(
                Icons.fingerprint,
                color: Colors.white,
                size: screenWidth * 0.3,
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              'Please hold your finger at the\n fingerprint scanner to verfiy your\n identity',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(8),
                    ),
                  ),
                  child: Text(
                    'User Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _checkDeviceSupport();
    // _authenticate(context);
    Future.delayed(Duration.zero, () {
      customBiometricSheet(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold());
  }
}
