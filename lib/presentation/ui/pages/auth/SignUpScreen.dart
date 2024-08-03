import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:my_flutter_app/data/models/User.dart';
import 'package:my_flutter_app/data/data_source/ResponseModel.dart';
import 'package:my_flutter_app/logic/providers/UserViewProvider.dart';
import 'package:my_flutter_app/presentation/ui/layout/MainWraper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  late UserViewProvider userProvider;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserViewProvider>(context);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return const Text('Max Width');
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Center(
                    child: Lottie.asset('lotties/waiting.json',
                        height: height * 0.2,
                        width: width * 0.5,
                        fit: BoxFit.contain),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.ubuntu(
                      fontSize: height * 0.035,
                      color: Theme.of(context).unselectedWidgetColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Create Account',
                    style: GoogleFonts.ubuntu(
                      fontSize: height * 0.035,
                      color: Theme.of(context).unselectedWidgetColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: 'Username',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                          ),
                          controller: nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter username';
                            } else if (value.length < 4) {
                              return 'at least enter 4 characters';
                            } else if (value.length > 18) {
                              return 'maximum character is 18';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: 'Gmail',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                          ),
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter gmail';
                            } else if (!value.endsWith('@gmail.com')) {
                              return 'please enter valid gmail';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                            hintText: 'Password',
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                          ),
                          controller: passwordController,
                          obscureText: _isObscure,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter password';
                            } else if (value.length < 7) {
                              return 'at least enter 7 characters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        Text(
                          'Creating an account means you\'re okey with our Terms of Services and our ',
                          style: GoogleFonts.ubuntu(
                            fontSize: height * 0.015,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        // SignupBtn()

                        Consumer<UserViewProvider>(
                          builder: (context, userViewProvider, child) {
                            switch (userViewProvider.state?.status) {
                              case Status.LOADING:
                                return const CircularProgressIndicator();
                              case Status.ERROR:
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SignupBtn(),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.error,
                                          color: Colors.redAccent,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          userViewProvider.state!.message,
                                          style: GoogleFonts.ubuntu(
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              case Status.COMPLETED:
                                savedLogin(userViewProvider.state!.data);
                                WidgetsBinding.instance!.addPostFrameCallback(
                                  (timeStamp) => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const MainWraper(),
                                    ),
                                  ),
                                );
                                return SignupBtn();
                              default:
                                return SignupBtn();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }

  Widget SignupBtn() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        onPressed: () => {
          if (_formKey.currentState!.validate())
            {
              userProvider.callRegisterApi(nameController.text,
                  emailController.text, passwordController.text)
            }
        },
        child: const Text("Sign Up"),
      ),
    );
  }

  Future<void> savedLogin(User user) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('access_token', user.accessToken!);
    prefs.setBool('loggedIn', true);
  }
}
