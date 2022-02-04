import 'package:apptodo_lovepeople/view/user/register_user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenVerification extends StatefulWidget {
  const TokenVerification({Key? key}) : super(key: key);

  @override
  State<TokenVerification> createState() => _TokenVerificationState();
}

class _TokenVerificationState extends State<TokenVerification> {
  
  @override
    void initState() {
    super.initState();
   tokenCheck().then(
      (value) {
        if (value) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const RegisterUserlogin(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const RegisterUserlogin(),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future<bool> tokenCheck() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('jwt') != null) {
      return true;
    } else {
      return false;
    }
  }
}