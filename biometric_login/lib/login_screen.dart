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
      authMessages: <AuthMessages>[
        AndroidAuthMessages(
          signInTitle: 'Biometric Login',
          cancelButton: 'Cancel',
        ),
      ],
      options: const AuthenticationOptions(
        useErrorDialogs: true,
        stickyAuth: true,
      ),
    );

    if (authenticated) {
      print('User authenticated successfully');
      Navigator.push(
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

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _checkDeviceSupport();
    _authenticate(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold());
  }
}
