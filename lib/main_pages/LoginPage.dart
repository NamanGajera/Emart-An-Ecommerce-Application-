import 'package:emart/BottomNavPage/Cart.dart';
import 'package:emart/widgets/CheckOut.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 233, 232, 232),
        appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 233, 232, 232)),
        body: Container(
          margin: const EdgeInsets.only(left: 25, right: 25),
          child: Form(
            child: Column(
              children: [
                const SizedBox(height: 15),
                const Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: '\t\t\tEmail-Id',
                    fillColor: Colors.white38,
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.email,
                    ),
                  ),
                  validator: MultiValidator(
                      [RequiredValidator(errorText: 'Enter Email-Id')]),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: '\t\t\tPassword',
                    fillColor: Colors.white38,
                    filled: true,
                    prefixIcon: const Icon(Icons.lock),
                  ),
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Enter Password'),
                  ]),
                ),
                const SizedBox(height: 12),
                Container(
                  alignment: Alignment.centerRight,
                  child: const Text('Forgot Password ?'),
                ),
                const SizedBox(height: 22),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.deepPurple[100],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      onPressed: () async {
                        var sharedPref = await SharedPreferences.getInstance();
                        sharedPref.setBool(CartState.KEYLOGIN, true);
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return CheckOutPage(
                            Price: '0',
                          );
                        }));
                      },
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(fontSize: 18),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
