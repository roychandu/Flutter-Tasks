import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
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
    _checkDeviceSupport();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold());
  }
}
