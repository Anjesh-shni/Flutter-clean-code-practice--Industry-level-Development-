import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_app/feature/presentation/bloc/login_bloc/log_in_bloc.dart';
import 'package:pos_app/feature/presentation/reusable_widget/big_text.dart';
import 'package:pos_app/feature/presentation/reusable_widget/small_text.dart';
import '../../../../utils/constant/app_colors.dart';
import '../../bloc/login_bloc/log_in_event.dart';
import '../../bloc/login_bloc/log_in_state.dart';
import '../../reusable_widget/custom_container_button.dart';
import '../../reusable_widget/custom_textform_field.dart';
import '../../reusable_widget/password_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, AuthenticState>(builder: (context, state) {
      return Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            color: mainColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                      color: Color(0xff1F1D2B),
                      image: DecorationImage(
                        image: AssetImage("assets/img5.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      color: Color(0xff1F1D2B),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BigText(
                            text: "Restro X Evakon",
                            color: Colors.white,
                            size: 35,
                          ),
                          SmallText(
                            text: "Login to your cccount",
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(height: 40),
                          //username
                          // Text input field  for email
                          TextFormFieldInput(
                            textEditingController: _emailController,
                            isPass: false,
                            hinText: "evakon77@gmail.com",
                            textInputType: TextInputType.emailAddress,
                            onChanged: (value) {
                              context.read<SignInBloc>().add(
                                    EmailEvent(
                                      value,
                                    ),
                                  );
                            },
                            titleText: 'Email Address',
                          ),

                          const SizedBox(height: 20),

                          //Text input field for password
                          PassFormFieldInput(
                            textEditingController: _passwordController,
                            isPass: true,
                            hinText: "evakon@12345",
                            textInputType: TextInputType.text,
                            onChanged: (value) {
                              context.read<SignInBloc>().add(
                                    PasswordEvent(
                                      value,
                                    ),
                                  );
                            },
                            titleText: 'Password',
                          ),
                          const SizedBox(height: 10),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  //  Navigator.pushNamed(context, "/application");
                                },
                                child: Container(
                                    height: 25,
                                    width: 120,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _rememberMe = !_rememberMe;
                                            });
                                          },
                                          child: _rememberMe
                                              ? Container(
                                                  color: Colors.white,
                                                  width: 10,
                                                  height: 10,
                                                )
                                              : const Icon(
                                                  Icons.check,
                                                  color: Colors.green,
                                                  size: 14,
                                                ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SmallText(
                                          text: "Remember me",
                                          color: Colors.white,
                                          size: 12,
                                        ),
                                      ],
                                    )),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, "/reset-password");
                                },
                                child: Container(
                                  height: 25,
                                  width: 120,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 6),
                                  child: SmallText(
                                    text: "Forgot password?",
                                    color: blueColor,
                                    size: 11,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 50),

                          //Log In Button
                          CustomButtonC(
                            width: double.infinity,
                            text: "Log In",
                            color: button,
                            height: 35,
                            onTap: () {
                              // SignInController(context).handleSignIn("email");
                              Navigator.pushNamed(context, "/app");
                            },
                          ),

                          const SizedBox(height: 20),
                          //Create account
                          CustomButtonC(
                            width: double.infinity,
                            text: "Cancel",
                            color: chatBackGround,
                            height: 35,
                            onTap: () {
                              // Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
}
