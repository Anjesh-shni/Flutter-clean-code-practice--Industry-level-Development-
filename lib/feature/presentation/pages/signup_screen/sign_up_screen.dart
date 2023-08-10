import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/constant/app_colors.dart';
import '../../bloc/signIn_bloc/sign_up_bloc.dart';
import '../../bloc/signIn_bloc/sign_up_event.dart';
import '../../bloc/signIn_bloc/sign_up_state.dart';
import '../../reusable_widget/custom_container_button.dart';
import '../../reusable_widget/custom_textform_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _retypePasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //logo

                  const SizedBox(height: 40),
                  //Sign up form
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 64,
                        backgroundImage: const AssetImage("assets/logo.jpeg"),
                        backgroundColor: Colors.grey.withOpacity(0.4),
                      ),
                      Positioned(
                        left: 80,
                        bottom: -10,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_a_photo),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),

                  TextFormFieldInput(
                    textEditingController: _userNameController,
                    isPass: false,
                    hinText: "Enter your username",
                    textInputType: TextInputType.text,
                    onChanged: (String value) {
                      context.read<SignUpBloc>().add(
                            UserNameEvent(value),
                          );
                    },
                    titleText: 'User Name',
                  ),
                  const SizedBox(height: 30),

                  //Text input field for email
                  TextFormFieldInput(
                    textEditingController: _emailController,
                    isPass: false,
                    hinText: "Enter your email",
                    textInputType: TextInputType.emailAddress,
                    onChanged: (String value) {
                      context.read<SignUpBloc>().add(
                            EmailEvent(value),
                          );
                    },
                    titleText: 'Email',
                  ),
                   const SizedBox(height: 30),

                  //Text input field for phone
                  TextFormFieldInput(
                    textEditingController: _phoneController,
                    isPass: false,
                    hinText: "Enter your number",
                    textInputType: TextInputType.number,
                    onChanged: (String value) {
                      context.read<SignUpBloc>().add(
                            EmailEvent(value),
                          );
                    },
                    titleText: 'Phone number',
                  ),
                  const SizedBox(height: 30),

                  //Text input field for password
                  TextFormFieldInput(
                    textEditingController: _passwordController,
                    isPass: true,
                    hinText: "Enter your password",
                    textInputType: TextInputType.text,
                    onChanged: (String value) {
                      context.read<SignUpBloc>().add(
                            PasswordEvent(value),
                          );
                    },
                    titleText: 'Password',
                  ),
                  const SizedBox(height: 30),

                  //Text input field for password
                  TextFormFieldInput(
                    textEditingController: _retypePasswordController,
                    isPass: true,
                    hinText: "Re-type your password",
                    textInputType: TextInputType.text,
                    onChanged: (String value) {
                      context.read<SignUpBloc>().add(
                            RetypePasswordEvent(value),
                          );
                    },
                    titleText: 'Re-type password',
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "By clicking on create account,\nyou are agreeing our terms and condition, fair enough.",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 80),

                  //Log In Button
                  CustomButtonC(
                    width: double.infinity,
                    text: "Create account",
                    color: green,
                    height: 45,
                    onTap: () async {
                      debugPrint("Account create tapped");
                      // SigUpController(context).handleSignUp("email");
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(height: 50),

                  //Create account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: const Text("Already have an account ? "),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/sign_in");
                        },
                        child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: const Text(
                            "Log In.",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: blueColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _retypePasswordController.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
  }
}
