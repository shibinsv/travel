import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:initial_test/utils/constants.dart';
import 'package:initial_test/widgets/customWidgets.dart';

import '../../bloc/login/login_bloc.dart';
import 'dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static navigateToLogin(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  static String? error;
  static bool isPasswordShown = true;
  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Stack(
            children: [
              Column(
                children: [
                  const SizedBox(height: 30.0),
                  LogoImage(
                    width: MediaQuery.of(context).size.width,
                  ),
                  const SizedBox(height: 50.0),
                  const HeaderTextField(text: StringConstants.login),
                  const SizedBox(height: 30.0),
                  CommonPadding(
                    child: CustomTextFormField(
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (value) {
                        _bloc.add(LoginTextChanged(
                            phoneController.text, passwordController.text));
                      },
                      hintText: StringConstants.enterNumber,
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Text(
                    (state is LoginErrorState) ? state.numberError : "",
                    style: const TextStyle(color: Colors.red),
                  ),
                  CommonPadding(
                    child: CustomTextFormField(
                      onChanged: (value) {
                        _bloc.add(LoginTextChanged(
                            phoneController.text, passwordController.text));
                        // setState(() {
                        //   error = Validations.passwordValidation(value);
                        // });
                      },
                      hintText: StringConstants.enterPassword,
                      controller: passwordController,
                    ),
                  ),
                  Text(
                    (state is LoginErrorState) ? state.passwordError : "",
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 30.0),
                  //login
                  CustomMaterialButton(
                    buttonText: StringConstants.login,
                    onPressed: (state is LoginValidState)
                        ? () {
                            _bloc.add(LoginLoadingEvent());
                            Future.delayed(
                                const Duration(milliseconds: 2000),
                                () => {
                                      DashboardScreen.navigateToDashboard(
                                          context)
                                    });
                          }
                        : null,
                  )
                ],
              ),
              Visibility(
                  child: const ProgressBar(),
                  visible: (state is LoginLoadingState))
            ],
          );
        },
      ),
    );
  }
}

// //Returning string using a function
// // String getName() {
// //   return "Hello";
// // }
// //similar to the above lines
// String getName() => "Hello";

// extension ExtraHandle on Text {
//   String getDuplicate() => "Kon";
// }

// class TestClass {
//   int varia = 30;
//   String namee = "lo";

//   // void test() {
//   //   List<String> names = ["nj", "mvsmv"];
//   // }

//   //Anonymous functions
// //  var add =  (int num) => {

// //   };
// }
